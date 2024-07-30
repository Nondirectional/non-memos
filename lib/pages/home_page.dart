
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:non_memos/providers/logged_sate_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const SizedBox(
              height: 70,
              child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Row(children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: Icon(
                        Icons.person,
                        color: Colors.blue,
                        size: 30,
                      ),
                    ),
                    Text('Nondirectional',
                        style: TextStyle(color: Colors.white, fontSize: 24))
                  ])),
            ),
            ListTile(
              title: const Row(
                children: [
                  Icon(Icons.home),
                  SizedBox(width: 10),
                  Text('Home'),
                ],
              ),
              onTap: () {
                // Add your code here to handle the tap event
              },
            ),
            ListTile(
              title: const Row(
                children: [
                  Icon(Icons.timeline),
                  SizedBox(width: 10),
                  Text('Timeline'),
                ],
              ),
              onTap: () {
                // Add your code here to handle the tap event
              },
            ),
            ListTile(
              title: const Row(
                children: [
                  Icon(Icons.attachment),
                  SizedBox(width: 10),
                  Text('Resources'),
                ],
              ),
              onTap: () {
                // Add your code here to handle the tap event
              },
            ),
            ListTile(
              title: const Row(
                children: [
                  Icon(Icons.explore),
                  SizedBox(width: 10),
                  Text('Explore'),
                ],
              ),
              onTap: () {
                // Add your code here to handle the tap event
              },
            ),
            ListTile(
              title: const Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 10),
                  Text('Profile'),
                ],
              ),
              onTap: () {
                // Add your code here to handle the tap event
              },
            ),
            ListTile(
              title: const Row(
                children: [
                  Icon(Icons.inbox),
                  SizedBox(width: 10),
                  Text('InBox'),
                ],
              ),
              onTap: () {
                // Add your code here to handle the tap event
              },
            ),
            ListTile(
              title: const Row(
                children: [
                  Icon(Icons.archive),
                  SizedBox(width: 10),
                  Text('Archived'),
                ],
              ),
              onTap: () {
                // Add your code here to handle the tap event
              },
            ),
            ListTile(
              title: const Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(width: 10),
                  Text('Settings'),
                ],
              ),
              onTap: () {
                // Add your code here to handle the tap event
              },
            ),
            ListTile(
              title: const Row(
                children: [
                  Icon(Icons.logout),
                  SizedBox(width: 10),
                  Text('Logout'),
                ],
              ),
              onTap: () {
                LoggedSateProvider loggedState = Provider.of<LoggedSateProvider>(context, listen: false);
                loggedState.logout();
                GoRouter.of(context).go('/login');
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Home Page',
              style: TextStyle(fontSize: 36),
            )
          ],
        ),
      ),
    );
  }
}
