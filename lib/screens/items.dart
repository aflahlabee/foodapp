import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery/screens/cart_page.dart';
import 'package:food_delivery/screens/home_screen.dart';
import 'package:food_delivery/model/api_funtion.dart';
import 'package:food_delivery/model/modelClass.dart';

class Itmes extends StatefulWidget {
  const Itmes({super.key});

  @override
  State<Itmes> createState() => _ItmesState();
}

class _ItmesState extends State<Itmes> {
  late Future<List<Model>> Fetchdata;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      Fetchdata = fetchdata();
    });
  }

  List<String> fooditems = [];
  List<String> foodimages = [
    "https://life-in-the-lofthouse.com/wp-content/uploads/2014/12/Spinach_Salad1.jpg",
    "https://2.bp.blogspot.com/-Y4iFIOgFdG8/U85UaYn6uPI/AAAAAAAABHE/bbCrmXM727c/s1600/IMG_3726.JPG",
    "https://i.pinimg.com/originals/f4/59/17/f45917ba638c8e8914b0faa147f8500b.jpg",
    "https://markmacdonald.tv/wp-content/uploads/2015/06/iStock_000003413259Medium.jpg",
    "http://www.makingthymeforhealth.com/wp-content/uploads/2016/01/One-Pot-Stove-Top-Enchiladas-Summer-Style-3389-683x1024_thumb.jpg",
  ];

  @override
  Widget build(BuildContext context) => FutureBuilder<List<Model>>(
      future: Fetchdata,
      builder: (context, snapshot) {
        return Scaffold(
          backgroundColor: Colors.green.shade800,
          appBar: AppBar(
            backgroundColor: Colors.blue,
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => cart_page(
                                fooditems: fooditems,
                              )),
                    );
                  },
                  icon: Icon(Icons.shopping_cart_outlined))
            ],
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: (() {
                Navigator.pop(context);
              }),
            ),
            title: Text(
              "items",
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900),
            ),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Image(
                              image: NetworkImage(foodimages[index]),
                              width: 100,
                              height: 100,
                            ),
                            Text(
                                '${snapshot.data![0].tableMenuList![0].categoryDishes![index].dishName}'),
                            // Text(' Prices ${snapshot.data![0].tableMenuList![0].categoryDishes![index].dishCurrency}'),
                            Text(
                                ' ${snapshot.data![0].tableMenuList![0].categoryDishes![index].dishDescription}'),

                            ElevatedButton(
                              onPressed: () {
                                fooditems.add(
                                    '${snapshot.data![0].tableMenuList![0].categoryDishes![index].dishName}');
                                print(fooditems);
                              },
                              // ignore: prefer_const_constructors
                              child: Text(
                                'Add',
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        );
      });
}
