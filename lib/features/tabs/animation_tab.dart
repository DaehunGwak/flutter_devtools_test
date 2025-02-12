import 'package:flutter/material.dart';

class AnimationTab extends StatelessWidget {
  const AnimationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var i = 0; i < 10; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var j = 0; j < 5; j++) CircularProgressIndicator(),
              ],
            ),
        ],
      ),
    );
  }
}
