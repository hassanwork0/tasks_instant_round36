# Task 5: Product List Screen with 4 States

## Project Design Mockups

The following images represent the expected UI states and component structures for this task:

<div align="center">
  <table>
    <tr>
      <td align="center" width="50%">
        <img src="https://i.postimg.cc/CLQ08L7Q/f9b4dab7-e363-46e9-95fa-ff44220d624a.jpg" alt="Loading/Shimmer State" width="300"/>
        <br><em>Loading / Shimmer State</em>
      </td>
      <td align="center" width="50%">
        <img src="https://i.postimg.cc/T2kv8Yzw/a1483d70-8769-4947-87ce-df9e050bc0ed.jpg" alt="Success State with Products" width="300"/>
        <br><em>Success State with Products</em>
      </td>
    </tr>
    <tr>
      <td align="center" width="50%">
        <img src="https://i.postimg.cc/kXB37PCK/e43d54dd-d8c3-4e14-8385-0e34b8a79cfa.jpg" alt="Empty State" width="300"/>
        <br><em>Empty State (No products)</em>
      </td>
      <td align="center" width="50%">
        <img src="https://i.postimg.cc/Fs8tRCsQ/a11555e6-14e9-4666-ac38-0618c61d0f01.jpg" alt="Failure State" width="300"/>
        <br><em>Failure State (Error loading)</em>
      </td>
    </tr>
  </table>
</div>

**Goal:** Implement a Product List screen in Flutter using the BLoC pattern. The application must handle **3 specific states**: Loading, Success (with products or empty), and Failure. The UI must match the provided screenshots.

**Key Note:**
**Do not provide any additional code, packages, or dependencies** beyond what is explicitly shown in the provided screenshots. All data types, state management classes, and UI widgets should be precisely reflected as they appear in the screenshots. Note the specific spelling of words like "prodcuts" in the empty state.

## Project Structure & Architecture

Based on the screenshots, your project must follow this exact folder structure:

```text
lib/
├── core/
│   └── widgets/
├── features/
│   └── products/
│       ├── data/
│       │   ├── dummy_data.dart
│       │   └── product.dart
│       └── presentation/
│           ├── cubit/
│           │   ├── products_cubit.dart
│           │   └── products_state.dart
│           ├── screens/
│           │   ├── adaptive.dart
│           │   └── products_screen.dart
│           └── widgets/
│               └── product_item.dart
```

## 1. Data Layer: `product.dart`

Create a `Product` model class with the following properties and computed getters as shown in the screenshots.

- **Fields:** `id` (int), `name` (String), `description` (String), `price` (double), `oldPrice` (double?), `image` (String), `category` (String), `rating` (double), `reviewsCount` (int), `isAvailable` (bool).
- **Constructor:** A const constructor with default values for `rating` (0), `reviewsCount` (0), and `isAvailable` (true).
- **Computed Getters:**
  - `bool get hasDiscount`: Returns true if `oldPrice` is not null and `oldPrice > price`.
  - `double get discountPercentage`: Calculates the percentage discount if `hasDiscount` is true, otherwise returns 0.
  - `String get discountPercentageText`: Returns the `discountPercentage` as a string fixed to 0 decimal places.
  - `int get discountPercentageInt`: Returns the rounded integer of the `discountPercentage`.

**Implement the class exactly as follows:**

```dart
class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final double? oldPrice;
  final String image;
  final String category;
  final double rating;
  final int reviewsCount;
  final bool isAvailable;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.oldPrice,
    required this.image,
    required this.category,
    this.rating = 0,
    this.reviewsCount = 0,
    this.isAvailable = true,
  });

  bool get hasDiscount => oldPrice != null && oldPrice! > price;

  double get discountPercentage =>
      hasDiscount ? ((oldPrice! - price) / oldPrice!) * 100 : 0;

  String get discountPercentageText =>
      discountPercentage.toStringAsFixed(0);

  int get discountPercentageInt => discountPercentage.round();
}
```

## 2. State Management: `products_state.dart`

Implement a sealed class `ProductsState` with 4 subclasses to handle the UI states:

1.  `ProductsInitialState`
2.  `ProductsLoadingState`
3.  `ProductsLoadedState` (Contains a required `List<Product> products` field)
4.  `ProductsFailureState` (Contains a required `String errorMessage` field)

**Implement the states exactly as follows:**

```dart
part of 'products_cubit.dart';

sealed class ProductsState {}

final class ProductsInitialState extends ProductsState {}

final class ProductsLoadingState extends ProductsState {}

final class ProductsLoadedState extends ProductsState {
  final List<Product> products;
  ProductsLoadedState({required this.products});
}

final class ProductsFailureState extends ProductsState {
  final String errorMessage;
  ProductsFailureState({required this.errorMessage});
}
```

