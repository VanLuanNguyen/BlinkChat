import 'package:chat_app/CustomUI/CustomCard.dart';
import 'package:chat_app/Model/ChatModel.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
      name: "John Doe",
      icon: "assets/person.svg",
      isGroup: false,
      time: "10:30 AM",
      currentMessage: "Hello, how are you?",
    ),
    ChatModel(
      name: "Jane Smith",
      icon: "assets/person.svg",
      isGroup: false,
      time: "9:15 AM",
      currentMessage: "See you later!",
    ),
    ChatModel(
      name: "Group Chat",
      icon: "assets/groups.svg",
      isGroup: true,
      time: "Yesterday",
      currentMessage: "Welcome to the group!",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action for the floating action button
        },
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) => CustomCard(
          chatModel: chats[index],)
      ),
    );
  }
}