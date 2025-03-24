import 'package:flutter/material.dart';
import 'task_list_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> introData = [
      {'image': 'assets/intro1.png', 'text': 'Welcome to Task Manager'},
      {'image': 'assets/intro2.png', 'text': 'Track your tasks easily'},
      {'image': 'assets/intro3.png', 'text': 'Get things done faster'},
    ];

    return Scaffold(
      body: PageView.builder(
        itemCount: introData.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(introData[index]['image']!, height: 300),
              const SizedBox(height: 20),
              Text(introData[index]['text']!, style: const TextStyle(fontSize: 18)),
            ],
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const TaskListScreen()),
            );
          },
          child: const Text('Get Started'),
        ),
      ),
    );
  }
}
