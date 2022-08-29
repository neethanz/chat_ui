import 'package:chat/message_model.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

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
            groupHeaderBuilder: (Message message) => SizedBox(
              height: 40,
              child: Align(
                alignment: Alignment.center,
                child: Card(
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      DateFormat.yMMMMd().format(message.date),
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
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(message.text),
                  ),
                ),
              ),
            ),
          )),
          Container(
            color: Colors.grey.shade300,
            child: TextField(
                decoration:
                    const InputDecoration(hintText: 'Type your message here'),
                onSubmitted: (text) {
                  final message = Message(
                      text: text, date: DateTime.now(), isSentByMe: true);
                  setState(() {
                    messages.add(message);
                  });
                }),
          )
        ],
      ),
    );
  }
}
