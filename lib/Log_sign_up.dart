

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Dark_ui/header_ui.dart';



class Log_sign_up extends StatefulWidget {
  const Log_sign_up({Key? key}) : super(key: key);

  @override
  State<Log_sign_up> createState() => _Log_sign_upState();
}

class _Log_sign_upState extends State<Log_sign_up> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _error = "";

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/fees.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Form(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: 'Enter email',
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (String value) {},
                            validator: (value) {
                              return value!.isEmpty ? 'Please enter email' : null;
                            },
                          ),
                        ),
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter Password',
                              prefixIcon: Icon(Icons.password),
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (String password) {},
                            validator: (password) {
                              return password!.isEmpty ? 'Please enter email' : null;
                            },
                          ),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80),
                          child: Row(
                            children: [
                              MaterialButton(
                                minWidth: 50,
                                child: Text('Login'),
                                color: Colors.teal,
                                textColor: Colors.white,
                                onPressed: () => signIn(context),
                              ),
                              SizedBox(width: 25),
                              MaterialButton(
                                minWidth: 50,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Header(),
                                    ),
                                  );
                                },
                                child: Text('Sign Up'),
                                color: Colors.blueGrey,
                                textColor: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        // Add the error handling code here
                        if (_error.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              _error,
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }


  // Function to sign in with email and password
  Future<void> signIn(BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (userCredential.user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Header()),
        );
      }
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    }
  }

  // Sign up with email and password
  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}
