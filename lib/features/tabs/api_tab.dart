import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final dio = Dio();

class ApiTab extends StatefulWidget {
  const ApiTab({super.key});

  @override
  State<ApiTab> createState() => _ApiTabState();
}

class _ApiTabState extends State<ApiTab> {
  Response? _response;
  bool _isDone = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: _isDone ? _requestApi : null,
            child: Text('Send Request'),
          ),
          const SizedBox(height: 16.0),
          if (_response != null) ...[
            Text(
              'status: ${_response?.statusCode} ${_response?.statusMessage}',
            ),
            Text(
              'response: \r${jsonPrettyString(_response.toString())}',
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _requestApi() async {
    _isDone = false;
    _response = null;
    setState(() {});
    _response = await dio
        .get('https://tmdb-reverse-proxy-api.vercel.app/v3/movies/upcoming');
    _isDone = true;
    setState(() {});
  }

  String jsonPrettyString(String json) {
    final convertedMap = JsonDecoder().convert(json);
    return JsonEncoder.withIndent('  ').convert(convertedMap);
  }
}
