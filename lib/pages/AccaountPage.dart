import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 100,
          backgroundColor: Colors.white,
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Done",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  )),
            )
          ],
//         leading: (
// ),
          title: Text(
            "Edit Profile",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        body: Column(
          //  mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage("assets/images/profil.png"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "husa_elmurodov Photo",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "Name",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w300),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Husan",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                 Divider(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              "Username",
                              style: TextStyle(
                                  color: Colors.black, fontWeight: FontWeight.w300),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Husan",
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                    )
              ],
            ),
          ],
        ));
  }
}
