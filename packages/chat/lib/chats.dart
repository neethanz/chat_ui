import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'chat_model.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  final List<Chat> chats = [
    Chat(
        date: '23:11',
        isOnline: true,
        message: 'Check mail',
        sender: 'Dilan',
        profileUrl:
            'https://images.unsplash.com/photo-1623230590824-f39e31a0a608?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aW5kaWFuJTIwYm95fGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
    Chat(
        date: '22:01',
        isOnline: false,
        message: 'Send me those files',
        sender: 'sayan',
        profileUrl:
            'https://media.istockphoto.com/photos/playful-baby-boy-with-striped-shirt-at-home-picture-id1392767680?b=1&k=20&m=1392767680&s=170667a&w=0&h=BkMpJ11aehPXXV4FGGu7YYu-G9mlPFlMfarLssXv5kk='),
    Chat(
        date: '22:00',
        isOnline: true,
        message: 'Great dinner today \u1F600',
        sender: 'Jasmi',
        profileUrl:
            'https://c1.staticflickr.com/1/578/21820499801_7cb12b1043_b.jpg'),
    Chat(
        date: '20:23',
        isOnline: false,
        message: 'Good night man,sd tc',
        sender: 'Beta',
        profileUrl:
            'https://im.indiatimes.in/content/itimes/photo/2016/Jul/21/1469099518-cutest-baby-images-you-cannot-ignore-her.jpg?w=414&h=311&cc=1'),
    Chat(
        date: '17:11',
        isOnline: false,
        message: 'Completed saleforce certification',
        sender: 'Nammi',
        profileUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLTtm75C2mjnlajaXXh5hqznGO5M19p79ZgQ&usqp=CAU'),
    Chat(
        date: '17:05',
        isOnline: true,
        message: 'Key enga vaipa?',
        sender: 'Saru',
        profileUrl:
            'https://www.soldevelo.com/blog/wp-content/uploads/What-makes-a-great-programmer-banner-1536x1024-1.jpeg'),
    Chat(
        date: '12:34',
        isOnline: true,
        message: 'Come to airriis',
        sender: 'Nithu',
        profileUrl:
            'https://career.comarch.com/files-com/file_45/good_programmer_comarch.jpg'),
  ];
  final List<String> entries = <String>[
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'J',
    'K'
  ];
  final List<int> colorCodes = <int>[600, 500, 100];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xff703EFE),
        selectedIconTheme: IconThemeData(
          color: Color(0xff703EFE),
        ),
        unselectedIconTheme: IconThemeData(
          color: Color(0xff999999),
        ),
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.earthAmericas,
                // color: Color(0xffA1A1A1),
              ),
              label: 'Earth'),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.message,
                // color: Color(0xffA1A1A1),
              ),
              label: 'Chat'),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.phone,
                // color: Color(0xffA1A1A1),
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.gear,
                // color: Color(0xffA1A1A1),
              ),
              label: 'Chat')
        ],
      ),
      body: SafeArea(
        child: Container(
          // color: Colors.amber,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: 'Search chat',
                    filled: true,
                    fillColor: Colors.white,
                    labelStyle: TextStyle(color: Color(0xff999999)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    prefixIcon: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          // color: Colors.green,
                          borderRadius: BorderRadius.circular(30)),
                      child: Align(
                        alignment: Alignment.center,
                        child: const FaIcon(
                          FontAwesomeIcons.magnifyingGlass,
                          color: Color(0xff999999),
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: chats.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Card(
                            elevation: 0,
                            child: ListTile(
                              leading: Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          chats[index].profileUrl)),
                                  CircleAvatar(
                                    backgroundColor: chats[index].isOnline
                                        ? Colors.green
                                        : Color(0xff999999),
                                    radius: 5,
                                  )
                                ],
                              ),
                              title: Text(chats[index].sender),
                              subtitle: Text(chats[index].message),
                              trailing: Text(chats[index].date,
                                  style: TextStyle(color: Colors.black26)),
                              // isThreeLine: true,
                            )),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
