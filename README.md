<div align="center">

# CyberDo

### Your routine, in RPG mode. 🕹️

CyberDo is a gamified to-do list with a cyberpunk look. Every task is a **quest** tied to
an RPG attribute, long-term **goals** reward you with XP, and your profile shows your
level, streak and progress over time — all in a native SwiftUI app.

<br/>

[![Platform](https://img.shields.io/badge/iOS-18.5+-000000?style=for-the-badge&logo=apple&logoColor=white)](https://www.apple.com/ios/)
[![Swift](https://img.shields.io/badge/Swift-5-FA7343?style=for-the-badge&logo=swift&logoColor=white)](https://swift.org)
[![SwiftUI](https://img.shields.io/badge/SwiftUI-0052CC?style=for-the-badge&logo=swift&logoColor=white)](https://developer.apple.com/xcode/swiftui/)
[![Core Data](https://img.shields.io/badge/Core_Data-3693F3?style=for-the-badge&logo=apple&logoColor=white)](https://developer.apple.com/documentation/coredata)

</div>

---

## 📑 Table of Contents

- [About](#-about)
- [Features](#-features)
- [How It Works](#-how-it-works)
- [Tech Stack](#-tech-stack)
- [Project Structure](#-project-structure)
- [Getting Started](#-getting-started)
- [Authors](#-authors)

---

## 📖 About

Traditional to-do lists work, but they're rarely fun. CyberDo turns your routine into
something closer to an RPG: a finished task stops being just a checkmark and becomes an
action that levels up your character.

Each quest belongs to an attribute — **Strength, Dexterity, Vitality, Vigor, Endurance,
Intelligence, Faith** or **Attunement** — so you can see which side of your life you've
been training, and the neon, monospaced cyberpunk visual identity keeps it far from the
generic productivity-app look.

---

## 🚀 Features

- **⚔️ Quests** — create tasks with a frequency (daily, weekly or monthly), an attribute and a priority (**Main** or **Side** quest).
- **🎯 Goals** — longer-term goals with a target and current progress, each worth XP when completed.
- **🔥 Streak** — a custom-drawn gauge on the profile that fills up as you earn XP.
- **📈 Profile** — level, goals and a progress chart drawn with SwiftUI shapes.
- **🏅 Achievements** — a dedicated screen for the milestones of your journey.
- **🌃 Cyberpunk identity** — custom SF Mono typography and a neon color palette.

---

## ⚙️ How It Works

1. **Create a quest** on the home screen and choose its frequency, attribute and priority.
2. **Complete quests** to check them off your list.
3. **Set goals** on the profile and track their progress.
4. **Follow your streak and level** on the profile screen.
5. **Check your achievements** on the achievements screen.

Under the hood, quests and goals are Core Data entities in the `CyberDoModel` model,
managed by a single `CoreDataController`. Each area of the app has its own view model
(`HomeViewModel`, `MetasModel`, `AchievementViewModel`), and the SwiftUI screens are
built from small reusable components.

---

## 🛠️ Tech Stack

| Area | Tech |
|------|------|
| UI | SwiftUI |
| Persistence | Core Data |
| Typography | SF Mono (custom fonts) |
| Architecture | MVVM |

---

## 📂 Project Structure

```
CyberDo/CyberDo/
├── CyberDoApp.swift      # App entry
├── HomeView/             # Quest list and quest creation
├── ProfileView/          # Level, goals, streak and progress chart
├── AchievementView/      # Achievements
├── Models/               # CoreDataController, view models, CyberDoModel
├── Font/                 # SF Mono font files
└── Assets.xcassets/      # Neon color palette, icons
```

---

## 🎯 Getting Started

### Requirements

- Xcode 16+
- iOS 18.5+

### Run

```bash
git clone https://github.com/JonasFNMelo/CyberDo.git
cd CyberDo
open CyberDo/CyberDo.xcodeproj
```

Then pick an iPhone simulator and run (`⌘R`).

---

## 👥 Authors

<table width="100%">
  <tr>
    <td align="center" width="100%">
      <a href="https://github.com/JonasFNMelo"><img src="https://github.com/JonasFNMelo.png" width="80" alt="Jonas Melo"/></a>
      <br/><sub><b>Jonas Melo</b></sub><br/>
      <a href="https://github.com/JonasFNMelo"><img src="https://skillicons.dev/icons?i=github" alt="GitHub"/></a>
      <a href="https://www.linkedin.com/in/jonas-melo-/"><img src="https://skillicons.dev/icons?i=linkedin" alt="LinkedIn"/></a>
    </td>
  </tr>
</table>
