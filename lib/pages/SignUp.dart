import 'package:flutter/material.dart';
import 'package:i_am_cooked/components/ButSinUp.dart';
import 'package:i_am_cooked/pages/login.dart';

import '../components/textfield.dart';
import 'main_page.dart';

class Signup extends StatelessWidget {
  Signup({super.key,});

  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserUp() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 90,
                    ),

                    //wellcome back text
                    const Text(
                      "Welcome,",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Text(
                      "Way to healty life!",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(
                      height: 70,
                    ),

                    //user name
                    Mytextfield(
                      controller: usernameController,
                      hintText: 'Username',
                      obscureText: false,
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    //user name
                    Mytextfield(
                      controller: emailController,
                      hintText: 'Email',
                      obscureText: false,
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    //password
                    Mytextfield(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                    ),


                    const SizedBox(
                      height: 35,
                    ),

                    SignUp(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => MainPage())); // Call the sign-up function
                      },
                    ),



                    const SizedBox(
                      height: 20,
                    ),

                    //or continue with google
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 1.0,
                              color: Colors.grey[600],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              "Or continue with",
                              style: TextStyle(
                                color: Colors.grey[400],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 1.0,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    //Google apple icons

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              border: Border.all(color: Colors.white10, width: 0.9),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'lib/Icons/google-color-svgrepo-com.png',
                                height: 35,
                              ),
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.white24, // Set the background color to light grey
                              border: Border.all(color: Colors.white10, width: 1.0),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 6.0, bottom: 8.0),
                              child: Image.asset(
                                'lib/Icons/apple-svgrepo-com.png',
                                height: 35,
                              ),
                            )),
                      ],
                    ),

                    SizedBox(height: 20,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?,",
                          style: TextStyle(
                            color: Colors.grey[400],
                          ),
                        ),
                        // SizedBox(width: 5),
                        GestureDetector(
                          child: Text(" Sign In",
                            style: TextStyle(
                              color: Colors.red[400],
                            ),
                          ),
                          onTap: (){
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
                          },
                        ),
                      ],
                    ),


                  ],
                ),
              )),
        ),
      ),
    );
  }


}

