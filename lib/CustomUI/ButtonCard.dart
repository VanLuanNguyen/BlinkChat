import 'package:chat_app/Model/ChatModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({super.key, required this.name, this.icon});
  final String name;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          child: Icon(icon, size: 26, color: Colors.white),
          backgroundColor: Color(0xFF25D366),
        ),
        title: Text(
          name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}