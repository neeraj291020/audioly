import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'main.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final _auth = FirebaseAuth.instance;
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://cdn.britannica.com/03/151903-131-E310E9EC/Microphone-background-sound-waves-energy-Music.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 49,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(60.0, 0, 0, 0),
                  child: TypewriterAnimatedTextKit(
                    text: ['Audioly'],
                    textStyle: TextStyle(
                      color: Colors.yellow,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
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
                        borderSide:
                            BorderSide(color: Colors.purple, width: 5.0),
                      ),
                      hintText: 'Enter Your Email Id',
                      hintStyle:
                          TextStyle(fontSize: 20.0, color: Colors.tealAccent),
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
                        borderSide:
                            BorderSide(color: Colors.purple, width: 5.0),
                      ),
                      hintText: 'Enter Your Password',
                      hintStyle:
                          TextStyle(fontSize: 20.0, color: Colors.tealAccent),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(140, 20, 0, 0),
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
                          Navigator.pushNamed(context, '/songs');
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text(
                      'Log In ',
                      style: TextStyle(
                        color: Colors.pink,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(140, 20, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text(
                      'Sign Up ',
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
      ),
    );
  }
}
