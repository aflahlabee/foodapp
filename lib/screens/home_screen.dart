import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:food_delivery/screens/Login_page.dart';
import 'package:food_delivery/screens/cart_page.dart';
import 'package:food_delivery/screens/items.dart';
import 'package:food_delivery/model/api_funtion.dart';
import 'package:food_delivery/model/modelClass.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

// ignore: camel_case_types
class _home_screenState extends State<home_screen> {
  late Future<List<Model>> Fetchdata;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      Fetchdata = fetchdata();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green.shade900,
          title: Text('Restaurants'),
        ),
        body: FutureBuilder<List<Model>>(
          future: Fetchdata,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: 320,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 0, top: 10),
                              child: SizedBox(
                                  width: 350,
                                  height: 250,
                                  child: Image(
                                    image: NetworkImage(
                                      'https://i.pinimg.com/originals/7e/d7/fe/7ed7fe72000e55c1650c440c1ccaf704.jpg',
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 8),
                              child: Text('${snapshot.data![0].restaurantName}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade900),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Itmes()),
                        );
                      },
                      child: Text(
                        'Selected your food',
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ))
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

class $ {}
