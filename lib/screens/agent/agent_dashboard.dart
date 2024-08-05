// import 'package:flutter/material.dart';
// import '../../profile/profile_screen.dart';
// import '../auth/login_screen.dart';
// import '../notification/notificationpage.dart';
// import '../plans/plans_screen.dart';
// import '../user/users_screen.dart';

// class AgentDashboard extends StatelessWidget {
//   const AgentDashboard({super.key});

//   void _logout(BuildContext context) {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//           builder: (context) =>
//               const LoginScreen()), // Replace with your login screen widget
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white38,
//         elevation: 0,
//         title: Row(
//           children: [
//             const Text(
//               'Hello Agent Name',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 18,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             const Spacer(),
//             IconButton(
//               icon: const Icon(
//                 Icons.notifications,
//                 size: 30,
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const NotificationPage()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       drawer: _buildDrawer(context),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             _buildDashboardCard(
//               title: 'Total Collected Amount',
//               value: '\$800',
//               subtitle: 'No. of Collected Users',
//               subValue: '8',
//               extraRow1: 'Total Pending Amount',
//               extraValue1: '\$200',
//               extraRow2: 'No. of Pending Users',
//               extraValue2: '2',
//             ),
//             const SizedBox(height: 20),
//             _buildDashboardCard(
//               title: 'Total Pending Amount',
//               value: '\$200',
//               subtitle: 'No. of Pending Users',
//               subValue: '2',
//               extraRow1: 'Total Pending Amount',
//               extraValue1: '\$600',
//               extraRow2: 'No. of Pending Users',
//               extraValue2: '6',
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Container(
//         decoration: BoxDecoration(
//           color: Colors.grey.shade300,
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20),
//           ),
//         ),
//         child: BottomNavigationBar(
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.people),
//               label: 'Users',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.attach_money),
//               label: 'Plans',
//             ),
//           ],
//           currentIndex: 0,
//           selectedItemColor: const Color(0xFF053730),
//           unselectedItemColor: const Color(0xFF053730),
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           type: BottomNavigationBarType.fixed,
//           onTap: (index) {
//             if (index == 0) {
//               // Navigate to home or current screen
//             } else if (index == 1) {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const UsersScreen()),
//               );
//             } else if (index == 2) {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => PlansScreen()),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildDrawer(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           const UserAccountsDrawerHeader(
//             accountName: Text('Agent Name'),
//             accountEmail: Text('agent.email@example.com'),
//             currentAccountPicture: CircleAvatar(
//               backgroundColor: Colors.white,
//               child: Text(
//                 'AN',
//                 style: TextStyle(fontSize: 40.0, color: Color(0xFF053730)),
//               ),
//             ),
//             decoration: BoxDecoration(
//               color: Color(0xFF053730),
//             ),
//           ),
//           ListTile(
//             leading: const Icon(Icons.person),
//             title: const Text('Profile'),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const ProfileScreen()),
//               );
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.logout),
//             title: const Text('Logout'),
//             onTap: () {
//               _logout(context);
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildDashboardCard({
//     required String title,
//     required String value,
//     required String subtitle,
//     required String subValue,
//     required String extraRow1,
//     required String extraValue1,
//     required String extraRow2,
//     required String extraValue2,
//   }) {
//     return Card(
//       elevation: 2,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           gradient: const LinearGradient(
//             colors: [Color(0xFF053730), Color(0xFF0A6048)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: const Color(0xFF053730).withOpacity(0.3),
//               spreadRadius: 2,
//               blurRadius: 5,
//               offset: const Offset(0, 3), // changes position of shadow
//             ),
//           ],
//         ),
//         child: Stack(
//           children: [
//             Positioned(
//               top: 0,
//               right: 0,
//               child: Container(
//                 width: 60,
//                 height: 60,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.white.withOpacity(0.1),
//                 ),
//               ),
//             ),
//             Positioned(
//               bottom: 0,
//               left: 0,
//               child: Container(
//                 width: 50,
//                 height: 50,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.white.withOpacity(0.1),
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 20,
//               left: 20,
//               child: Container(
//                 width: 30,
//                 height: 30,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.white.withOpacity(0.1),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 8),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         title,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.white,
//                         ),
//                       ),
//                       Text(
//                         value,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         subtitle,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           color: Colors.white,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                       Text(
//                         subValue,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         extraRow1,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.white,
//                         ),
//                       ),
//                       Text(
//                         extraValue1,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         extraRow2,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.white,
//                         ),
//                       ),
//                       Text(
//                         extraValue2,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
