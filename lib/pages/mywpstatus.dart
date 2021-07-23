import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:story_view/story_view.dart';

//Whatsapp status view

class WPStatus extends StatelessWidget {
  WPStatus({Key key}) : super(key: key);
  final controller = StoryController();
  @override
  Widget build(BuildContext context) {
    List<StoryItem> storyItems = [
      StoryItem.text(
          backgroundColor: Colors.red, title: '"Hello', roundedTop: true),
      StoryItem.pageImage(
          url: 'https://randomuser.me/api/portraits/women/58.jpg',
          controller: controller),
    ]; // your list of stories

    return Scaffold(
      body: StoryView(
        controller: controller, // pass controller here too
        repeat: true, // should the stories be slid forever
        onStoryShow: (s) {},
        onComplete: () {},
        onVerticalSwipeComplete: (direction) {
          if (direction == Direction.down) {
            Get.back();
          }
        },
        storyItems:
            storyItems, // To disable vertical swipe gestures, ignore this parameter.
        // Preferrably for inline story view.
      ),
    );
  }
}
