import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      darkTheme: ThemeData(primarySwatch: Colors.blueGrey),
      color: Colors.blueAccent,
      home: const HomeActivity(),
    );
  }
}

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  MySnackBar(message, context) {
    return ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        title: const Text(
          'Inventory',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        titleSpacing: 20,
        // centerTitle: true,
        toolbarHeight: 60,
        toolbarOpacity: 1,
        actions: [
          IconButton(
            onPressed: () {
              MySnackBar('Comments', context);
            },
            icon: Icon(Icons.comment),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {
              MySnackBar('Person', context);
            },
            icon: Icon(Icons.person),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {
              MySnackBar('Settings', context);
            },
            icon: Icon(Icons.settings),
            color: Colors.white,
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        elevation: 4,
        onPressed: () {
          MySnackBar('Floating Action Button', context);
        },
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Icon(Icons.check, color: Colors.white, size: 30),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              currentAccountPictureSize: Size.zero,
              decoration: BoxDecoration(color: Colors.green),
              accountName: Text('Code Red'),
              accountEmail: Text('codered@gmail.com'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                MySnackBar('Home drawer menu', context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                MySnackBar('Settings drawer menu', context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Person'),
              onTap: () {
                MySnackBar('Person drawer menu', context);
              },
            ),
          ],
        ),
      ),

      body: const Center(child: Text('Home')),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Person'),
        ],
        onTap: (int index) {
          if (index == 0) {
            MySnackBar('Home bottom menu', context);
          }
          if (index == 1) {
            MySnackBar('Settings bottom menu', context);
          }
          if (index == 2) {
            MySnackBar('Person bottom menu', context);
          }
        },
      ),
    );
  }
}
