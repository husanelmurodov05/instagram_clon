import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagram_clom/pages/SignIn.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isVisable = true;
  bool isVisable2 = true;
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
                Color(0xFFFCAF45),
                Color(0xFFF56040),
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
                        decoration: InputDecoration(
                            hintText: "Fullname",
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
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.3)),
                      child: TextField(
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
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.3)),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Confirm Password",
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.visibility,
                                color: Colors.grey.shade300,
                              ),
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
                            onPressed: () {},
                            style: ButtonStyle(
                                side: MaterialStatePropertyAll(BorderSide(
                                    color: Colors.grey.shade300
                                        .withOpacity(0.6)))),
                            child: Text(
                              "SignUp",
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
                    "Alreday have an account?",
                    style: TextStyle(color: Colors.white.withOpacity(0.9)),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => SignIn())));
                      },
                      child: Text(
                        "SignIn",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              )
            ],
          ),
        ));
  }
}
