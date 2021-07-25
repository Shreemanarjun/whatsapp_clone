import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'callscreen.dart';
import 'chatscreen.dart';
import 'statusscreen.dart';

//All Pages with app bar and floating action button
class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final showfab = true.obs;
  final showstatus = false.obs;
  TabController _tabController;
  final currentindex = 0.obs;
  final icons = [Icons.message, Icons.call, Icons.edit, Icons.add_ic_call].obs;
  final searchClicked = false.obs;
  @override
  void initState() {
    super.initState();

    //listen to the tab and then according to it show flaoting action button
    _tabController = TabController(length: 4, initialIndex: 1, vsync: this)
      ..addListener(() {
        // print(_tabController.index);
        if (_tabController.index == 1) {
          showfab.value = true;
          currentindex.value = 0;
          showstatus.value = false;
        }
        //In status screen make showstatus to true
        else if (_tabController.index == 2) {
          showfab.value = true;
          currentindex.value = 2;
          showstatus.value = true;
        } else if (_tabController.index == 3) {
          showfab.value = true;
          currentindex.value = 3;
          showstatus.value = false;
        } else if (_tabController.index == 4) {
          showfab.value = true;
          currentindex.value = 4;
          showstatus.value = false;
        } else {
          Get.toNamed("/camera");
          showfab.value = false;
          showstatus.value = false;
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    double devicewidth = Get.width;
    double cameraWidth = devicewidth / 24;
    double normalWidth = (devicewidth - cameraWidth) / 5;
    return Scaffold(
      appBar: PreferredSize(
        //Whenever uer clicked search button,switch to app bar containg search
        child: Obx(() => !searchClicked.value
            ? buildDefaultAppBAr(devicewidth, cameraWidth, normalWidth)
            : buildSearchBar()),
        preferredSize: const Size.fromHeight(100.0),
      ),
      //in all screen show floating action button except camera screen ,
      floatingActionButton: Obx(() {
        if (showfab.value) {
          if (showstatus.value) {
            //In sttaus screen show two floating action button edit button and camera button
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () {},
                  backgroundColor: Colors.white,
                  mini: true,
                  elevation: 10,
                  child: const Icon(
                    Icons.edit,
                    color: Colors.teal,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: FloatingActionButton(
                    heroTag: null,
                    onPressed: () {},
                    elevation: 10,
                    child: const Icon(Icons.camera_alt),
                  ),
                ),
              ],
            );
          } else {
            return FloatingActionButton(
              heroTag: null,
              onPressed: () {},
              elevation: 10,
              child: Icon(icons[currentindex.value]),
            );
          }
        }
        return Wrap();
      }),
      //according tab controller change body screen
      body: TabBarView(
        controller: _tabController,
        children: [
          const Precamera(),
          ChatScreen(),
          StatusScreen(),
          CallsScreen(),
        ],
      ),
    );
  }

//custom search bar containing textfield,and prefix and suffix button
  AppBar buildSearchBar() {
    TextEditingController textEditingController = TextEditingController();
    return AppBar(
        backgroundColor: Colors.white70,
        toolbarHeight: 100,
        elevation: 10,
        title: TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            //contentPadding:
            //  const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            hintText: "Search..",
            prefixIcon: IconButton(
              onPressed: () {
                searchClicked.value = false;
              },
              icon: const Icon(Icons.arrow_back),
            ),
            suffixIcon: IconButton(
              onPressed: () => textEditingController.clear(),
              icon: const Icon(Icons.clear),
            ),
          ),
        ));
  }

//default app bar show title,and menu and search button
  AppBar buildDefaultAppBAr(
      double devicewidth, double cameraWidth, double normalWidth) {
    return AppBar(
      title: const Text(
        "WhatsApp",
        // style: TextStyle(fontSize: 22),
      ),
      elevation: 0.7,
      bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelPadding: EdgeInsets.symmetric(
              horizontal: (devicewidth - (cameraWidth + normalWidth * 3)) / 8),
          isScrollable: true,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
          tabs: [
            SizedBox(
              child: const Tab(icon: Icon(Icons.camera_alt)),
              width: cameraWidth,
            ),
            SizedBox(
              child: const Tab(
                text: "CHATS",
              ),
              width: normalWidth,
            ),
            SizedBox(
              child: const Tab(
                text: "STATUS",
              ),
              width: normalWidth,
            ),
            SizedBox(
              child: const Tab(
                text: "CALLS",
              ),
              width: normalWidth,
            ),
          ]),
      actions: [
        IconButton(
          padding: const EdgeInsets.all(0),
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: () {
            searchClicked.value = true;
          },
        ),

        //popup menu when more setting clicked
        PopupMenuButton(
          icon: const Icon(Icons.more_vert),
          itemBuilder: (context) => [
            const PopupMenuItem<int>(
              value: 0,
              child: Text(
                "New Group",
              ),
            ),
            const PopupMenuItem<int>(
              value: 1,
              child: Text(
                "New broadcast",
              ),
            ),
            const PopupMenuItem<int>(
              value: 2,
              child: Text(
                "Linked devices",
              ),
            ),
            const PopupMenuItem<int>(
              value: 3,
              child: Text(
                "Starred Messages",
              ),
            ),
            const PopupMenuItem<int>(
              value: 4,
              child: Text(
                "Payments",
              ),
            ),
            const PopupMenuItem<int>(
              value: 5,
              child: Text(
                "Settings",
              ),
            ),
          ],
        )
      ],
    );
  }
}

class Precamera extends StatelessWidget {
  const Precamera({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
    );
  }
}
