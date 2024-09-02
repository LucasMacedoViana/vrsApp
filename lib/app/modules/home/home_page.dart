import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  _onChangeTab(int index) {
    setState(() {
      currentIndex = index;
    });

    switch(index) {
      case 0:
        Modular.to.navigate('/home/courses/');
        break;
      case 1:
        Modular.to.navigate('/home/students/');
        break;
      default:
        break;
    }
  }
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: _onChangeTab,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Courses'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Students'),
        ],
      ),
      backgroundColor: Colors.orange,
      body: const RouterOutlet()
    );
  }
}
