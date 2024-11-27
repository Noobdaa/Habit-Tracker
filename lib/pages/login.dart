import 'package:flutter/material.dart';
import 'package:i_am_cooked/components/Buttons.dart';
// import 'package:i_am_cooked/pages/home_page.dart';
import 'package:i_am_cooked/pages/main_page.dart';
// import 'package:i_am_cooked/components/squaretitle.dart';
import 'SignUp.dart';
import 'package:i_am_cooked/components/textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  //Sign user in
  void signUserIn() {}

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
                  "Welcome back,",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Text(
                  "you've been missed!",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
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

                //password
                Mytextfield(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(
                  height: 10,
                ),

                //forgot password
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),

                //signin
                Mybutton(
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => MainPage()));
                  },
                ),

                const SizedBox(
                  height: 20,
                ),

                //or continue with google
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
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
                        )
                    ),
                  ],
                ),
                const SizedBox(height:20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?,",
                      style: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                     // SizedBox(width: 5),
                    GestureDetector(
                      child: Text(" Sign Up",
                        style: TextStyle(
                          color: Colors.red[400],
                        ),
                      ),
                      onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => Signup()));
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
