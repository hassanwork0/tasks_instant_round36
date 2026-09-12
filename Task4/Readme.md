# Task 4: Food App UI with 3-Screen Navigation (Flutter)

## Task Overview

Task 4 involves building a Food App UI with 3-screen navigation using Flutter. The app includes a Splash Screen, a Home Screen displaying food cards from a data list, and a Product Details Screen that shows detailed information when a food card is selected. The food cards feature Hero animations for smooth and visually appealing transitions between screens.

---

## App Preview

Below is the reference UI for this task:

![Food App UI Reference](https://i.postimg.cc/MGTXxhS4/Screenshot-3308.png)

---

## Three Screen Structure

### Screen 1: Splash Screen

- **Purpose**: Welcome screen displayed when the app launches
- **Design**: Clean layout with Foodgo logo centered on the screen
- **Features**:
  - Displays the Foodgo brand logo at the center
  - Auto-navigates to the Home Screen after 2-3 seconds
  - Smooth fade-in animation for the logo
  - Professional brand introduction before entering the main app

### Screen 2: Home Screen

- **Purpose**: Main browsing screen displaying all food items
- **Layout Components**:
  - **App Bar**: Shows "Foodgo" branding with a search icon
  - **Search Bar**: Text field with "Search" placeholder for filtering items
  - **Category Filters**: Horizontal scrollable buttons for "All", "Beef", and "Chicken"
  - **Food Cards**: Horizontal scrollable list showing food items

- **Food Cards Data Source**: The food cards displayed on the Home Screen are generated from a **List of FoodItem objects** stored in the application. This list contains predefined food data including names, ratings, delivery times, prices, categories, and image paths. The Home Screen uses this list to dynamically build food cards using ListView.builder.

- **Food Items Included**:
  - Cheeseburger (Wendy's Burger) - Rating: 4.9 stars, 26 mins delivery
  - Veggie Burger - Rating: 4.9 stars
  - Hamburger - Rating: 4.8 stars
  - Chicken Burger - Rating: 4.6 stars
  - Fried Chicken Burger - Rating: 4.5 stars, Price: $8.24

- **Card Content**: Each card displays food image, name, rating with star icon, delivery time, and price
- **Hero Animation**: Each food card is wrapped with a Hero widget. The Hero tag uses a unique identifier (e.g., food item ID) to create a seamless animation when transitioning to the Product Details Screen
- **Navigation**: Tapping any food card navigates to the Product Details Screen and passes the selected food item data

### Screen 3: Product Details Screen

- **Purpose**: Displays comprehensive information about the selected food item
- **Layout Components**:
  - **Back Button**: Returns to Home Screen
  - **Food Image**: Large display of the selected food item wrapped with a Hero widget matching the tag from the Home Screen
  - **Food Name**: Prominently displayed below the image
  - **Rating**: Star rating with numerical value
  - **Description**: Detailed product description with ingredients and preparation
    - Example: "The Cheeseburger Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, it's topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles."
  - **Spiciness Options**: "Spicy" and "Mild" or "Hot" indicators
  - **Portion Selection**: Option to select portion size (e.g., "Hamburger")
  - **Price**: Displayed prominently with "$" symbol
  - **Order Button**: "ORDER NOW" button for placing an order
- **Data Reception**: Receives selected food item data passed from Home Screen
- **Hero Animation**: The Hero widget on this screen uses the same tag as the corresponding card on the Home Screen, creating a smooth flying animation from the card to the detailed view

---

## Food Cards Data List Structure

The food cards displayed on the Home Screen are populated from a data list defined in the application. Each food item in the list contains:

### FoodItem Model Properties

- id: Unique identifier for each item (used as Hero tag)
- name: Food name (e.g., "Cheeseburger")
- brand: Brand name (e.g., "Wendy's Burger")
- rating: Numeric rating (e.g., 4.9)
- deliveryTime: String representing delivery time (e.g., "26 mins")
- price: Double or String for price (e.g., 8.24)
- imagePath: String path to the food image asset
- category: String category for filtering (e.g., "Beef", "Chicken")
- description: Detailed product description text
- spiciness: String indicating spice level (e.g., "Spicy", "Mild")
- portion: String for portion options (e.g., "Hamburger")

### Sample Data List

The application contains a predefined list of food items that populate the Home Screen. This list serves as the data source for building food cards dynamically. The data is structured to match the UI requirements shown in the reference image.

---

## Key Widgets and Components

### 1. Hero Widget

The Hero widget creates smooth visual transitions between screens by allowing a widget to "fly" from one screen to another.

**Implementation on Home Screen (Food Card)**:

- Each food card's image is wrapped in a Hero widget
- The Hero tag is set to a unique value (e.g., foodItem.id.toString())
- Ensures each card has a unique identifier for the animation

**Implementation on Product Details Screen**:

- The food image is wrapped in a Hero widget with the same tag
- The tag matches the selected food item's identifier
- Both Hero widgets share the same tag to enable the animation

**How Hero Animation Works**:

1. User taps a food card on the Home Screen
2. The Hero widget creates a "hero" that flies from the source position
3. The Navigator pushes the Product Details Screen
4. The hero transitions to the destination Hero widget position
5. The animation completes with a smooth flying effect
6. The destination screen displays with the image in its final position
7. When going back, the animation reverses, flying back to the original position

### 2. Food Card Widget

A reusable component that displays individual food items with:

- GestureDetector or InkWell for tap detection
- Hero widget wrapping the image for smooth transitions
- Container with rounded corners and shadow for card effect
- Food name with custom typography styling
- Star rating with Icon widget in amber color
- Delivery time with clock icon
- Price with currency formatting
- Proper padding and spacing for clean layout

### 3. Category Filter Widget

A horizontal scrollable list of category chips or buttons:

- Options: "All", "Beef", "Chicken"
- Active state styling for selected category
- OnTap functionality to filter food items
- Smooth visual feedback on selection
- Horizontal ListView.builder for scrollable categories

### 4. Bottom Navigation Bar

A persistent navigation bar at the bottom of the Home Screen:

- Four tabs: Home, Search, Cart, Profile
- Material Design icons for each tab
- Current index tracking for active tab
- OnTap functionality to switch between tabs
- Properly styled with selected and unselected colors

### 5. Splash Screen Widget

- Center layout with logo widget
- FadeIn animation for logo appearance
- Timer for automatic navigation
- Clean background with brand colors
- Optional tagline text below logo

### 6. Product Details Widget

- AppBar with back button
- Hero widget matching Home Screen tag
- Detailed description text with proper formatting
- Options for spiciness (Spicy/Mild/Hot)
- Portion selection (Hamburger options)
- Price display with large prominent font
- Order Now button with custom styling

### 7. Search Bar Widget

- TextField with search icon
- Search placeholder text
- OnChanged functionality for filtering
- Real-time search results
- Clear button option

---

## Navigation Implementation Details

### Screen Navigation Flow

**1. Splash Screen to Home Screen**

- Implementation: Uses Future.delayed with Navigator.pushReplacement
- Timing: Auto-navigates after 2-3 seconds delay
- Animation: Smooth fade transition or route animation
- Purpose: Professional app launch experience

**2. Home Screen to Product Details Screen**

- Implementation: Navigator.push with MaterialPageRoute
- Data Passing: Selected FoodItem object passed via arguments
- Trigger: Tapping on any food card triggers navigation
- Animation: Hero animation on image, standard page transition for other elements
- Purpose: Display detailed information about selected item with smooth visual transition

**3. Product Details Screen to Home Screen**

- Implementation: Navigator.pop() method
- Trigger: Tapping the back arrow button
- Animation: Hero animation reverses, flying back to original position
- Data Flow: No data passed back (single-direction flow)
- Purpose: Return to browsing experience with reverse hero animation

### Data Passing Between Screens

**Home to Product Screen**

- Method: Navigator.push with settings.arguments
- Data Format: Full FoodItem object containing all properties
- Reception: Product Screen uses ModalRoute.of(context).settings.arguments
- Hero Tag: The food item's ID is used as the Hero tag for both screens

**Example Data Flow**:

1. User views food cards on Home Screen from the data list
2. User taps on a card (e.g., Cheeseburger with ID: 1)
3. The selected FoodItem object is passed to Product Screen
4. Product Screen receives the object and extracts all properties
5. Product Screen displays all details of that specific item
6. The Hero tag 'food_1' links both screen images for animation
7. User can view description, spiciness, portion, and price
8. User taps back to return to Home Screen with reverse animation

### Navigation Code Structure

**Route Definitions**

- MaterialApp routes or onGenerateRoute for named navigation
- Each screen defined as a separate widget class
- Arguments handled through settings parameter

**Navigation Methods Used**

- Navigator.push: For forward navigation with data and Hero animation
- Navigator.pop: For backward navigation with reverse Hero animation
- Navigator.pushReplacement: For splash screen transition

**Key Code Implementation**:

**On Home Screen (Card Tapping)**:

- Wrap card in GestureDetector
- OnTap: Call Navigator.push
- Pass FoodItem object as argument
- Hero widget with unique tag

**On Product Screen (Receiving Data)**:

- Extract arguments using ModalRoute
- Store FoodItem in local variable
- Display all properties in UI
- Hero widget with matching tag

**Navigation Tips**:

- Ensure Hero tags are unique across the app
- Use consistent data types when passing arguments
- Handle null cases for missing data
- Test navigation flow thoroughly

---
