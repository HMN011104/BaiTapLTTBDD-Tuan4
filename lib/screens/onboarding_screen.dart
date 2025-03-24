import 'package:flutter/material.dart';
import 'task_list_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/intro1.png",
      "title": "Easy Time Management",
      "description": "With management based on priority and dolly tasks, it will give you convenience in managing and determining the tasks that must be done first."
    },
    {
      "image": "assets/intro2.png",
      "title": "Increase Work Effectiveness.",
      "description": "Time management and the determination of more important tasks will give your job statistics better and always improve."
    },
    {
      "image": "assets/intro3.png",
      "title": "Reminder Notification",
      "description": "The advantage of this application is that it also provides reminders for you so you don't forget to keep doing your assignments well and according to the time you have set."
    },
  ];

  void nextScreen() {
    if (currentIndex < onboardingData.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => TaskListScreen()),
      );
    }
  }

  void skipScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => TaskListScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: skipScreen,
              child: Text("Skip", style: TextStyle(fontSize: 16, color: Colors.blue)),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(onboardingData[currentIndex]["image"]!),
                SizedBox(height: 20),
                Text(
                  onboardingData[currentIndex]["title"]!,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    onboardingData[currentIndex]["description"]!,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, color: currentIndex > 0 ? Colors.blue : Colors.grey),
                onPressed: currentIndex > 0 ? () => setState(() => currentIndex--) : null,
              ),
              ElevatedButton(
                onPressed: nextScreen,
                child: Text(currentIndex == onboardingData.length - 1 ? "Get Started" : "Next"),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
