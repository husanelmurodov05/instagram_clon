import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

class UpploadPage extends StatefulWidget {
  const UpploadPage({super.key});

  @override
  State<UpploadPage> createState() => _UpploadPageState();
}

class _UpploadPageState extends State<UpploadPage> {
  final ImagePicker _picker = ImagePicker();
  File? image;
  _showGallery() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    if (file == null) return;
    setState(() {
      image = File(file.path);
    });
    Navigator.of(context).pop();
  }

  _showCamera() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.camera);
    if (file == null) return;
    setState(() {
      image = File(file.path);
    });
    Navigator.of(context).pop();
  }

  showPic() {
    showModalBottomSheet(
        context: context,
        builder: ((context) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text("Pick photo"),
                  onTap: (() {
                    _showGallery();
                  }),
                ),
                ListTile(
                  onTap: (() {
                    _showCamera();
                  }),
                  leading: Icon(Icons.camera_alt),
                  title: Text("Take photo"),
                )
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add_photo_alternate_outlined,
                  color: Colors.black,
                  size: 27,
                ))
          ],
          centerTitle: true,
          title: Text(
            "Upload",
            style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontFamily: "Billabong",
                fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  showPic();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  color: Colors.grey,
                  child: Center(
                      child: Icon(
                    Icons.add_a_photo,
                    size: 50,
                    color: Colors.black,
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(hintText: "Caption"),
                ),
              )
            ],
          ),
        ));
  }
}
