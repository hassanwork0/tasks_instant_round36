Perfect! Here's the corrected README with the exact layout you specified (Calculate and Clear buttons on separate rows):

---

# Flutter Calculator App

A simple, clean calculator application built with Flutter. This project demonstrates basic UI layout, state management, and arithmetic operations.

## 📱 Task Description

Create a functional calculator in Flutter with the following specifications:

- **Two TextFields** for user number input
- **Four Operation Buttons** (`+`, `-`, `×`, `÷`) arranged in a single Row
- **Calculate Button** (`= Calculate`) to perform the selected operation
- **Trash/Clear Button** (`🗑️ Clear`) to reset the input fields and result
- **Spacer** for layout separation between buttons and result
- **Result Container** centered on screen displaying the result (default: `0.0`)

## 🎯 Required Features

| Component          | Description                                            |
| ------------------ | ------------------------------------------------------ |
| TextField (1)      | First number input (numeric keyboard)                  |
| TextField (2)      | Second number input (numeric keyboard)                 |
| Operation Row      | Four buttons horizontally: `+`, `-`, `×`, `÷`          |
| Calculate Button   | `= Calculate` button – performs the selected operation |
| Trash Clear Button | `🗑️ Clear` – clears both fields and resets result      |
| Spacer             | Flexible space between buttons and result container    |
| Result Container   | Centered container showing `0.0` initially             |

---

## 📸 App Preview

<div align="center">
  <img src="https://i.postimg.cc/Wz83btW8/task.jpg" width="300" height="400" alt="Basketball App Icon">
</div>

---

## 🧠 Logic Requirements

1. The user enters numbers in the two TextFields
2. User selects one operation (`+`, `-`, `×`, `÷`)
3. On pressing `= Calculate`, the app calculates and displays the result inside the centered container
4. The **Trash/Clear button** clears:
   - Both TextField controllers
   - The selected operation (reset to none)
   - Result container back to `0.0`
5. Error handling:
   - If fields are empty, show a snackbar or set result to `"Error"`
   - Division by zero should display `"Cannot divide by zero"`

## 🛠️ Implementation Outline (Flutter)

- Use `TextEditingController` for both input fields
- Use `StatefulWidget` for state management
- Store selected operation as a `String` or `enum`
- Use `double.tryParse()` for safe number conversion
- Use `Row` with `mainAxisAlignment: MainAxisAlignment.spaceEvenly` for the 4 operation buttons
- Use `Column` as the main layout with proper children arrangement
- Calculate and Clear buttons should be on separate rows (not the same row)
- Add `Spacer()` widget between the Clear button and the Result Container
- Wrap result in a `Center` widget inside a `Container` with decoration

## ✅ Example Usage

| First Number | Second Number | Operation | Result                |
| ------------ | ------------- | --------- | --------------------- |
| 10           | 5             | `+`       | 15.0                  |
| 10           | 5             | `-`       | 5.0                   |
| 10           | 5             | `×`       | 50.0                  |
| 10           | 5             | `÷`       | 2.0                   |
| 10           | 0             | `÷`       | Cannot divide by zero |

## 🎨 UI Specifications

- **Operation Buttons Row**: 4 equal-width buttons (`+`, `-`, `×`, `÷`)
- **Calculate Button**: Full-width or prominent button with `=` symbol
- **Clear Button**: Full-width button with trash icon and "Clear" text
- **Spacer**: Takes up remaining space between Clear button and Result Container
- **Result Container**:
  - Centered on screen
  - Border radius, padding, shadow
  - Background color (optional)
  - Text aligned center
  - Initial value `0.0`

## 🧪 Bonus Features (Optional)

- Highlight selected operation button with different color
- Keyboard support (enter key triggers calculate)
- Decimal numbers support
- Backspace button option
- History of calculations

## 📂 Project Structure (Suggested)

```
lib/
├── main.dart
├── calculator_screen.dart
├── widgets/
│   ├── number_text_field.dart
│   ├── operation_button.dart
│   ├── calculate_button.dart
│   ├── clear_button.dart
│   └── result_container.dart
└── utils/
    └── calculator_logic.dart
```

## 🚀 How to Run

1. Make sure Flutter SDK is installed
2. Create a new Flutter project: `flutter create calculator_app`
3. Replace the default code with the calculator implementation
4. Run `flutter pub get`
5. Run `flutter run`

## 📝 Notes

- This task focuses on core Flutter concepts: `TextField`, `Row`, `Column`, `Container`, `Spacer`, button interactions, and state management
- The Calculate and Clear buttons are on **separate rows** as shown in the layout
- The `Spacer` widget is crucial for pushing the result container to the bottom
- Result container must be perfectly centered using `Center` widget

## 🔍 Key Learning Outcomes

- Managing multiple `TextEditingController` instances
- Handling user input validation
- Implementing arithmetic operations with edge cases
- Building responsive layouts with `Spacer` and `Expanded`
- Managing state in a `StatefulWidget`

---

**Good luck with your Flutter calculator implementation!** 🚀

Would you like me to provide the complete Flutter code for this calculator?
