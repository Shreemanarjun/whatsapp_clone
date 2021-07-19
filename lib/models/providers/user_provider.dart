import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:whatsappclone/Controllers/chatcontroller.dart';
import 'package:whatsappclone/Models/chatitemmodel.dart';
import 'package:whatsappclone/Models/user_model.dart';

//API Provider for User List
class UserProvider extends GetConnect {
  final ChatController chatController = Get.find();
  Future<void> getUser() async {
    var head = {
      'app-id': '60992da1ea03b472bb9a096b',
    };
    final response =
        await get('http://dummyapi.io/data/api/user', headers: head);
    //parse response json to Model
    var users = Users.fromJson(response.body);
    final now = DateTime.now();
    //loop over model to get each user and convert them to chat model and store in chat controller chat list
    for (var item in users.user) {
      var chatitem = ChatItemModel(
          name: " ${item.firstName} ${item.lastName} ",
          pictureurl: item.picture,
          time: DateFormat.jm().format(now));
      chatController.chatUserList.add(chatitem);
    }

    chatController.apicalled.value = true;
    // return response.body;
  }
}