## 3. Business Logic: `products_cubit.dart`

- Create a `ProductsCubit` that extends `Cubit<ProductsState>`.
- **Method:** `Future<void> getProducts()`
  - **Step 1:** Emit `ProductsLoadingState()`.
  - **Step 2:** Wait for a delay of **1500 milliseconds** (`Future.delayed`) to simulate a network request.
  - **Step 3:** Generate a random integer between 0 and 2 (inclusive) to decide the state outcome.
  - **Step 4:** Implement the state switching logic:
    - **State 0:** Emit `ProductsFailureState(errorMessage: 'Loading failed!')`.
    - **State 1:** Emit `ProductsLoadedState(products: [])` (Empty list).
    - **State 2:** Emit `ProductsLoadedState(products: products)` (Populated list using a pre-existing variable `products` from a hypothetical `dummy_data.dart`).

**Implement the Cubit exactly as follows:**

```dart
class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitialState());

  Future<void> getProducts() async {
    emit(ProductsLoadingState());

    await Future.delayed(const Duration(milliseconds: 1500));

    final int prodcutsCase = Random().nextInt(3);

    // Failure => error message
    // Loaded => but List is empty => size = 0
    // Loaded => size = 6
    if (prodcutsCase == 0) {
      emit(ProductsFailureState(errorMessage: 'Loading failed!'));
    }

    if (prodcutsCase == 1) {
      emit(ProductsLoadedState(products: []));
    }

    if (prodcutsCase == 2) {
      emit(ProductsLoadedState(products: products)); // Assumes a global 'products' list exists from dummy_data.dart
    }
  }
}
```

## 4. UI Implementation: `products_screen.dart`

Create a `_ProductsScreenState` widget that uses `BlocBuilder<ProductsCubit, ProductsState>` inside a `Scaffold`.

- The AppBar must have the title `'Products'`.
- **`initState` override:** Call `context.read<ProductsCubit>().getProducts();`.
- **`build` method:** Switch over the state and return the specific widgets defined below.

**Implement the scaffold and builder exactly as follows:**

```dart
class _ProductsScreenState extends State<ProductsScreen> {
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          switch (state) {
            case ProductsInitialState():
              return const SizedBox();
            case ProductsLoadingState():
              return const ProductShimmer();
            case ProductsLoadedState():
              return state.products.isEmpty
                  ? const ProductsEmpty()
                  : ProductsList(products: state.products);
            case ProductsFailureState():
              return const ProductsFailure();
          }
        },
      ),
    );
  }
}
```

## 5. Custom UI Widgets (Defined inside `products_screen.dart`)

**A. `ProductShimmer` Widget:**
Return a `ListView.builder` with exactly `3` items.

- Use `Shimmer.fromColors` with `baseColor: Colors.grey.shade300` and `highlightColor: Colors.grey.shade100`. (Note: `Shimmer` is a widget from the `shimmer` package, which is assumed to be installed based on the screenshot context).
- The child should be a `Container` with `width: double.infinity`, `height: 450`, `margin: EdgeInsets.all(12)`, and rounded corners.

```dart
class ProductShimmer extends StatelessWidget {
  const ProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: double.infinity,
            height: 450,
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        );
      },
    );
  }
}
```

**B. `ProductsEmpty` Widget:**

- Center a `Column` aligned to the vertical center (`MainAxisSize.min`).
- Display an `Icon(Icons.data_array, size: 88)`.
- Display a `Text` widget with the text **`'No prodcuts found!''`** (exact spelling and typo as shown in the screenshot) and `fontSize: 22`.

```dart
class ProductsEmpty extends StatelessWidget {
  const ProductsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.data_array, size: 88),
          const Text('No prodcuts found!', style: TextStyle(fontSize: 22)),
        ],
      ),
    );
  }
}
```

**C. `ProductsFailure` Widget:**

- Center a `Column` aligned to the vertical center (`MainAxisSize.min`).
- Display an `Icon(Icons.error, size: 88)`.
- Display a `Text` widget retrieving the error message from the state with `fontSize: 22`. (Access the state via `context.read<ProductsCubit>().state as ProductsFailureState`).

```dart
class ProductsFailure extends StatelessWidget {
  const ProductsFailure({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error, size: 88),
          Text(
            (context.read<ProductsCubit>().state as ProductsFailureState)
                .errorMessage,
            style: const TextStyle(fontSize: 22),
          ),
        ],
      ),
    );
  }
}
```

**D. `ProductsList` Widget:**

- Takes a required `List<Product> products` parameter.
- Use a `ListView.builder` passing in the `products` list.
- Return a `ProductItem(product: product)` inside the builder function.

```dart
class ProductsList extends StatelessWidget {
  const ProductsList({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductItem(product: product);
      },
    );
  }
}
```
