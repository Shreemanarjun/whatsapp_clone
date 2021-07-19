import 'package:get/get.dart';
import 'package:whatsappclone/controllers/chatcontroller.dart';

//Initilaize dependency in memory
class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatController());
  }
}
