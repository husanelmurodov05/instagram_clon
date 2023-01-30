import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();
  List items = ["", "", "", "", "", "", "", "", ""];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
        backgroundColor: Colors.black,
        appBar: AppBar(
          
          backgroundColor: Colors.black,
          toolbarHeight: 100,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Search",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Billabong",
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: TextField(
                  style: TextStyle(color: Colors.black87),
                  controller: searchController,
                  onChanged: (input) {
                    print(input);
                  },
                  decoration: InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey)),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: ((context, index) {
                      return _itemOfUser(items[index]);
                    })),
              )
            ],
          ),
        ));
  }
}

Widget _itemOfUser(String name) {
  return Padding(
    padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
    child: Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 33,
              backgroundColor: Colors.purple,
              child: CircleAvatar(
                radius: 31,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/profil.png"),
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "husan_elmurodov",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "husan07@gmail.com",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 48,
            ),
            OutlinedButton(
                onPressed: () {},
                style: ButtonStyle(
                    side: MaterialStatePropertyAll(
                        BorderSide(color: Colors.white))),
                child: Text(
                  "Follow",
                  style: TextStyle(color: Colors.blue),
                )),
          ],
        ),
      ],
    ),
  );
}
