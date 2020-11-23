import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:financial_app/screen/Dashboard/widgets/GridDashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  PageController _pageController;
  int _naviIndex = 0;

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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    ));

    return Scaffold(
        backgroundColor: Color(0xff392850),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _naviIndex = index;
            });
          },

          // pageSnapping: true,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 110,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Vuong Dang',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Dashboard',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffa29aac),
                            ),
                          )
                        ],
                      ),
                      IconButton(
                        alignment: Alignment.topCenter,
                        icon: Image.asset(
                          'assets/images/dashboard/notification.png',
                          width: 24,
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                GridDashboard()
              ],
            ),
            Container(
              decoration: BoxDecoration(color: Colors.orangeAccent),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.blueAccent),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          child: CurvedNavigationBar(
              animationDuration: Duration(milliseconds: 400),
              backgroundColor: Colors.black.withOpacity(0),
              index: _naviIndex,
              items: [
                Icon(Icons.dashboard, size: 30, color: Colors.black),
                Icon(Icons.person, size: 30, color: Colors.black),
                Icon(Icons.settings, size: 30, color: Colors.black),
              ],
              onTap: (index) {
                // debugPrint('Current Index is $index');
                _pageController.jumpToPage(
                  index,
                );
              }),
        ));
  }
}
