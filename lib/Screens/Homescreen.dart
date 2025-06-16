import 'package:chat_app/Pages/ChatPage.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blink Chat"),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          PopupMenuButton<String>(
            onSelected: (value){
              print(value);
            },
            itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text("New Group"),
                value: "New Group",
              ),
              PopupMenuItem(
                child: Text("New Broadcast"),
                value: "New Broadcast",
              ),
              PopupMenuItem(
                child: Text("WhatsApp Web"),
                value: "WhatsApp Web",
              ),
              PopupMenuItem(
                child: Text("Starred Messages"),
                value: "Starred Messages",
              ),
              PopupMenuItem(
                child: Text("Settings"),
                value: "Settings",
              ),
            ];
          }),
        ],
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Theme.of(context).colorScheme.secondary,
          labelColor: Theme.of(context).colorScheme.secondary,
          tabs: [
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(text: "CHATS"),
            Tab(text: "STATUS"),
            Tab(text: "CALLS"),
          ],
        )
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Center(child: Text("Camera")),
          ChatPage(),
          Center(child: Text("Status")),
          Center(child: Text("Calls")),
        ],
      ),
    );
  }
}