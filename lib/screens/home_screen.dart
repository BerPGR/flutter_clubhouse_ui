import 'package:clubhouse_ui/data.dart';
import 'package:clubhouse_ui/widgets/user_profile_image.dart';
import 'package:clubhouse_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.search,
            size: 28,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.envelope_open,
              size: 26,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              CupertinoIcons.calendar,
              size: 28,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              CupertinoIcons.bell,
              size: 28,
              color: Colors.black,
            ),
            onPressed: () {},
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
      body: Stack(
        alignment: Alignment.center,
        children: [
          ListView(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 120),
            children: [
              UpcomingRooms(upcomingRooms: upcomingRoomsList),
              const SizedBox(
                height: 12,
              ),
              ...roomsList.map((e) => RoomCard(room: e))
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
                    Theme.of(context).scaffoldBackgroundColor,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(24)),
              child: const Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(
                        CupertinoIcons.add,
                        size: 21,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                        text: ' Start a room',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 50,
              right: 40,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.circle_grid_3x3_fill,
                      size: 28,
                    ),
                  ),
                  Positioned(
                    right: 4.6,
                    bottom: 11.8,
                    child: Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).accentColor),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
