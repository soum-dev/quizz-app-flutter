# Quiz App in Flutter

## Table of Contents
- [Project Overview](#project-overview)
- [Features](#features)
- [Screens](#screens)
  - [Categories Page](#categories-page)
  - [Detailed View](#detailed-view)
  - [Score View](#score-view)
- [Data Models](#data-models)
- [Bonus Features](#bonus-features)
- [Technologies Used](#technologies-used)
- [Setup and Installation](#setup-and-installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Project Overview
The Quiz App is a fully functional stateful Flutter application that allows users to select a quiz category and answer true or false questions related to that category. The goal is to create an engaging and educational experience with various categories like history, culture, math, and more.

## Features
- **Multiple Categories:** The app includes at least 5 different quiz categories such as History, Culture, Math, Geography, etc.
- **Questions:** Each category contains at least 10 questions, making sure that users get a comprehensive quiz experience.
- **Visuals:** Each category has a name and an associated image to make the selection visually appealing.
- **Answer Feedback:** The app provides immediate feedback after each question, indicating whether the user's answer was correct or incorrect.
- **Score View:** Displays the user's score after completing the quiz and allows them to start a new quiz.
- **User Interface:** Intuitive and clean UI with easy navigation between the quiz categories and questions.

## Screens

### Categories Page
The Categories Page is the starting screen where users can select the quiz category they wish to play. It features a grid layout with each category's name and an image.

### Detailed View
After selecting a category, the app navigates to the Detailed View screen. This screen displays:
- The image of the selected category.
- The question text and true/false buttons.
- Feedback on whether the answer was correct or incorrect.

### Score View
Once the user completes the quiz, the Score View screen displays the final score, showing the number of correct and incorrect answers. The user can return to the main page to start a new quiz from here.

## Data Models
The app uses two main models: `Question` and `Category`.

### Question Model
```dart
class Question {
  String question;
  bool answer;

  Question(this.question, this.answer);
}
```
This model represents a question with its text and the correct answer.

### Category Model
```dart
class Category {
  String name;
  String imageUrl;
  List<Question> questions;

  Category(this.name, this.imageUrl, this.questions);
}
```
This model represents each quiz category with a name, an image, and a list of questions associated with it.

## Bonus Features
- **Question-Specific Images:** Display specific images related to each question for enhanced visual engagement.
- **Timer:** Add a timer to each question to increase the challenge. If the user doesn't answer in time, the app automatically moves to the next question.
- **Difficulty Levels:** Allow users to choose between easy, medium, and hard difficulty levels for each category.
- **Leaderboard:** Display the top scores achieved by different users to encourage competition.
- **Shuffling Questions:** Shuffle the order of questions each time the user plays to ensure a unique experience.

## Technologies Used
- **Flutter**: For creating a seamless and responsive UI.
- **Dart**: The programming language used to develop the logic and functionality of the app.

## Setup and Installation
1. **Clone the repository:**
   ```bash
   git clone https://github.com/soum-dev/quiz-app.git
   cd quiz-app
   ```

2. **Install Flutter dependencies:**
   Make sure you have Flutter installed on your system. If not, [follow the official installation guide](https://flutter.dev/docs/get-started/install).

3. **Install required packages:**
   ```bash
   flutter pub get
   ```

4. **Run the app:**
   ```bash
   flutter run
   ```

## Usage
- **Select a Category:** Start by choosing a quiz category from the main page.
- **Answer Questions:** Read each question and select either the "True" or "False" button to submit your answer.
- **View Score:** Once you've completed the quiz, view your final score on the Score View screen.
- **Play Again:** Return to the main page to start a new quiz.

## Contributing
Contributions are welcome! If you have any suggestions or improvements, feel free to create a pull request or open an issue.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.

