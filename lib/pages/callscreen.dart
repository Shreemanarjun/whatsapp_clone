import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/controllers/chatcontroller.dart';
import 'package:whatsappclone/models/chatitemmodel.dart';

//Call Screen
class CallsScreen extends StatelessWidget {
  CallsScreen({Key key}) : super(key: key);
  final ChatController chatController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(8), child: buildCallList());
  }

  buildCallList() {
    return Container(
        padding: const EdgeInsets.only(top: 5),
        child: Obx(() => ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: chatController.chatUserList.length,
              itemBuilder: (context, index) {
                ChatItemModel chatItem = chatController.chatUserList[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: ListTile(
                    tileColor: Colors.white,
                    onTap: () {},
                    leading: Stack(
                      children: [
                        CircleAvatar(
                          maxRadius: 35,
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
                    subtitle: Row(
                      children: [
                        index.isEven
                            ? const Icon(
                                Icons.call_made,
                                color: Colors.teal,
                                size: 20,
                              )
                            : const Icon(
                                Icons.call_received,
                                color: Colors.red,
                                size: 20,
                              ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(chatItem.time),
                        ),
                      ],
                    ),
                    trailing: Icon(
                      index.isEven ? Icons.call : Icons.videocam,
                      color: Colors.teal,
                    ),
                  ),
                );
              },
            )));
  }
}
