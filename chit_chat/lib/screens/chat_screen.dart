import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:chit_chat/widgets/chat_messages.dart';
import 'package:chit_chat/widgets/new_message.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Screen'),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: Icon(Icons.exit_to_app),
            color: Colors.lightGreen,
          )
        ],
      ),
      // backgroundColor: Colors.grey.shade300,
      body: Column(
        children: [
          Expanded(
            child: ChatMessages(),
          ),
          NewMessage(),
        ],
      ),
    );
  }
}
