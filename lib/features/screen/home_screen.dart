import 'package:flutter/material.dart';

import '../../models/types/tab_type.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    this.tabName,
  });

  final String? tabName;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: TabType.toIndex(widget.tabName),
      length: TabType.values.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter DevTools Test'),
        bottom: TabBar(
          controller: _tabController,
          splashFactory: NoSplash.splashFactory,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.tab,
          tabAlignment: TabAlignment.start,
          tabs: [
            for (final tab in TabType.values) Tab(text: tab.title),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ...TabType.values.map((tab) => tab.createTab()),
        ],
      ),
    );
  }
}
