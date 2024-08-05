import 'package:finance/profile/profile.dart';
import 'package:finance/responsive.dart';
import 'package:finance/screens/notification/notificationpage.dart';
import 'package:flutter/material.dart';

import '../const.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLightTheme = theme.brightness == Brightness.light;

    return SizedBox(
      height: 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!Responsive.isDesktop(context))
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: () => scaffoldKey.currentState!.openDrawer(),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.menu,
                        color: isLightTheme
                            ? Colors.black
                            : Colors.white, // Menu icon color
                        size: 25,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Aps Technologies",
                        style: TextStyle(
                            color: isLightTheme
                                ? Colors.black
                                : Colors.white, // Greeting text color
                            fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
            ),
          if (Responsive.isMobile(context))
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.notifications,
                    color: isLightTheme
                        ? Colors.black54
                        : Colors.white, // Notifications icon color
                    size: 27,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationPage()));
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.person_3_rounded,
                    color: isLightTheme
                        ? Color(0xFF6750A4)
                        : Color(0xFFB39DDB), // Profile icon color
                    size: 31,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfilePage()));
                  },
                ),
              ],
            ),
        ],
      ),
    );
  }
}
