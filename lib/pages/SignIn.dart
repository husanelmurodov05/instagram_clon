import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagram_clom/pages/HomePage.dart';
import 'package:instagram_clom/pages/SignUp.dart';
import 'package:instagram_clom/services/util.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isVisable = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController pasController = TextEditingController();
  _signIn() {
    String email = emailController.text.trim();
    String parol = pasController.text.trim();
    if (email.isEmpty || parol.isEmpty) {
      Util.ToastMS(
        "Enter completely!");
      return;
    }
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
               Color.fromARGB(255, 27, 143, 186),
              Color.fromARGB(255, 198, 9, 135),
              ])),
          child: Column(
            children: [
              Expanded(
                  child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Instgram",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 46,
                          fontFamily: "Billabong"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.3)),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: "Email",
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.grey.shade300)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        controller: pasController,
                        obscureText: isVisable,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            suffixIcon: IconButton(
                              color: Colors.grey.shade300,
                              onPressed: () {
                                setState(() {
                                  isVisable = !isVisable;
                                });
                              },
                              icon: Icon(isVisable
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                            hintStyle: TextStyle(color: Colors.grey.shade300)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 45,
                        child: OutlinedButton(
                            onPressed: () {
                              _signIn();
                            },
                            style: ButtonStyle(
                                side: MaterialStatePropertyAll(BorderSide(
                                    color: Colors.grey.shade300
                                        .withOpacity(0.6)))),
                            child: Text(
                              "SignIn",
                              style: TextStyle(color: Colors.white),
                            )))
                  ],
                ),
              )),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don`t have an account?",
                    style: TextStyle(color: Colors.white.withOpacity(0.9)),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => SignUp())));
                      },
                      child: Text(
                        "SignUp",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              )
            ],
          ),
        ));
  }
}
