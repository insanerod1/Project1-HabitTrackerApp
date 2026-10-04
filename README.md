# Habit Tracker

Habit Tracker is a Flutter mobile application built with Dart that helps users create, organize, and manage daily habits. Habits are displayed in a structured data table with separate columns for the habit name and date.

The application allows users to save multiple named habit lists and load them later. SQLite provides persistent local storage using separate tables for saved lists and individual habits, connected through a foreign-key relationship.

## Features

- Add and display daily habits
- View habits in a structured data table
- Save multiple named habit lists
- Store saved lists locally with SQLite
- Load previously saved habit lists
- Automatically associate individual habits with their saved list
- Uses controller, model, and repository architecture

## Technologies Used

- Dart
- Flutter
- SQLite
- `sqflite`
- `sqflite_common_ffi`
- `path`

This project was created to practice Flutter development, state management, relational database design, and asynchronous CRUD operations.
