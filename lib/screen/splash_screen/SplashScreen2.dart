import 'package:financial_app/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen2 extends StatefulWidget {
  @override
  _SplashScreen2State createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  int _pageIndex = 0;
  PageController _pageController;

  List<dynamic> _pageList = [
    {
      'title': '1. Financial App',
      'image': 'assets/images/splash/wallet.svg',
      'description':
          'A financial application is a software program that facilitates the management of business processes that deal with money. '
    },
    {
      'title': '2. To-Do-List App',
      'image': 'assets/images/splash/to-do-list.svg',
      'description':
          'a list of the tasks that you have to do, or things that you want to do'
    },
    {
      'title': '3. English App',
      'image': 'assets/images/splash/english.svg',
      'description':
          'Improve your English with our fun and exciting learning apps! Designed for all the family, our games, podcasts, videos and quizzes will help you learn English at ...'
    },
    {
      'title': '4. Report Everything',
      'image': 'assets/images/splash/report.svg',
      'description': 'Report everthing you want, chose what you want to report!'
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(
      initialPage: 0,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: _pageIndex == _pageList.length - 1
          ? InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'dashboard');
              },
              child: Ink(
                color: Colors.blueAccent,
                height: 80,
                child: Center(
                  child: Text(
                    'Get Start'.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          : null,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 600,
              child: PageView.builder(
                itemCount: _pageList.length,
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Container(
                    // color: Colors.orangeAccent,
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          _pageList[index]['image'],
                          height: 300,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 30, top: 30),
                          child: Text(
                            _pageList[index]['title'],
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 30),
                          child: Text(
                            _pageList[index]['description'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.5,
                              color: Colors.black87,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pageList.length,
                (index) => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.only(right: 5),
                  height: 10,
                  width: _pageIndex == index ? 30 : 10,
                  decoration: BoxDecoration(
                    color:
                        _pageIndex == index ? primaryColor : Color(0xFFD8D8D8),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            // Container(
            //   // color: Colors.white,
            //   width: MediaQuery.of(context).size.width,
            //   padding: EdgeInsets.symmetric(
            //     horizontal: defaultPadding,
            //     vertical: defaultPadding,
            //   ),
            //   child: Container(
            //     height: 50,
            //     decoration: BoxDecoration(
            //       color: Colors.blueGrey,
            //       borderRadius: BorderRadius.circular(5),
            //     ),
            //     child: InkWell(
            //       onTap: () {},
            //       child: Center(
            //         child: Text(
            //           'Get Start',
            //           style: TextStyle(
            //             fontWeight: FontWeight.w500,
            //             fontSize: 16,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
