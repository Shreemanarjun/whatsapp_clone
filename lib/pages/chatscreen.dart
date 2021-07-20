import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:whatsappclone/controllers/chatcontroller.dart';
import 'package:whatsappclone/models/chatitemmodel.dart';
import 'package:whatsappclone/uis/circularimage.dart';

//Chat Screen
class ChatScreen extends StatelessWidget {
  ChatScreen({Key key}) : super(key: key);
  final ChatController chatController = Get.find();
  @override
  Widget build(BuildContext context) {
    //For emptied list when api called
    return Obx(() {
      if (chatController.chatUserList.isEmpty &&
          chatController.apicalled.value) {
        return const Center(
          child: Text("No Chats Yet"),
        );
      }
      //when chat list is not empty show all chats
      else if (chatController.chatUserList.isNotEmpty) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView.builder(
            itemCount: chatController.chatUserList.length,
            itemBuilder: (context, index) {
              ChatItemModel chatItem = chatController.chatUserList[index];
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Row(
                      children: <Widget>[
                        CircularImage(chatItem.pictureurl),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    flex: 6,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        chatItem.name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.0),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      chatItem.time,
                                      style: const TextStyle(
                                          color: Colors.black45),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(top: 2.0, left: 12),
                                    child: Text(
                                      "Hi",
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 16.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 25, top: 5),
                                    child: SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: Stack(children: <Widget>[
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6, vertical: 4),
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xff25D366)),
                                            alignment: Alignment.center,
                                            child: const Text(
                                              '1',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                      ]),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(),
                ],
              );
            },
          ),
        );
      }
      //when api being called wait and show circular bar
      else {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CircularProgressIndicator(
                color: Colors.teal,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Loading Messages"),
              )
            ],
          ),
        );
      }
    });
  }
}
