import "package:flutter/material.dart";

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
      ),
      title: Text(
        "John Doe",
        style: TextStyle(
          fontWeight: FontWeight.bold, 
          fontSize: 16
        ),
      ),
      subtitle: Row(
        children: [
          Icon(Icons.check, color: Colors.green, size: 16),
          SizedBox(width: 3),
          Text("Hello, how are you?",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
      trailing: Text(
        "10:30 AM",
        style: TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
      ),
    );
  }
}