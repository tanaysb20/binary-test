import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.060,
      decoration: BoxDecoration(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              child: Image.asset(
            "assets/profile.png",
          )),
          SizedBox(width: 14),
          Text(
            "Chelsie Brett",
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          SizedBox(width: 60),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                      borderSide: BorderSide.none),
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.grey[700], fontSize: 14),
                  fillColor: Colors.grey[900],
                  filled: true,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey[700],
                    size: 22,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
