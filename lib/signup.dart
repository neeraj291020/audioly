import 'package:flutter/material.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _auth = FirebaseAuth.instance;
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Register Yourself 🔖',
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://png.pngtree.com/thumb_back/fh260/background/20210916/pngtree-musical-note-staff-abstract-purple-light-effect-background-image_901117.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 189,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 90, 0),
                child: TextField(
                  onChanged: (event) {
                    email = event;
                  },
                  style: TextStyle(color: Colors.pinkAccent), //<-- SEE HERE

                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple, width: 5.0),
                    ),
                    hintText: 'Enter Your Email Id',
                    hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 90, 0),
                child: TextField(
                  onChanged: (event) {
                    password = event;
                  },
                  obscureText: true,
                  style: TextStyle(color: Colors.pinkAccent), //<-- SEE HERE

                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple, width: 5.0),
                    ),
                    hintText: 'Enter Your Password',
                    hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 60, 0),
                child: ElevatedButton(
                  onPressed: () async {
                    // print(email);
                    // print(password);
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (newUser != null) {
                        Navigator.pushNamed(context, '/');
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.pink,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
