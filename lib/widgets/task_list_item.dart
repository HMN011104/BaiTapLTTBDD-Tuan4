import 'package:flutter/material.dart';
import '../models/task_model.dart';

class TaskListItem extends StatelessWidget {
  final Task task;
  final VoidCallback onTap;

  const TaskListItem({
    Key? key,
    required this.task,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        onTap: onTap,
        title: Text(
          task.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              task.description,
              style: const TextStyle(color: Colors.grey),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              'Due: ${task.dueDate.substring(0, 10)}',
              style: const TextStyle(color: Colors.redAccent, fontSize: 12),
            ),
          ],
        ),
        trailing: Icon(
          task.status == 'In Progress' ? Icons.hourglass_empty : Icons.check_circle,
          color: task.status == 'In Progress' ? Colors.orange : Colors.green,
        ),
      ),
    );
  }
}
