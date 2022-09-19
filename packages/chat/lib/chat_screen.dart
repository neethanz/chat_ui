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
        text: 'Whats going on?',
        date: DateTime.now().subtract(const Duration(days: 3)),
        isSentByMe: true),
    Message(
        text: 'Nothing much, just chlling out',
        date: DateTime.now().subtract(const Duration(days: 3)),
        isSentByMe: false),
    Message(
        text: 'What about movie night? will u come?',
        date: DateTime.now().subtract(const Duration(days: 2)),
        isSentByMe: false),
    Message(
        text: 'thinking about it, have some works , have to postpond',
        date: DateTime.now().subtract(const Duration(days: 2)),
        isSentByMe: true),
    Message(
        text: 'Hmmm, try to come man, always work',
        date: DateTime.now().subtract(const Duration(days: 1)),
        isSentByMe: false)
  ].reversed.toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3F51B5),
      appBar: AppBar(title: const Text('Chat UI')),
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
                      style: TextStyle(color: Colors.grey.shade700),
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
                  color: message.isSentByMe
                      ? Color(0xffC5CAE8)
                      : Color(0xffE8EAF6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Text(message.text),
                  ),
                ),
              ),
            ),
          )),
          Container(
            // color: Colors.grey.shade300,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    labelText: 'Enter your username',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    suffixIcon: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(30)),
                      child: Align(
                        alignment: Alignment.center,
                        child: const FaIcon(
                          FontAwesomeIcons.paperPlane,
                          color: Colors.white,
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
          )
        ],
      ),
    );
  }
}
