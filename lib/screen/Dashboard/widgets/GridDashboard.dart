import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:websafe_svg/websafe_svg.dart';

class GridDashboard extends StatelessWidget {
  Item item1 = new Item(
      title: 'Calendar',
      subtitle: 'March, Wednesday',
      event: '3 Event',
      img: 'assets/images/dashboard/schedule.svg');

  Item item2 = new Item(
      title: 'Financial',
      subtitle: 'House, Macbook',
      event: '4 Gloals',
      img: 'assets/images/dashboard/salary.svg',
      routerName: 'financial2');

  Item item3 = new Item(
      title: 'List To Do',
      subtitle: 'English, Design',
      event: '4 Items',
      img: 'assets/images/dashboard/to-do-list.svg',
      routerName: 'todolist');

  Item item4 = new Item(
      title: 'Activity',
      subtitle: 'Rose favirited our Post',
      event: '',
      img: 'assets/images/dashboard/activism.svg');

  Item item5 = new Item(
    title: "Locations",
    subtitle: "Lucy Mao going to Office",
    event: "",
    img: "assets/images/dashboard/placeholder.svg",
  );

  Item item6 = new Item(
      title: 'Settings',
      subtitle: 'March, Wednesday',
      event: '4 Items',
      img: 'assets/images/dashboard/settings.svg');

  Item item7 = new Item(
      title: 'Report',
      subtitle: 'March, Wednesday',
      event: '4 Items',
      img: 'assets/images/dashboard/chart.svg');

  @override
  Widget build(BuildContext context) {
    List<Item> myList = [item1, item2, item3, item4, item5, item6, item7];
    var color = 0xff453658;

    return Flexible(
      child: GridView.count(
        childAspectRatio: 1.0,
        padding: EdgeInsets.only(left: 16, right: 16),
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        children: myList.map((data) {
          return Material(
            borderRadius: BorderRadius.circular(10),
            color: Color(color),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                if (data.routerName != null) {
                  Navigator.pushNamed(context, data.routerName);
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        data.img,
                        height: 42,
                      ),
                      // Image.asset(
                      //   data.img,
                      //   width: 42,
                      // ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        data.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        data.subtitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white38,
                            fontSize: 16,
                            height: 1.4,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        data.event,
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class Item {
  String title;
  String subtitle;
  String event;
  String img;
  String routerName;

  Item({this.title, this.subtitle, this.event, this.img, this.routerName});
}
