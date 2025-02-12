import 'package:flutter/cupertino.dart';
import 'package:flutter_tab_bar_test/features/tabs/animation_tab.dart';
import 'package:flutter_tab_bar_test/features/tabs/api_tab.dart';
import 'package:flutter_tab_bar_test/features/tabs/big_image_tab.dart';

enum TabType {
  animation(title: 'Animation'),
  bigImage(title: 'Big Image'),
  api(title: 'API'),
  ;

  const TabType({
    required this.title,
  });

  final String title;

  static int toIndex(String? tabName) {
    if (tabName == null || tabName.isEmpty) {
      return 0;
    }
    return TabType.values
        .map((tap) => tap.name)
        .toList()
        .indexOf(tabName.toUpperCase());
  }

  static TabType fromIndex(int index) {
    return TabType.values[index];
  }

  Widget createTab() {
    return switch (this) {
      TabType.animation => AnimationTab(),
      TabType.bigImage => BigImageTab(),
      TabType.api => ApiTab(),
    };
  }
}
