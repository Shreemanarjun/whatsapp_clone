import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/controllers/chatcontroller.dart';
import 'package:whatsappclone/pages/mywpstatus.dart';

//Sttau screen
class StatusScreen extends StatelessWidget {
  StatusScreen({Key key}) : super(key: key);
  final ChatController chatController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 0),
        child: ListView(
          shrinkWrap: true,
          primary: false,
          children: [
            // User oWn Profile
            buildStatusProfileCard(),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Recent Updates",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ),
            //Recent Update List of Users
            buildStatusList(isRecent: true),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Viewed Updates",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ),
            //Recent Update List of Users
            buildStatusList(isRecent: false),
          ],
        ));
  }

  buildStatusList({bool isRecent = false}) {
    return Obx(() => Column(
          children: chatController.chatUserList
              .map(
                (chatItem) {
                  return ListTile(
                    tileColor: Colors.white,
                    onTap: () {
                      // print(index);
                    },
                    leading: Stack(
                      children: [
                        isRecent
                            ? Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.teal, width: 3),
                                    shape: BoxShape.circle),
                                child: CircleAvatar(
                                  maxRadius: 25,
                                  backgroundImage: NetworkImage(
                                    chatItem.pictureurl,
                                  ),
                                ),
                              )
                            : CircleAvatar(
                                maxRadius: 25,
                                backgroundImage: NetworkImage(
                                  chatItem.pictureurl,
                                ),
                              ),
                      ],
                    ),
                    title: Text(
                      chatItem.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Today, ${chatItem.time}"),
                  );
                },
              )
              .skip(10)
              .toList(),
        ));
  }

  Card buildStatusProfileCard() {
    return Card(
      elevation: 0,
      child: ListTile(
        onTap: () {
          // Get.toNamed("/story");
          // print("profile");
          Get.to(() => WPStatus());
        },
        leading: Stack(
          children: [
            const CircleAvatar(
              maxRadius: 35,
              backgroundImage: NetworkImage(
                "https://www.global.hokudai.ac.jp/wp-content/uploads/2020/07/default-avatar-profile-image-vector-social-media-user-icon-potrait-182347582.jpg",
              ),
            ),
            Positioned(
                bottom: 1.0,
                right: 3.0,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                      // shape: BoxShape.circle,
                      color: Colors.green),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 25,
                  ),
                ))
          ],
        ),
        title: const Text(
          "My Status",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: const Text("Tap to add status update"),
      ),
    );
  }
}
