# Foodie_Goodie

Foodie_Goodie is a simple meal browsing Android application built using the Flutter framework. The app allows users to browse meals from different categories, view detailed descriptions of each meal, and mark meals as favorites. All the functionalities are efficiently managed through a tabbed navigation interface.

## Features

- **Category-based Meal Browsing**: Users can browse meals by categories.
- **Detailed Meal Description**: By selecting a meal, users can view its complete description (Ingredients, Steps involved).
- **Favorites**: Users can mark meals as favorites and access them in a separately.
- **Tabbed Navigation**: The app uses tabbed navigation to switch between the Categories and Favorites screens easily.

## Screens

### 1. Categories
![Displays all available categories. Users can tap on any category to view category-specific meals.
](./assets/readme_images/categories_ss.png =200x)


### 2. Meals
![Displays meals based on the selected category. Users can tap on any meal to view its detailed description.
](./assets/readme_images/meals_ss.png =200x)

### 3. Meal Description
![Shows a detailed view of the meal, including ingredients, preparation steps, and more.
](./assets/readme_images/mealdetail_ss.png =200x)

### 4. Favourites
A list of meals marked as favorites by the user, easily accessible from a dedicated tab.

## Getting Started

To run this project locally, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/foodie_goodie.git
   
2. **Install Dependencies** - Navigate to the project directory and run the following command to install the required dependencies:
   flutter pub get

3. **Run the App**:
   flutter run

## Dependencies
- [Flutter](https://flutter.dev/) - A UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
- Other dependencies will be managed automatically via `pubspec.yaml`.

## Project Structure
-lib/main.dart: The entry point of the application.
-lib/screens/: Contains the different screen components (Meals, Favorites, etc.).
-lib/widgets/: Contains the custom widgets used across the app.

## How to Contribute
If you'd like to contribute to this project:
-Fork the repository.
-Create a new branch (git checkout -b feature-branch).
-Commit your changes (git commit -m 'Add new feature').
-Push to the branch (git push origin feature-branch).
-Open a Pull Request.

## License
This project is licensed under the MIT License.
