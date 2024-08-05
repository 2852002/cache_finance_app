import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../model/menu_modal.dart';
import '../profile/profile.dart';
import '../responsive.dart';
import '../screens/auth/login.dart';
import '../settings/settings.dart';

class Menu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const Menu({super.key, required this.scaffoldKey});

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<MenuModel> menu = [
    MenuModel(icon: 'assets/svg/home.svg', title: "Dashboard"),
    MenuModel(icon: 'assets/svg/profile.svg', title: "Profile"),
    MenuModel(icon: 'assets/svg/setting.svg', title: "Settings"),
    MenuModel(icon: 'assets/svg/signout.svg', title: "Logout"),
  ];

  int selected = 0;

  void _navigateToPage(String title) {
    if (title == "Profile") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    } else if (title == "Settings") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SettingsPage()),
      );
    } else if (title == "Logout") {
      _showLogoutDialog();
    }
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Logout"),
          content: const Text("Are you sure you want to logout?"),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Logout"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
                // Add your logout logic here
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);

    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: const Text('aps Technologies'),
            accountEmail: const Text('apstech@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: isDarkMode ? Colors.white : Colors.white,
              child: Text(
                'AT',
                style: TextStyle(
                  fontSize: 40.0,
                  color: isDarkMode ? Color(0xFF6750A4) : Color(0xFF6750A4),
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: isDarkMode ? Color(0xFF6750A4) : Color(0xFF6750A4),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: isDarkMode ? Colors.grey[800]! : Colors.grey[300]!,
                    width: 1,
                  ),
                ),
                color: isDarkMode ? Color(0xFF171821) : Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: Responsive.isMobile(context) ? 40 : 80,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: menu.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(6.0),
                              ),
                              color: selected == index
                                  ? theme.primaryColor
                                  : Colors.transparent,
                            ),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selected = index;
                                });
                                widget.scaffoldKey.currentState!.closeDrawer();
                                _navigateToPage(menu[index].title);
                              },
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 13, vertical: 7),
                                    child: SvgPicture.asset(
                                      menu[index].icon,
                                      color: selected == index
                                          ? (isDarkMode
                                              ? Colors.white
                                              : Colors.white)
                                          : (isDarkMode
                                              ? Colors.grey[500]
                                              : Colors.grey[800]),
                                    ),
                                  ),
                                  Text(
                                    menu[index].title,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: selected == index
                                            ? (isDarkMode
                                                ? Colors.white
                                                : Colors.white)
                                            : (isDarkMode
                                                ? Colors.grey[500]
                                                : Colors.grey[800]),
                                        fontWeight: selected == index
                                            ? FontWeight.w600
                                            : FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
