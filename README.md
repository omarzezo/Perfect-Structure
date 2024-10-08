# perfection_structure

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
## Project Structure 

lib/
├── core/
│   ├── error/                # Failure/Error handling
│   ├── network/              # Network utilities
│   └── usecase.dart          # Base UseCase
├── data/
│   ├── datasource/           # API and Local Data Source
│   ├── models/               # Data Models (DTOs)
│   └── repository_impl/      # Implementations of Repositories
├── domain/
│   ├── entities/             # Business Models (Entities)
│   ├── repository/           # Abstract Repositories
│   └── usecases/             # Application-Specific Business Rules (UseCases)
├── presentation/
│   ├── provider/             # Riverpod Providers
│   ├── pages/                # UI pages
│   └── widgets/              # UI Widgets
