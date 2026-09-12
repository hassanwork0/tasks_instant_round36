# Task 8: Product Details from DummyJSON (Google Stitch Design)

## Project Design Mockups

The following placeholder images represent the expected UI states for the Product Details feature. **Replace these with your own screenshots** taken from **[Google Stitch (stitch.withgoogle.com)](https://stitch.withgoogle.com/)** or your Figma design tool.

<div align="center">
  <table>
    <tr>
      <td align="center" width="50%">
        <img src="https://placehold.co/400x800/EEE/333?text=Loading+State" alt="Loading State" width="300"/>
        <br><em>Loading / Shimmer State</em>
      </td>
      <td align="center" width="50%">
        <img src="https://placehold.co/400x800/EEE/333?text=Details+Loaded" alt="Success State" width="300"/>
        <br><em>Success State (Product Details)</em>
      </td>
    </tr>
    <tr>
      <td align="center" width="50%">
        <img src="https://placehold.co/400x800/EEE/333?text=Empty+State" alt="Empty State" width="300"/>
        <br><em>Empty State (No product found)</em>
      </td>
      <td align="center" width="50%">
        <img src="https://placehold.co/400x800/EEE/333?text=Error+State" alt="Failure State" width="300"/>
        <br><em>Failure State (API Error)</em>
      </td>
    </tr>
  </table>
</div>

---

**Goal:** Build a "Product Details" screen in Flutter that fetches a single product's data from the `https://dummyjson.com/products` API.
**Core Focus:** Implementing a clean separation between the **Data Layer** (Fetching and Parsing) and the **Presentation Layer** (UI and State Management).

**Design Source:**

- The UI must strictly follow the principles of **[Google Stitch](https://stitch.withgoogle.com/)** (Material You 3).
- Focus on dynamic color theming, large rounded corners (`Radius.circular(16)+`), clean typography, and pill-shaped buttons.
- You must design 4 main visual states: Loading, Loaded, Empty, and Error.

**API Endpoint:**

- `GET https://dummyjson.com/products/{id}` (Pass the specific product ID here).
- This returns a single JSON object containing details like `id`, `title`, `description`, `price`, `discountPercentage`, `rating`, `stock`, `brand`, `category`, and `thumbnail`.

---

## 📁 Project Structure (STRICT)

You must follow this exact folder structure. **Do not include a Core layer for this task.**

```text
└── 📁lib
    └── 📁core
    └── 📁features
        └── 📁product_details
            ├── 📁data
            │   ├── 📁model
            │   ├── 📁source
            └── 📁presentation
                ├── 📁cubit
                ├── 📁pages
                └── 📁widgets
```

---

## Layer 1: Data Layer (`lib/features/product_details/data`)

This layer is responsible for fetching the specific JSON object and converting it into a usable Dart model.

- **`model/product_details_model.dart`**:
  - Research the JSON structure of a single product. Create the `ProductDetailsModel` class.
  - **Fields:** Map `id`, `title`, `description`, `price`, `discountPercentage`, `rating`, `stock`, `brand`, `category`, `thumbnail`.
  - **Task:** Implement a `factory ProductDetailsModel.fromJson(Map<String, dynamic> json)` method to map the API response to your object.

- **`source/product_details_source.dart`**:
  - Create the `ProductDetailsSource` class.
  - **Task:** Implement `Future<ProductDetailsModel> getProductDetails(int id)`.
  - This should fetch the URL `https://dummyjson.com/products/$id` using your HTTP client, extract the JSON, and return the `ProductDetailsModel`.

- **`implement/product_details_repository_impl.dart`**:
  - Create an abstract `ProductDetailsRepository` interface and the `ProductDetailsRepositoryImpl` class.
  - **Task:** The implementation should simply delegate the fetching to the `ProductDetailsSource`. This creates a loose coupling between your UI and your API.

---

## Layer 2: Presentation Layer (`lib/features/product_details/presentation`)

This layer is where the Google Stitch UI lives. It should **never** know where the data comes from; it only talks to the `Cubit`.

- **`cubit/product_details_state.dart`**:
  - Implement a sealed class `ProductDetailsState` with the following:
    1.  `ProductDetailsInitialState`
    2.  `ProductDetailsLoadingState`
    3.  `ProductDetailsLoadedState` (Contains the `ProductDetailsModel product`)
    4.  `ProductDetailsFailureState` (Contains a `String errorMessage`)

- **`cubit/product_details_cubit.dart`**:
  - Create a `ProductDetailsCubit` that extends `Cubit<ProductDetailsState>`.
  - **Logic:**
    - Inject the `ProductDetailsRepository` into the constructor.
    - Create a method `Future<void> fetchProductDetails(int id)`.
    - Emit the `Loading` state, call the repository, and then emit `Loaded` with the product data. Catch exceptions and emit `Failure` with an error message.

- **`pages/product_details_page.dart`**:
  - Use `BlocBuilder<ProductDetailsCubit, ProductDetailsState>`.
  - **`initState`:** Retrieve the `productId` (likely via `ModalRoute` arguments) and call `context.read<ProductDetailsCubit>().fetchProductDetails(id)`.
  - **Layout:** Switch over the states:
    - Loading: Render `DetailsShimmer()`.
    - Failure: Render `DetailsErrorWidget()` with a retry button.
    - Loaded: Render the main Stitch UI.
  - **Stitch Design Elements:** Use a large top image carousel, rounded cards for specs, an "Add to Cart" pill-shaped button at the bottom, and dynamic theme colors.

- **`widgets/`**: Create these custom components based on your Google Stitch design.
  - `details_shimmer.dart`: A shimmer placeholder for the loading state (large rounded container + text blocks).
  - `details_error_widget.dart`: Centered icon with an error message and a "Try Again" button.
  - `details_empty_widget.dart`: Centered icon with a "No product found" message (in case the API returns null).
  - `product_image_carousel.dart`: A horizontal `PageView` containing the `thumbnail`, and other images if present, with page indicators.

---

## 🎨 Google Stitch Design Implementation Notes

Since you are pulling designs directly from **Google Stitch**, pay attention to these specific Material You requirements while implementing the UI:

1.  **Dynamic Color:** Use `Theme.of(context).colorScheme.primary` and `secondary` for main buttons and highlights.
2.  **Typography:** Use large, bold `TextStyles` for the product title and prominent pricing.
3.  **Shapes:** Use heavily rounded corners (`BorderRadius.circular(24)`) for the top image container and cards.
4.  **Spacing:** Ensure generous padding (`EdgeInsets.all(16)`) around the content.

---

## 🔍 Search & Research Prompts

To successfully complete this task without being given the full code, you must research the following:

1.  **How to pass route arguments:** Look up how to pass a `productId` from a previous screen (like a Home/List screen) to this `ProductDetailsPage`.
2.  **Nested JSON Parsing:** The API response may contain nested objects (like `dimensions` or `reviews`). Figure out how to map or ignore these.
3.  **Material You 3 in Flutter:** How to properly enable `useMaterial3: true` and implement a dynamic ColorScheme based on Google Stitch designs.
4.  **State Management:** Study how to correctly use `BlocBuilder` to wait for a single product's data.
5.  **Dependency Injection:** Look up how to instantiate the `ProductDetailsRepository` and inject it into the `ProductDetailsCubit`.
