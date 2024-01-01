import 'package:flutter/material.dart';
class Lgrid extends StatefulWidget {
  const Lgrid({super.key});

  @override
  _LgridState createState() => _LgridState();
}

class _LgridState extends State<Lgrid> {
  Items item1 = Items(
      title: "General",
      subtitle: "Acadamics, Overview",
      event: "3 Events",
      img: "assets/general.png");

  Items item2 = Items(
    title: "Subjects",
    subtitle: "Maths,Computer,Science",
    event: "4 Items",
    img: "assets/subjects.png",
  );
  Items item3 = Items(
    title: "Transport Status",
    subtitle: "Bus Services",
    event: "",
    img: "assets/3d.png",
  );
  Items item4 = Items(
    title: "Creativity",
    subtitle: "Project's ,Extra cricular",
    event: "",
    img: "assets/idea.png",
  );
  Items item5 = Items(
    title: "Fees status",
    subtitle: "Paid, Due",
    event: "4 Items",
    img: "assets/fees.png",
  );
  Items item6 = Items(
    title: "Settings",
    subtitle: "User profile info",
    event: "2 Items",
    img: "assets/settings.png",
  );
  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    //var color = 0xff453658;
    return Flexible(
      child: GridView.count(
        childAspectRatio: 1.0,
        padding: const EdgeInsets.only(left: 16, right: 16,top: 10, bottom: 20),
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        children: myList.map((data) {
          return Container(
            decoration: BoxDecoration(

              color: Colors.white.withOpacity(1),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                //background color of box
                // BoxShadow(
                //   color: Colors.white24,
                //   blurRadius: 3.0, // soften the shadow
                //   //spreadRadius: .5, //extend the shadow
                //   offset: Offset(
                //     5.0, // Move to right 10  horizontally
                //     3.0, // Move to bottom 10 Vertically
                //
                //   ),
                // )
                const BoxShadow(
                    offset: Offset(-2, 1),
                    color: Colors.black38,
                    blurRadius: 10),
                BoxShadow(
                    offset: const Offset(-10, -10),
                    color: Colors.white.withOpacity(0.85),
                    blurRadius: 10)
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Image.asset(
                  data.img,
                  width: 42,
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  data.title,
                  style:  const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  data.subtitle,
                  style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 10,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 14,
                ),

              ],

            ),

          );
        }).toList(),

      ),

    );

  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Items({required this.title, required this.subtitle, required this.event, required this.img});
}
