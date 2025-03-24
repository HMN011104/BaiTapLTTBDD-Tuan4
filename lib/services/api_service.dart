import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/task_model.dart';

class ApiService {
  static const String baseUrl = 'https://amock.io/api/researchUTH/tasks';

  static Future<List<Task>> fetchTasks() async {
    print('Fetching tasks from $baseUrl...');
    final response = await http.get(Uri.parse(baseUrl));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      if (json['isSuccess'] == true) {
        final List<dynamic> data = json['data'];
        return data.map((task) => Task.fromJson(task)).toList();
      } else {
        throw Exception('API Error: ${json['message']}');
      }
    } else {
      throw Exception('Failed to load tasks. Status code: ${response.statusCode}');
    }
  }

  static Future<Task> fetchTaskDetail(int taskId) async {
  final url = '$baseUrl/$taskId';
  print('Fetching URL: $url');

  final response = await http.get(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  );

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    final Map<String, dynamic> json = jsonDecode(response.body);
    if (json['isSuccess'] == true) {
      return Task.fromJson(json['data']);
    } else {
      throw Exception('API Error: ${json['message']}');
    }
  } else if (response.statusCode == 404) {
    throw Exception('Task with ID $taskId not found (404).');
  } else {
    throw Exception('Failed to load task details. Status code: ${response.statusCode}');
  }
}
}
