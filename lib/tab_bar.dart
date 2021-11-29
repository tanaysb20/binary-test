import 'package:flutter/material.dart';
import 'package:test_binary/screens/drawer/custom_drawer.dart';
import 'package:test_binary/screens/favorite_screen.dart';
import 'package:test_binary/screens/home_main.dart';
import 'package:test_binary/screens/star.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  int pageIndex = 0;

  PageController? _pageController;
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldkey,
        endDrawer: Drawer(
          child: Center(
            child: Text("Custom Drawer"),
          ),
        ),
        body: PageView(
          children: [
            HomeScreen(),
            StarScreen(),
            FavoriteScreen(),
            CustomDrawer(),
          ],
          controller: _pageController,
          onPageChanged: (int pageIndex) {
            // if (pageIndex == 3) {
            //   _scaffoldkey.currentState!.openEndDrawer();
            //   _pageController!.jumpToPage(this.pageIndex);
            //   setState(() {});
            // } else {
            setState(() {
              this.pageIndex = pageIndex;
            });
            // }
          },
          physics: NeverScrollableScrollPhysics(),
        ),
        // backgroundColor: Colors.grey[900],
        bottomNavigationBar: Theme(
          data: ThemeData(
            canvasColor: Colors.grey[900],
            primaryColor: Colors.grey[900],
          ),
          child: Container(
            height: height * 0.1,
            child: BottomNavigationBar(
              selectedItemColor: Colors.pink[500],
              showUnselectedLabels: true,
              unselectedItemColor: Colors.grey[700],
              backgroundColor: Colors.grey[900],
              currentIndex: pageIndex,
              onTap: (int pageIndex) {
                if (pageIndex == 3) {
                  _scaffoldkey.currentState!.openEndDrawer();
                  _pageController!.jumpToPage(this.pageIndex);
                  setState(() {});
                } else {
                  _pageController!.animateToPage(
                    pageIndex,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.bounceInOut,
                  );
                }
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home, size: 28), label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Icons.star, size: 28), label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Icons.save, size: 28), label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Icons.menu, size: 28), label: ""),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
