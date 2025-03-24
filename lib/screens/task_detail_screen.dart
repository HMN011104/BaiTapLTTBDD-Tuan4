import 'package:flutter/material.dart';
import '../services/api_service.dart';

class TaskDetailScreen extends StatelessWidget {
  final int taskId;

  const TaskDetailScreen({Key? key, required this.taskId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task Detail')),
      body: FutureBuilder(
        future: ApiService.fetchTaskDetail(taskId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed to load details:${snapshot.error}'));
          } else if (snapshot.hasData) {
            final task = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(task.title),
            );
          } else {
            return const Center(child: Text('Task not found'));
          }
        },
      ),
    );
  }
}
