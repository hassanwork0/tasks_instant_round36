# Task 7: Recipes Flutter App

## Project Design Mockups

The following placeholder images represent the expected UI states for the app. **Replace these with your own screenshots** or Figma design mockups to guide the learners.

<div align="center">
  <table>
    <tr>
      <td align="center" width="50%">
        <img src="https://placehold.co/400x800/EEE/333?text=Splash+Screen" alt="Splash State" width="300"/>
        <br><em>Splash Screen</em>
      </td>
      <td align="center" width="50%">
        <img src="https://placehold.co/400x800/EEE/333?text=Home+Screen" alt="Success State" width="300"/>
        <br><em>Home Screen (Job List)</em>
      </td>
    </tr>
    <tr>
      <td align="center" width="50%">
        <img src="https://placehold.co/400x800/EEE/333?text=Product+Detail" alt="Empty State" width="300"/>
        <br><em>Product Detail Screen</em>
      </td>
      <td align="center" width="50%">
        <img src="https://placehold.co/400x800/EEE/333?text=Error+State" alt="Failure State" width="300"/>
        <br><em>Error / Loading State</em>
      </td>
    </tr>
  </table>
</div>

---

**Goal:** Build a Recipes App that fetches real data from the `https://dummyjson.com/recipes` API.
**Core Focus:** Mastering **Clean Architecture** by separating the project into **Core, Data, and Presentation** layers.

**Learning Objective:** This task intentionally provides **less code and more conceptual details**. You must research the Flutter concepts yourself to implement the logic, read the API documentation, and understand how to connect the layers.

---

## 📁 Project Structure (STRICT)

You must follow this exact folder structure. Do not add or remove any files.

```text
└── 📁lib
    ├── main.dart
    └── 📁core
        ├── 📁api
        ├── 📁colors
        ├── 📁const
        ├── 📁images
        ├── 📁routes
        └── 📁utils
    └── 📁features
        └── 📁recipes_app
            ├── 📁data
            │   ├── 📁implement
            │   ├── 📁model
            │   └── 📁source
            └── 📁presentation
                ├── 📁bloc
                ├── 📁pages
                └── 📁widgets
```

---

## Layer 1: Core Layer (lib/core)

This layer acts as the global foundation for your entire app.

- **`api/api.dart`**: Research and implement a global API client here. Should it be a simple `http` client, or should you use a package like `dio` with interceptors? Where is the base URL (`https://dummyjson.com`) defined?
- **`colors` & `const`**: Define your constant colors and app-wide string values (e.g., padding values, text messages).
- **`dummy/dummy.dart`**: Create dummy data for `ProductModel` objects. This is your fallback if the API fails, or for widget testing before the API is connected.
- **`images/app_images.dart`**: Create a static class to store local image paths (e.g., `static const String logo = 'assets/images/logo.png';`).
- **`routes/routes_name.dart`**: Define string constants for your screen routes. (e.g., `class RoutesName { static const String splash = '/'; static const String home = '/home'; ... }`).
- **`utils`**: Create global helper functions (e.g., a function to format data, or a text validator).

---

## Layer 2: Data Layer (lib/features/food_app/data)

This layer is responsible for getting raw JSON data and converting it into usable Dart models.

- **`model/product_model.dart`**: Create a `ProductModel` class.
  - **Research Task:** Visit `https://dummyjson.com/recipes` and look at the JSON response. What are the fields? (e.g., `id`, `name`, `image`, `difficulty`, `rating`, `tags`, `ingredients`).
  - **Task:** Define these fields in your Dart class, and write a `factory ProductModel.fromJson(Map<String, dynamic> json)` method to map the API response to your model.
- **`source/`**: Create your **Remote Data Source** class here.
  - **Task:** This class should contain the function `Future<List<ProductModel>> getRecipes()`. It must use your `api.dart` to fetch the list of recipes.
  - **Hint:** The main API response will have a `recipes` key inside the root JSON object. You need to extract that list and map it.
- **`implement/`**: Create your **Repository Implementation** class here.
  - **Task:** Implement an abstract repository interface. The implementation should simply call the `Source` file, but it acts as a gateway between the UI and the API (decoupling).

---

## Layer 3: Presentation Layer (lib/features/food_app/presentation)

This is where the UI lives. This layer should **never** know where the data comes from; it only talks to the `bloc`.

- **`bloc/`**: Implement your state management logic here.
  - **Research Task:** Will you use `flutter_bloc` or `cubit`?
  - **Task:** Create a `RecipesCubit`.
  - **Logic:** It needs an initial state (Loading), a loaded state (containing `List<ProductModel>`), and an error state (containing a `String errorMessage`).
  - **Function:** `Future<void> fetchRecipes()` must call the `Repository`, emit the Loading state, then try to emit the Loaded state or catch an exception and emit the Error state.
- **`pages/splash.dart`**:
  - **Task:** Create a simple splash screen with your `app_logo.dart` widget.
  - **Logic:** In the `initState`, use a `Timer` to wait 2-3 seconds, then use your `routes_name.dart` to navigate to `home.dart`.
- **`pages/home.dart`**:
  - **Task:** This is the main dashboard. It should use the `BlocBuilder` to listen to the `RecipesCubit`.
  - **Layout:** Display your `app_search_bar.dart` at the top, and a `ListView` of `product_widget.dart` cards below. If the state is Loading, show a shimmer/loading widget. If it's Error, show a retry button.
- **`pages/product_screen.dart`**:
  - **Task:** This is the detail screen. It should accept a `ProductModel` object (passed from the Home page).
  - **Layout:** Display the large image, title, rating, difficulty, and ingredients list.
- **`widgets/`**: Build these reusable UI components. **Look at how they are named and infer their UI behavior.**
  - `app_button.dart`: A custom reusable button widget.
  - `app_logo.dart`: The logo image or text shown on the splash screen.
  - `app_search_bar.dart`: The search bar shown at the top of `home.dart`.
  - `product_widget.dart`: The card widget used to display a single recipe in the list.
  - `search_text_field.dart`: A specific `TextFormField` widget for user input.
  - `title_bar.dart`: A custom AppBar or header widget.

---
