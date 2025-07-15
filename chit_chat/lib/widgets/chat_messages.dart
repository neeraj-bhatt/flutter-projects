import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:chit_chat/widgets/message_bubble.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticatedUser = FirebaseAuth.instance.currentUser!;

    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text('No Message Found.'),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text('Something went wrong...'),
          );
        }
        final loadedMessage = snapshot.data!.docs;
        return ListView.builder(
          padding: const EdgeInsets.only(bottom: 40, left: 13, right: 13),
          reverse: true,
          itemCount: loadedMessage.length,
          itemBuilder: (context, index) {
            //  Messages
            final chatMessage = loadedMessage[index].data(); //  current message
            final nextChatMessage = index + 1 < loadedMessage.length
                ? loadedMessage[index + 1].data()
                : null; //  next message if there is
            //  User Ids
            final currentMessageUserId = chatMessage['userId'];
            final nextMessageUserId =
                nextChatMessage != null ? nextChatMessage['userId'] : null;

            final isNextUserIdSame = currentMessageUserId == nextMessageUserId;

            if (isNextUserIdSame) {
              return MessageBubble.next(
                  message: chatMessage['text'],
                  isMe: authenticatedUser.uid == currentMessageUserId);
            } else {
              return MessageBubble.first(
                  username: chatMessage['userName'],
                  message: chatMessage['text'],
                  isMe: authenticatedUser.uid == currentMessageUserId);
            }
          },
        );
      },
    );
  }
}
