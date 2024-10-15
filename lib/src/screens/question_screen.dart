import 'package:flutter/material.dart';
import 'package:quizz_app/src/models/question_model.dart';
import 'package:quizz_app/src/screens/score_screen.dart';

class QuestionScreen extends StatefulWidget {
  final String categoryName;
  final List<Question> questions;

  const QuestionScreen({super.key, required this.categoryName, required this.questions});

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  bool? answerIsCorrect;

  void _handleAnswer(bool userAnswer) {
    bool correctAnswer = widget.questions[currentQuestionIndex].answer;
    setState(() {
      answerIsCorrect = (userAnswer == correctAnswer);
      if (answerIsCorrect!) {
        score++;
      }
    });

    // Display feedback for 1 second, then move to the next question or score screen
    Future.delayed(const Duration(seconds: 1), () {
      if (currentQuestionIndex < widget.questions.length - 1) {
        setState(() {
          currentQuestionIndex++;
          answerIsCorrect = null; // Reset feedback for the next question
        });
      } else {
        _navigateToScoreScreen();
      }
    });
  }

  void _navigateToScoreScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ScoreScreen(score: score, totalQuestions: widget.questions.length),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
        backgroundColor: Colors.amberAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Question ${currentQuestionIndex + 1} of ${widget.questions.length}',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              widget.questions[currentQuestionIndex].question,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            if (answerIsCorrect != null)
              Text(
                answerIsCorrect! ? 'Correct!' : 'Incorrect!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: answerIsCorrect! ? Colors.green : Colors.red,
                ),
              ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _handleAnswer(true),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: answerIsCorrect == true ? Colors.green : Colors.blue,
                  ),
                  child: const Text('True'),
                ),
                ElevatedButton(
                  onPressed: () => _handleAnswer(false),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: answerIsCorrect == false ? Colors.red : Colors.blue,
                  ),
                  child: const Text('False'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
