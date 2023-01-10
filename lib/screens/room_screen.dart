// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clubhouse_ui/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clubhouse_ui/data.dart';

class RoomScreen extends StatelessWidget {
  final Room room;

  const RoomScreen({
    Key? key,
    required this.room,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 120,
        leading: TextButton.icon(
          style: TextButton.styleFrom(primary: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(CupertinoIcons.chevron_down),
          label: const Text('All Rooms'),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.doc,
              size: 28,
              color: Colors.black,
            ),
          ),
          GestureDetector(
            onTap: () {
              print('Hi!');
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 10, 20, 10),
              child: UserProfileImage(
                imageUrl: currentUser.imageUrl,
                size: 36,
              ),
            ),
          ),
        ],
      ),
    );
  }
}