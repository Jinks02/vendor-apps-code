import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// ignore: must_be_immutable
class ChatBubble extends StatefulWidget {
  DocumentSnapshot chatMessage;
  ChatBubble({@required this.chatMessage});
  @override
  _ChatBubbleState createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
      child: Align(
        alignment: (widget.chatMessage['transfertype'] == 'finder' ? Alignment.topLeft : Alignment.topRight),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: (widget.chatMessage['transfertype'] == 'finder' ? Theme.of(context).primaryColor : Theme.of(context).primaryColor),
          ),
          padding: EdgeInsets.all(16),
          child: Text(widget.chatMessage['message']),
        ),
      ),
    );
  }
}
