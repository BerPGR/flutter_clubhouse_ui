// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:clubhouse_ui/widgets/user_profile_image.dart';
import 'package:clubhouse_ui/widgets/widgets.dart';
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
      body: Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(40)),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${room.club} ????'.toUpperCase(),
                        style: Theme.of(context).textTheme.overline!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(CupertinoIcons.ellipsis),
                      ),
                    ],
                  ),
                  Text(
                    room.name,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(20),
              sliver: SliverGrid.count(
                mainAxisSpacing: 20,
                crossAxisCount: 3,
                children: [
                  ...room.speakers
                      .map(
                        (e) => RoomUserProfile(
                          imageUrl: e.imageUrl,
                          size: 66,
                          name: e.givenName,
                          isNew: Random().nextBool(),
                          isMuted: Random().nextBool(),
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Followed by speakers',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.grey[400], fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(20),
              sliver: SliverGrid.count(
                mainAxisSpacing: 20,
                crossAxisCount: 4,
                childAspectRatio: 0.8,
                children: [
                  ...room.followedBySpeakers
                      .map(
                        (e) => RoomUserProfile(
                          imageUrl: e.imageUrl,
                          size: 66,
                          name: e.givenName,
                          isNew: Random().nextBool(),
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Other in room',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.grey[400], fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(20),
              sliver: SliverGrid.count(
                mainAxisSpacing: 20,
                crossAxisCount: 4,
                childAspectRatio: 0.7,
                children: [
                  ...room.others
                      .map(
                        (e) => RoomUserProfile(
                          imageUrl: e.imageUrl,
                          size: 66,
                          name: e.givenName,
                          isNew: Random().nextBool(),
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.only(bottom: 30),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        height: 70,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(24)),
                  child: const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '??????',
                          style: TextStyle(fontSize: 20),
                        ),
                        TextSpan(
                          text: 'Leave quietly',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.8),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey[300]),
                      child: Icon(
                        CupertinoIcons.add,
                        size: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey[300]),
                      child: Icon(
                        CupertinoIcons.hand_raised,
                        size: 30,
                      ),
                    ),
                  )
                ],
              )
            ]),
      ),
    );
  }
}
