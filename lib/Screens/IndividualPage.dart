import "package:chat_app/Model/ChatModel.dart";
import "package:emoji_picker_flutter/emoji_picker_flutter.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

class IndividualPage extends StatefulWidget {
  const IndividualPage({super.key, required this.chatModel});
  final ChatModel chatModel;
  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        leadingWidth: 70,
        titleSpacing: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_back,
                size: 25
              ),
              CircleAvatar(
                radius: 20,
                child: SvgPicture.asset(
                (widget.chatModel.isGroup ?? false) ? "assets/groups.svg" : "assets/person.svg",
                height: 35,
                width: 35,
                ),
                backgroundColor: Colors.blueGrey,
              )
            ],
          ),
        ),
        title: 
          InkWell(
            onTap: () {
              // Handle tap on title
            },
            child: Container(
              margin: EdgeInsets.all(6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.chatModel.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text("Last seen today at 12:00 PM",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        actions: [
          IconButton(
            icon: Icon(Icons.video_call),
            onPressed: () {
              // Handle video call action
            },
          ),
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {
              // Handle voice call action
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value){
              print(value);
            },
            itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text("View Contact"),
                value: "View Contact",
              ),
              PopupMenuItem(
                child: Text("Media, Links, and Docs"),
                value: "Media, Links, and Docs",
              ),
              PopupMenuItem(
                child: Text("WhatsApp Web"),
                value: "WhatsApp Web",
              ),
              PopupMenuItem(
                child: Text("Search"),
                value: "Search",
              ),
              PopupMenuItem(
                child: Text("Mute Notifications"),
                value: "Mute Notifications",
              ),
              PopupMenuItem(
                child: Text("Wallpaper"),
                value: "Wallpaper",
              ),
            ];
          }),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WillPopScope(
          child: Stack(
            children: [
              ListView(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 60,
                          child: Card(
                            margin: EdgeInsets.only(left: 2, right: 2, bottom: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: TextFormField(
                              controller: _controller,
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              minLines: 1,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Type a message",
                                prefixIcon: IconButton(
                                  icon: Icon(
                                    Icons.emoji_emotions_outlined), 
                                    onPressed: () {
                                      focusNode.unfocus();
                                      focusNode.canRequestFocus = false;
                                      setState(() {
                                        show = !show;
                                      });
                                    }),
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.attach_file),
                                      onPressed: () {
                                        showModalBottomSheet(
                                          backgroundColor: Colors.transparent,
                                          context: context, 
                                          builder: (builder) => bottomSheet()
                                          );
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.camera_alt_outlined),
                                      onPressed: () {},
                                    ),
                                  ]
                                ),
                                contentPadding: EdgeInsets.all(5),
                              ),
                              
                            )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10, right: 5, left: 2),
                          child: CircleAvatar(
                            backgroundColor: Color(0xFF25D366),
                            radius: 25,
                            child: IconButton(
                              icon: Icon(Icons.mic, color: Colors.white),
                              onPressed: () {
                                // Handle send message action
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                    show?emojiSelect(): Container(),
                  ],
                ),
              )
            ],
          ),
          onWillPop: () {
            if (show) {
              setState(() {
                show = false;
              });
              
            } else {
              Navigator.pop(context);
            }
            return Future.value(false);
          },
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 270,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconcreation(Icons.insert_drive_file, Colors.indigo, "Document"),
                    SizedBox(width: 40),
                    iconcreation(Icons.camera_alt, Colors.pink, "Camera"),
                    SizedBox(width: 40),
                    iconcreation(Icons.insert_photo, Colors.purple, "Gallery"),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconcreation(Icons.headset, Colors.orange, "Audio"),
                    SizedBox(width: 40),
                    iconcreation(Icons.location_pin, Colors.teal, "Location"),
                    SizedBox(width: 40),
                    iconcreation(Icons.person, Colors.blue, "Contact"),
                  ],
                )
            ]
          ),
        ),
      )
    );
  }

  Widget iconcreation(IconData icon,Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icon,
              size: 30,
              color: Colors.white,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
  Widget emojiSelect(){
    return EmojiPicker(
      onEmojiSelected: (category, emoji) {
        print(emoji);
        setState(() {
          if (emoji != null) {
            _controller.text += emoji.emoji;
          }
        });
      }
      );
  }
}