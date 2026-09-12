# 🏀 Task 2 : Basketball App (Flutter)

A simple, minimalist basketball scorekeeping app built with **Flutter**.  
Features two columns (Team A vs Team B) and a single **RESET** button.  
No undo, no shot logs — just pure scoring.

---

## 📱 App Overview

The app displays a two-column scoreboard:

- **Left column:** Team A
- **Right column:** Team B

Each column shows:

- The team name
- The current score (large number)
- Three scoring buttons: `+1`, `+2`, and `+3`

Below both columns, there is a single **RESET** button.

---

## ✨ Features

- Two-column layout for side-by-side scorekeeping
- `+1`, `+2`, and `+3` buttons for each team
- Single **RESET** button that sets both scores back to 0
- Clean, basketball-themed visual design
- No undo functionality
- No shot logs or action history
- Works on iOS, Android, web, and desktop

---

## 📸 App Preview

<div align="center">
  <img src="https://play-lh.googleusercontent.com/gU23UvDKHxrpsP_rMVOR8aluebwIu2wH6nAKanr6aRcfcgoyKE8xw7xO7PN0QiJz18g=w2560-h1440-rw" width="250" height="400" alt="Basketball App Icon">
</div>

---

## 🎮 How to Use

1. Tap `+1`, `+2`, or `+3` under **Team A** to add points to Team A
2. Tap `+1`, `+2`, or `+3` under **Team B** to add points to Team B
3. Tap **RESET** to set both teams' scores to zero

---

## 🧩 Core Logic

| Component    | Behavior                                   |
| ------------ | ------------------------------------------ |
| Team A score | Increases when any Team A button is tapped |
| Team B score | Increases when any Team B button is tapped |
| RESET button | Sets Team A score = 0 and Team B score = 0 |

No history tracking. No undo stack. Simple addition only.

---

## 🛠️ Tech Stack

- **Framework:** Flutter (Dart)
- **Platforms:** Android, iOS, Web, Windows, macOS, Linux

---

## 📁 Expected Project Structure

```

basketball_app/
├── lib/
│ └── main.dart # main app with two-column UI and reset button
├── pubspec.yaml # Flutter dependencies
└── README.md # this file

```

## 📝 Notes

- This is a pure Flutter implementation
- Scores start at 0 when the app launches
- RESET clears both scores but keeps the app running

---
