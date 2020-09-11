import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ful2fun/MusicSearch/music_search_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  PageController _pageController = PageController(initialPage: 1);
  int _currentIndex;
  @override
  void initState() {
    super.initState();
    _currentIndex = 1;
  }

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          Scaffold(backgroundColor: Colors.yellow),
          MusicSearchPage(),
          Scaffold(backgroundColor: Colors.orange),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Color(0xff1B2139),
        buttonBackgroundColor: Color(0xff1B2139),
        backgroundColor: Colors.black,
        height: 60,
        index: _currentIndex,
        animationDuration: Duration(milliseconds: 250),
        animationCurve: Curves.easeOut,
        items: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            height: 45,
            width: 45,
            child: SvgPicture.asset('images/music.svg'),
          ),
          Container(
            padding: EdgeInsets.all(5),
            height: 45,
            width: 45,
            child: SvgPicture.asset('images/video.svg'),
          ),
          Container(
            padding: EdgeInsets.all(5),
            height: 45,
            width: 45,
            child: SvgPicture.asset('images/images.svg'),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}
