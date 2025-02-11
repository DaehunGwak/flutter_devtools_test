import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TabBarTestPage(),
    );
  }
}

class TabBarTestPage extends StatelessWidget {
  final tabs = ['Top', 'Users', 'Videos', 'Sounds', 'Live', 'Shopping', 'All'];

  TabBarTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Discover'),
          bottom: TabBar(
            splashFactory: NoSplash.splashFactory,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              for (final tab in tabs) Tab(text: tab),
            ],
          ),
        ),
        body: Column(
          children: [
            CircularProgressIndicator(),
            CircularProgressIndicator(),
            CircularProgressIndicator(),
            CircularProgressIndicator(),
            CircularProgressIndicator(),
            CircularProgressIndicator(),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
