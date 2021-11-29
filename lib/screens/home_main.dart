import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_binary/items/home_detail_screen.dart';
import 'package:test_binary/providers/home_provider.dart';
import 'package:test_binary/widgets/app_bar.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    Provider.of<HomeProvider>(context, listen: false).home().then((value) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final provider = Provider.of<HomeProvider>(context, listen: false);
    List<HomeListClass> listItem =
        Provider.of<HomeProvider>(context, listen: true).homeList;
    return Scaffold(
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomAppBar(),
                    SizedBox(height: height * 0.07),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              index = 0;
                            });
                            setState(() {
                              isLoading = true;
                            });
                            provider.home().then((value) {
                              setState(() {
                                isLoading = false;
                              });
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade800),
                                color: index == 0
                                    ? Colors.pink.shade700
                                    : Colors.grey.shade800,
                                boxShadow: index == 0
                                    ? [
                                        BoxShadow(
                                          color: Colors.pink.shade700,
                                          offset: Offset(0.0, 2.0), //(x,y)
                                          blurRadius: 16.0,
                                        ),
                                      ]
                                    : [],
                                borderRadius: BorderRadius.circular(6)),
                            height: height * 0.05,
                            width: width * 0.26,
                            child: Center(
                              child: Text(
                                "Movies",
                                style: TextStyle(
                                    color: index == 0
                                        ? Colors.white
                                        : Colors.white54,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              index = 1;
                            });
                            setState(() {
                              isLoading = true;
                            });
                            provider.home().then((value) {
                              setState(() {
                                isLoading = false;
                              });
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade800),
                                color: index == 1
                                    ? Colors.pink.shade700
                                    : Colors.grey.shade800,
                                boxShadow: index == 1
                                    ? [
                                        BoxShadow(
                                          color: Colors.pink.shade700,
                                          offset: Offset(0.0, 2.0), //(x,y)
                                          blurRadius: 16.0,
                                        ),
                                      ]
                                    : [],
                                borderRadius: BorderRadius.circular(6)),
                            height: height * 0.05,
                            width: width * 0.26,
                            child: Center(
                              child: Text(
                                "Shows",
                                style: TextStyle(
                                    color: index == 1
                                        ? Colors.white
                                        : Colors.white54,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              index = 2;
                            });
                            setState(() {
                              isLoading = true;
                            });
                            provider.home().then((value) {
                              setState(() {
                                isLoading = false;
                              });
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade800),
                                boxShadow: index == 2
                                    ? [
                                        BoxShadow(
                                          color: Colors.pink.shade700,
                                          offset: Offset(0.0, 2.0), //(x,y)
                                          blurRadius: 16.0,
                                        ),
                                      ]
                                    : [],
                                color: index == 2
                                    ? Colors.pink.shade700
                                    : Colors.grey.shade800,
                                borderRadius: BorderRadius.circular(6)),
                            height: height * 0.05,
                            width: width * 0.26,
                            child: Center(
                              child: Text(
                                "Music",
                                style: TextStyle(
                                    color: index == 2
                                        ? Colors.white
                                        : Colors.white54,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.05),
                    Text(
                      "NEW",
                      style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w700,
                          fontSize: 23),
                    ),
                    SizedBox(height: height * 0.02),
                    Container(
                      height: height * 0.3,
                      width: width,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: listItem.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return HomeDetailScreen(
                                      title: listItem[index].title);
                                },
                              ));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 14.0),
                              child: Image.network(
                                listItem[index].poster!,
                                fit: BoxFit.cover,
                                height: double.infinity,
                                width: width * 0.34,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      "POPULAR",
                      style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w700,
                          fontSize: 23),
                    ),
                    SizedBox(height: height * 0.02),
                    Container(
                      height: height * 0.3,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: listItem.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return HomeDetailScreen(
                                      title: listItem[index].title);
                                },
                              ));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 14.0),
                              child: Image.network(
                                listItem[index].poster!,
                                fit: BoxFit.cover,
                                height: double.infinity,
                                width: width * 0.34,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      "Trending Lists",
                      style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w700,
                          fontSize: 23),
                    ),
                    SizedBox(height: height * 0.02),
                    Container(
                      height: height * 0.3,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: listItem.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return HomeDetailScreen(
                                      title: listItem[index].title);
                                },
                              ));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 14.0),
                              child: Image.network(
                                listItem[index].poster!,
                                fit: BoxFit.cover,
                                height: double.infinity,
                                width: width * 0.34,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
      backgroundColor: Colors.black,
    );
  }
}
