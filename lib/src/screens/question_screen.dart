import 'package:flutter/material.dart';
import 'package:quizz_app/src/models/question_model.dart';
import 'package:quizz_app/src/screens/score_screen.dart';

class DetailedView extends StatefulWidget {
  final String categoryName;
  final String categoryImageUrl;
  final List<Question> questions;

  const DetailedView({
    super.key,
    required this.categoryName,
    required this.categoryImageUrl,
    required this.questions,
  });

  @override
  _DetailedViewState createState() => _DetailedViewState();
}

class _DetailedViewState extends State<DetailedView> {
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
        builder: (context) => ScoreScreen(
          score: score,
          totalQuestions: widget.questions.length,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Stack to display the image as the AppBar background with a height of 300
          Stack(
            children: [
              Container(
                height: 300, // Updated height of the image
                decoration: BoxDecoration(
                  borderRadius:const BorderRadius.all(Radius.circular(10.0)),
                  image: DecorationImage(
                    image: AssetImage(widget.categoryImageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 40, // Adjust as necessary for button positioning
                left: 10,
                child: IconButton(
                  icon:const Icon(Icons.arrow_back, color:Colors.amber),
                  onPressed: () {
                    Navigator.pop(context);
                    
                  },
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Text(
                  widget.categoryName,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    backgroundColor: Colors.black54, // Background for text visibility
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical:5.0), // Reduced vertical padding
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Question ${currentQuestionIndex + 1} of ${widget.questions.length}',
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10), // Reduced spacing here
                  Text(
                    widget.questions[currentQuestionIndex].question,
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20), // Reduced spacing here
                  if (answerIsCorrect != null)
                    Text(
                      answerIsCorrect! ? 'Correct!' : 'Incorrect!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: answerIsCorrect! ? Colors.green : Colors.red,
                      ),
                    ),
                  const SizedBox(height: 10), // Reduced spacing here
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => _handleAnswer(true),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: const Text(
                          'True',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.amber),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => _handleAnswer(false),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text(
                          'False',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.amber),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
