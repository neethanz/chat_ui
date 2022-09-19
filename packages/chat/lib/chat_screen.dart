import 'package:chat/message_model.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> messages = [
    Message(
        text: 'Hello',
        date: DateTime.now().subtract(const Duration(days: 4)),
        isSentByMe: true),
    Message(
        text: 'Hi',
        date: DateTime.now().subtract(const Duration(days: 4)),
        isSentByMe: false),
    Message(
        text: 'Nothing much, just chlling out',
        date: DateTime.now().subtract(const Duration(days: 3)),
        isSentByMe: false),
    Message(
        text: 'Whats going on?',
        date: DateTime.now().subtract(const Duration(days: 3)),
        isSentByMe: true),
    Message(
        text: 'thinking about it, have some works , have to postpond',
        date: DateTime.now().subtract(const Duration(days: 2)),
        isSentByMe: true),
    Message(
        text: 'I heart some intersting facts about  the movie',
        date: DateTime.now().subtract(const Duration(days: 2)),
        isSentByMe: false),
    Message(
        text: 'What about movie night tomorrow? will u come?',
        date: DateTime.now().subtract(const Duration(days: 2)),
        isSentByMe: false),
    Message(
        text: 'Hmmm, try to come man, always work',
        date: DateTime.now().subtract(const Duration(days: 1)),
        isSentByMe: false)
  ].reversed.toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      // backgroundColor: Colors.amber,
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text(
          'Buddy',
          style: TextStyle(color: Color(0xff030303)),
        ),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        automaticallyImplyLeading: false,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Color(0xff030303)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(
                    "https://igimages.gumlet.io/malayalam/gallery/actress/saipallavi7715/saipallavi11072022_089.jpg?w=376&dpr=2.6")),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                CircleAvatar(backgroundColor: Colors.green.shade300, radius: 8),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: GroupedListView<Message, DateTime>(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            elements: messages,
            reverse: true,
            order: GroupedListOrder.DESC,
            groupBy: (Message message) => DateTime(
                message.date.year, message.date.month, message.date.day),
            groupHeaderBuilder: (Message message) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: SizedBox(
                height: 40,
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      DateFormat.yMMMMd().format(message.date),
                      style: TextStyle(color: Colors.black26),
                    ),
                  ),
                ),
              ),
            ),
            itemBuilder: (context, Message message) => Align(
              alignment: message.isSentByMe
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7),
                child: Card(
                  color: message.isSentByMe ? Color(0xff703EFE) : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: message.isSentByMe
                            ? Radius.circular(10)
                            : Radius.zero,
                        bottomRight: message.isSentByMe
                            ? Radius.zero
                            : Radius.circular(10),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                  ),
                  elevation: 0,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                    child: Text(
                      message.text,
                      style: TextStyle(
                          color: message.isSentByMe
                              ? Colors.white
                              : Color(0xff030303)),
                    ),
                  ),
                ),
              ),
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffFAFAFA),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: Color(0xffFAFAFA))),
                      labelText: 'Type here...',
                      labelStyle: TextStyle(
                        color: Color(0xffA1A1A1),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      suffixIcon: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            // color: Colors.green,
                            borderRadius: BorderRadius.circular(30)),
                        child: Align(
                          alignment: Alignment.center,
                          child: const FaIcon(
                            FontAwesomeIcons.paperPlane,
                            color: Color(0xffA1A1A1),
                          ),
                        ),
                      ),
                    ),
                    onSubmitted: (text) {
                      final message = Message(
                          text: text, date: DateTime.now(), isSentByMe: true);
                      setState(() {
                        messages.add(message);
                      });
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
