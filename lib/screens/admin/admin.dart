import 'package:flutter/material.dart';
import '../../responsive.dart';
import '../../widgets/menu.dart';
import '../../widgets/profile.dart';
import '../add_agents/agents_screen.dart';
import '../auth/login.dart';
import '../plans/plans_screen.dart';
import '../user/users_screen.dart';
import 'home_page.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onBottomNavTapped(int index) {
    _pageController.jumpToPage(index);
  }

  Future<bool> _exitpop(BuildContext context) async {
    bool? logoutConfirmed = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Exit'),
          content: const Text('Are you sure you want to exit?'),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).textTheme.bodyLarge?.color,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                side: BorderSide(
                  color: Theme.of(context).dividerColor,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('No'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                backgroundColor: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );

    if (logoutConfirmed == true) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    }
    return logoutConfirmed ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return WillPopScope(
      onWillPop: () => _exitpop(context),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        key: _scaffoldKey,
        drawer: !Responsive.isDesktop(context)
            ? SizedBox(width: 250, child: Menu(scaffoldKey: _scaffoldKey))
            : null,
        endDrawer: Responsive.isMobile(context)
            ? SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: const Profile(),
              )
            : null,
        body: SafeArea(
          child: Row(
            children: [
              if (Responsive.isDesktop(context))
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Menu(scaffoldKey: _scaffoldKey),
                  ),
                ),
              Expanded(
                flex: 8,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  children: [
                    HomePage(scaffoldKey: _scaffoldKey),
                    const UsersScreen(),
                    const AgentsScreen(),
                    PlansScreen(),
                  ],
                ),
              ),
              if (!Responsive.isMobile(context))
                const Expanded(
                  flex: 4,
                  child: Profile(),
                ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            _buildBottomNavigationBarItem(Icons.home, 'Home', 0),
            _buildBottomNavigationBarItem(Icons.people, 'Users', 1),
            _buildBottomNavigationBarItem(Icons.manage_accounts, 'Agents', 2),
            _buildBottomNavigationBarItem(Icons.attach_money, 'Plans', 3),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: isDarkMode
              ? Colors.white // Dark theme selected item color
              : Color(0xFF6750A4), // Light theme selected item color
          unselectedItemColor: isDarkMode
              ? Colors.grey[600] // Dark theme unselected item color
              : Colors.grey[800], // Light theme unselected item color
          backgroundColor: isDarkMode
              ? Color(0xFF21222D) // Dark theme background color
              : Colors.white, // Light theme background color
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          onTap: _onBottomNavTapped,
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: _selectedIndex == index
          ? Container(
              width: 50,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                size: 24,
                // color: Theme.of(context).textTheme.bodyMedium?.color,
                color: Color(0xFF6750A4),
              ),
            )
          : Icon(
              icon,
              size: 24,
              color: Theme.of(context).textTheme.bodyMedium?.color,
              // color: Color(0xFF6750A4),
            ),
      label: label,
    );
  }
}
