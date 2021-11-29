import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class HomeListClass {
  String? title;
  String? year;
  String? type;
  String? poster;
  HomeListClass({this.poster, this.title, this.type, this.year});
}

class HomeProvider with ChangeNotifier {
  List<HomeListClass> homeList = [];

  Future home() async {
    final url = Uri.parse(
        "http://www.omdbapi.com/?i=tt3896198&apikey=c4033450&s=Movies");

    List<HomeListClass> demoHomeList = [];

    try {
      final response = await get(url);
      List getResponse = json.decode(response.body)["Search"];
      getResponse.forEach((element) {
        return demoHomeList.add(HomeListClass(
          title: element["Title"],
          poster: element["Poster"],
          type: element["Type"],
          year: element["Year"],
        ));
      });
      homeList = demoHomeList;
      notifyListeners();
      print(homeList.length);

      print(json.decode(response.body)["Search"]);
    } catch (e) {
      throw e;
    }
  }
}
