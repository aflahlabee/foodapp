import 'package:flutter/material.dart';
import 'package:food_delivery/screens/home_screen.dart';
import 'package:food_delivery/model/api_funtion.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late String _username;
  late String _password;
  TextEditingController namecontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 249, 78, 66),

      body: Stack(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'asset/image/istockphoto-614844110-612x612.jpg',
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: namecontroller,
              decoration: InputDecoration(hintStyle: TextStyle(color: Colors.black,),hintText: 'Username'),
              ), TextField(
                controller: passwordcontroller,
              decoration: InputDecoration(hintStyle: TextStyle(color: Colors.black,),hintText: 'Password'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (namecontroller.text.isNotEmpty&&passwordcontroller.text.isNotEmpty) {

                  
                    // Navigate to the next page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => home_screen()),
                    );
                  }
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ]),
      //  Form(
    );
  }

  // RaisedButton({required void Function() onPressed, required Text child}) {}
}
