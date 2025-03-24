import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/task_model.dart';
import 'dart:io';
import 'dart:developer';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class ApiService {
  static const String baseUrl = 'https://amock.io/api/researchUTH/tasks';

  static Future<void> logToFile(String message) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/app_log.txt');
    await file.writeAsString('$message\n', mode: FileMode.append);
  }

  static Future<List<Task>> fetchTasks() async {
    final response = await http.get(Uri.parse(baseUrl));
    final logMessage =
        'Fetching Tasks: Status: ${response.statusCode}, Body: ${response.body}';
    await logToFile(logMessage);
    log(logMessage);

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
    final response = await http.get(Uri.parse(url));
    final logMessage =
        'Fetching Task $taskId: URL: $url, Status: ${response.statusCode}, Body: ${response.body}';
    await logToFile(logMessage);
    log(logMessage);

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      if (json['isSuccess'] == true) {
        return Task.fromJson(json['data']);
      } else {
        throw Exception('API Error: ${json['message']}');
      }
    } else {
      throw Exception('Failed to load task details. Status code: ${response.statusCode}');
    }
  }
}
