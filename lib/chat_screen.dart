
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  String? name;

  ChatScreen({
    this.name,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // Instance (FireStore)
  final fireStore = FirebaseFirestore.instance;

  final String collectionName = 'chat';

  TextEditingController msgController = TextEditingController();
  // DateTime now = DateTime.now();
  static final DateTime now = DateTime. now();
  static final DateFormat formatter = DateFormat('dd-MM-yyyy,hh:mm a');
  final String formatted = formatter. format(now);

  addMsg() {
    fireStore.collection(collectionName).add({
      'msg': msgController.text,
      'senderID': widget.name,
      'date and time': FieldValue.serverTimestamp(),
    });
    msgController.clear();
  }
  String formatTimestamp(int timestamp) {
    String value ='';
    String time = value.split('at').first;

    // mm-dd-yyyy =>

    var format = new DateFormat('d MMM, hh:mm a');
    var date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return format.format(date);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.video_call_rounded),
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.call),
          )
        ],
        backgroundColor: Colors.teal,
        title: Text('ChatScreen'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: fireStore
            .collection(collectionName)
            .orderBy('date and time', descending: false)
            .snapshots(),

        builder: (context, snapshot) {
          return snapshot.hasData
              ? chatBody(snapshot.data)
              : snapshot.hasError
                  ? Text('ERROR')
                  : Center(
                      child: CircularProgressIndicator(),
                    );
        },
      ),
    );
  }

  Widget chatBody(dynamic data) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: ListView.builder(
              itemCount: data.docs.length,
              reverse: false,
              itemBuilder: (context, index) {
                return Align(
                  alignment: widget.name == data.docs[index]['senderID']
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),

                    child: Column(
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        BubbleSpecialOne(
                          text: '${data.docs[index]['senderID'] ?? ''} :  ${data.docs[index]['msg'] ?? ''}  '
                              ,

                          color: Colors.teal,
                          isSender: widget.name == data.docs[index]['senderID']
                              ? true
                              : false,
                          delivered: true,
                          tail: true,
                          seen: true,
                          sent: true,
                          textStyle: TextStyle(fontSize: 20, color: Colors.white),

                        ),
                        Text('${formatted.toString()}')
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: TextFormField(
                      controller: msgController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey,
                        filled: true,
                        hintText: 'Enter your Message',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.teal)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          addMsg();
                        },
                        icon: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
