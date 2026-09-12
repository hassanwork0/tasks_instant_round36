# Flutter Calculator App 📱

A clean, functional calculator application built with **Flutter** and **Dart** as part of the academy tasks (Round 36). This project demonstrates core Flutter concepts including form layouts, state management, and input validation.

## 🎯 Features Implemented

- **Two Numeric Inputs:** Using `TextEditingController` with numeric keyboards.
- **Operation Row:** Smooth selection layout for the four basic operations (`+`, `-`, `×`, `÷`).
- **Calculate Button:** Prominent `= Calculate` button to process inputs.
- **Clear Button:** A `🗑️ Clear` button that resets both text fields, operation selection, and the result container.
- **Responsive Layout:** Proper use of `Column`, `Row`, and `Spacer()` widgets to align the UI perfectly.
- **Edge Case Handling:** Safe number conversion using `double.tryParse()` and custom validation for division by zero.

## 🛠️ Tech Stack & Concepts
- **Framework:** Flutter (StatefulWidget)
- **Language:** Dart
- **UI Widgets:** TextField, Row, Column, Container, Spacer, Center, MaterialButton.

## 📂 Project Structure
```text
lib/
├── main.dart             # App entry point
└── mathbutton.dart       # Custom reusable widgets for the calculator