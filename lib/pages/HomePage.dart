import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagram_clom/pages/PostPage.dart';
import 'package:instagram_clom/pages/Profilpage.dart';
import 'package:instagram_clom/pages/likepage.dart';
import 'package:instagram_clom/pages/searchpage.dart';
import 'package:instagram_clom/pages/uploadpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _hozitgiIndex = 0;
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CupertinoTabBar(
            onTap: ((index) {
              setState(() {
                _hozitgiIndex = index;
              });
              _pageController.animateToPage(index,
                  duration: Duration(microseconds: 200), curve: Curves.easeInCirc);
            }),
            currentIndex: _hozitgiIndex,
            activeColor: Color(0xFFFF56040),
            backgroundColor: Colors.black,
            inactiveColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "",
              ),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.add_box), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), label: "")
            ]),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _hozitgiIndex = index;
            });
          },
          children: [
            PostPage(),
            Search(),
            UpploadPage(),
            LikePage(),
            ProfilPage(),
          ],
        ));
  }
}
