import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rent_house/theme.dart';

import '../../models/chatMessageModel.dart';

class ChatRoom extends StatefulWidget{
  String idChatRoom;
  String photoUrl;
  String displayName;
  ChatRoom({required this.idChatRoom, required this.photoUrl, required this.displayName});
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String myId = FirebaseAuth.instance.currentUser!.uid;
  final TextEditingController _messageController = TextEditingController();

  Stream<List<ChatMessage>> conversationGivenRoom(String idChatRoom ) =>
      FirebaseFirestore.instance.collection('/Chats/'+idChatRoom+'/messages').orderBy('timestamp', descending: false)
          .snapshots().map((snap) =>
          snap.docs.map((doc)=> ChatMessage.fromJson(doc.data()) )
              .toList());

  void sendMessage(){
    if(_messageController.text.isNotEmpty) {
      FirebaseFirestore.instance.collection(
          '/Chats/' + widget.idChatRoom + '/messages').add(ChatMessage(message: _messageController.text,
          timestamp: DateTime.now(),
          sentBy: myId).toJson());
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: purpleColor.withOpacity(0.8),
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back,color: Colors.black,),
                  ),
                  SizedBox(width: 2,),
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.photoUrl),
                    maxRadius: 20,
                  ),
                  SizedBox(width: 12,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(widget.displayName,style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
                        SizedBox(height: 6,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              child:
              StreamBuilder<List<ChatMessage>>(
                stream: conversationGivenRoom(widget.idChatRoom),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasError)
                    return Text("Error connection");
                  else if (snapshot.hasData) {
                    final conversation = snapshot.data;
                    //replicateData();
                    return ListView(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.only(top: 10,bottom: 10),
                      scrollDirection: Axis.vertical,
                      children: conversation!.map(chatMessage).toList(),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },

              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(28)
              ),
              padding: EdgeInsets.all(5),
              //height: 100,
              width: double.infinity,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 200, minHeight: 20),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 15,),
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        //expands: true,
                        decoration: InputDecoration(
                            hintText: "Write message...",
                            hintStyle: TextStyle(color: Colors.black54),
                            border: InputBorder.none
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    FloatingActionButton(
                      onPressed: (){
                        sendMessage();
                      },
                      child: Icon(Icons.send_outlined,color: Colors.white,size: 18,),
                      backgroundColor: Colors.purple.shade800,
                      elevation: 0,
                    ),
                  ],

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget chatMessage(ChatMessage chat) => Container(
    padding: EdgeInsets.only(left: 14,right: 14,top: 5,bottom: 5),
    child: Align(
      alignment: (chat.sentBy != myId ? Alignment.topLeft:Alignment.topRight),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: (chat.sentBy  != myId ? purpleColor.withOpacity(0.3):purpleColor.withOpacity(0.8)),
        ),
        padding: EdgeInsets.all(16),
        child: Text(chat.message, style: TextStyle(fontSize: 15),),
      ),
    ),
  );
}

