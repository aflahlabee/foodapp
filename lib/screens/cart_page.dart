import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class cart_page extends StatefulWidget {
  cart_page({super.key, required this.fooditems});

  @override
  State<cart_page> createState() => _cart_pageState();

  List<String> fooditems = [];
}

class _cart_pageState extends State<cart_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.3,
              child: ListView.builder(
                  itemCount: widget.fooditems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue,
                        ),
                        child: ListTile(
                          title: Text(
                            widget.fooditems[index],
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          trailing: IconButton(
                              onPressed: (() {
                                setState(() {
                                  widget.fooditems.removeAt(index);
                                });
                              }),
                              icon: Icon(Icons.delete)),
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: (() {}), child: Text('Proceed To Buy')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
