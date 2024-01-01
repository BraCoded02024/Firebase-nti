// import 'dart:js';

import 'package:flutter/material.dart';




class Grid extends StatelessWidget {
  Items item1 = Items(
    title: "General",
    subtitle: "Academics, Overview",
    event: "3 Events",
    img: "assets/general.png",
    onTap: () {
      // Add specific behavior for item1 onTap
      print("Item 1 tapped!");
    },
  );

  Items item2 = Items(
    title: "Library",
    subtitle: "Degree, Diploma, Weekend Courses",
    event: "4 Items",
    img: "assets/subjects.png", onTap: () {  },
    // onTap: () {
    //   // Add specific behavior for item2 onTap
    //   Navigator.push(
    //     context as BuildContext,
    //     MaterialPageRoute(builder: (context) => AdminScreen()),
    //   );
    // },
  );

  Items item3 = Items(
    title: "Transport Status",
    subtitle: "Bus Services",
    event: "",
    img: "assets/3d.png",
    onTap: () {
      // Add specific behavior for item3 onTap
      print("Item 3 tapped!");
    },
  );

  Items item4 = Items(
    title: "Creativity",
    subtitle: "Project's, Extra curricular",
    event: "",
    img: "assets/idea.png",
    onTap: () {
      // Add specific behavior for item4 onTap
      print("Item 4 tapped!");
    },
  );

  Items item5 = Items(
    title: "Dues status",
    subtitle: "Paid, Due",
    event: "4 Items",
    img: "assets/fees.png",
    onTap: () {
      // Add specific behavior for item5 onTap
      print("Item 5 tapped!");
    },
  );

  Items item6 = Items(
    title: "Settings",
    subtitle: "User profile info",
    event: "2 Items",
    img: "assets/settings.png",
    onTap: () {
      // Add specific behavior for item6 onTap
      print("Item 6 tapped!");
    },
  );

  Grid({super.key});

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    var color = 0xff453658;
    return Flexible(
      child: GridView.count(
        childAspectRatio: 1.0,
        padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 20),
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        children: myList.map((data) {
          return GestureDetector(
            onTap: () {
              // // Use the context from the GestureDetector to access the Navigator
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const AdminScreen()),
              // );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color(color).withOpacity(1),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white24,
                    blurRadius: 3.0,
                    offset: Offset(
                      5.0,
                      3.0,
                    ),
                  )
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
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    data.subtitle,
                    style: const TextStyle(
                        color: Colors.white38,
                        fontSize: 10,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                ],
              ),
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
  VoidCallback onTap;

  Items({
    required this.title,
    required this.subtitle,
    required this.event,
    required this.img,
    required this.onTap,
  });
}
