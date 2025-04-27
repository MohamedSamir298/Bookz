# Bookz App

A modern Flutter application for discovering and exploring books.

## Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK (latest stable version)
- Android Studio / VS Code with Flutter plugins

### Installation & Setup
1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter run` to launch the app

## Features & UI Components

### Home Screen
- Dynamic toggle between List and Grid views
- Pull-to-refresh functionality
- Infinite scrolling for continuous content loading
- Search bar with real-time suggestions
- Responsive book cards with cover images
- Clean typography and spacing

### Search Experience
- Dynamic toggle between List and Grid views
- Real-time search results
- Pull-to-refresh functionality
- Infinite scrolling for continuous content loading
- Categorized results view
- Smooth animations during search

### Book Details
- Comprehensive book information display
- Cover image with parallax effect
- Author information
- Book description with expandable text
- Related books section

### UI Elements
- Custom app bar with search integration
- Bottom navigation with smooth transitions
- Loading skeletons for better UX
- Error states with retry options
- Custom icons and animations

### Splash Screen
- Display of the app logo with a smooth animation.
- Logo fades in and out before transitioning to the home screen.
- Smooth fade-in transition between splash screen and onboarding screen.

### Onboarding Screen
- Interactive onboarding screen that guides the user through the app’s features.
- "Get Started" button at the end to move to the home screen.

## Technical Implementation

### State Management
- BLoC pattern for predictable state flows
- Separation of UI and business logic
- Efficient data caching

### Libraries & Tools
- flutter_screenutil: Responsive scaling
- go_router: Navigation management
- hive_ce: Local storage
- cached_network_image: Image caching

### Architecture
- Feature-first architecture
- Clean code principles
- Repository pattern
- Dependency injection

### Performance Optimizations
- Lazy loading of images
- Efficient list rendering
- Memory management
- Network caching

## Design Decisions
- Dark theme for better readability
- Material Design 3 guidelines
- Responsive layout adapting to different screen sizes
- Accessibility considerations
