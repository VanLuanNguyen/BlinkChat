import 'package:chat_app/CustomUI/ButtonCard.dart';
import 'package:chat_app/CustomUI/ContactCard.dart';
import 'package:chat_app/Model/ChatModel.dart';
import 'package:flutter/material.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  List<ChatModel> contacts = [
    ChatModel(
      name: "John Doe",
      status: "A software engineer",
      isGroup: false,
    ),
    ChatModel(
      name: "Jane Smith",
      status: "A graphic designer",
      isGroup: false,
    ),
    ChatModel(
      name: "Alice Johnson",
      status: "A project manager",
      isGroup: false,
    ),
    ChatModel(
      name: "Bob Brown",
      status: "A data scientist",
      isGroup: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Select Contact", 
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              )
            ),
            Text(
              "256 Contacts",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              )
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, size: 26)
          ),
          PopupMenuButton<String>(
            onSelected: (value){
              print(value);
            },
            itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text("Invite a Friend"),
                value: "Invite a Friend",
              ),
              PopupMenuItem(
                child: Text("Contacts"),
                value: "Contacts",
              ),
              PopupMenuItem(
                child: Text("Refresh"),
                value: "Refresh",
              ),
              PopupMenuItem(
                child: Text("Help"),
                value: "Help",
              ),
            ];
          }),
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length + 2,
        itemBuilder: (context, index) {
          if (index == 0){
            return ButtonCard(
              name: "New Group",
              icon: Icons.group_add,
            );
          }
          else if (index == 1) {
            return ButtonCard(
              name: "New contact",
              icon: Icons.person_add,
            );
          }
          return ContactCard(contact: contacts[index - 2]);
        },
      ),
    );
  }
}