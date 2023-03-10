import 'package:flutter/material.dart';
import 'package:rent_house/screens/chat/chat_room.dart';
import 'package:rent_house/theme.dart';

import '../../models/chatUserModel.dart';
import 'conversationList.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(name: "Jane Russel", messageText: "Awesome Setup", imageURL: "assets/images/owner1.png", time: "Now"),
    ChatUsers(name: "Glady's Murphy", messageText: "That's Great", imageURL: "assets/images/owner1.png", time: "Yesterday"),
    ChatUsers(name: "Jorge Henry", messageText: "Hey where are you?", imageURL: "assets/images/owner1.png", time: "31 Mar"),
    ChatUsers(name: "Philip Fox", messageText: "Busy! Call me in 20 mins", imageURL: "assets/images/owner1.png", time: "28 Mar"),
    ChatUsers(name: "Debra Hawkins", messageText: "Thankyou, It's awesome", imageURL: "assets/images/owner1.png", time: "23 Mar"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: purpleColor.withOpacity(0.8),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                itemCount: chatUsers.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 16),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
                  return Conversation(
                      name: chatUsers[index].name,
                      messageText: chatUsers[index].messageText,
                      imageUrl: chatUsers[index].imageURL,
                      time: chatUsers[index].time,
                      isMessageRead: (index == 0 || index == 3)?true:false,
                    )
                  ;
                },
              ),
            ]
          ),
        ),
      ),
    );
  }
}