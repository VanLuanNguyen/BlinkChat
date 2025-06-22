import "package:chat_app/Model/ChatModel.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import 'package:chat_app/Screens/IndividualPage.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.chatModel});
  final ChatModel chatModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IndividualPage(
              chatModel: chatModel,
            )
          ));
      },
      child: Column(
        children: [
          ListTile(
            leading: 
            CircleAvatar(
              radius: 30,
              child: SvgPicture.asset(
                (chatModel.isGroup ?? false) ? "assets/groups.svg" : "assets/person.svg",
                height: 37,
                width: 37,
              ),
              backgroundColor: Colors.blueGrey,
            ),
            title: Text(
              chatModel.name,
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 16
              ),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.check, color: Colors.green, size: 16),
                SizedBox(width: 3),
                Text(
                  chatModel.currentMessage ?? '',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            trailing: Text(
              chatModel.time ?? '',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right:20, left: 80),
            child: Divider(
              thickness: 1,
              color: Colors.grey.shade300,
            ),
          ),
        ],
      ),
    );
  }
}