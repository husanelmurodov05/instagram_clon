import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clom/pages/model/postmodel.dart';
import 'package:shimmer/shimmer.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  List<Post> posts = [];

  final String _image_url1 =
      "https://images.unsplash.com/photo-1496523720220-b62e33cf3161?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1632&q=80";
  final String _image_url2 =
      "https://cdn.pixabay.com/photo/2017/10/25/16/54/african-lion-2888519__340.jpg";
  final String _image_url3 =
      "https://i.ytimg.com/vi/dip_8dmrcaU/maxresdefault.jpg";
  final String _image_url4 =
      "https://assets.architecturaldigest.in/photos/60083e76274aca243711c3a4/16:9/w_2560%2Cc_limit/ghaziabad-uttar-pradesh-homes-photos-1366x768.jpg";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    posts.add(
      Post(_image_url1, "Ajoyib bahor fasli daxshat"),
    );
    posts.add(
      Post(_image_url2, "Buncha chiroyli sher"),
    );
    posts.add(
      Post(_image_url3, " mashinalari"),
    );
    posts.add(
      Post(_image_url4, "Uyga gap yo'q"),
    );
  }

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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            toolbarHeight: 100,
            centerTitle: true,
            title: Text(
              "Profile",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontFamily: "Billabong",
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: Column(
            children: [
              Container(
                child: Center(
                  child: Stack(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: CircleAvatar(
                          radius: 44,
                          backgroundColor: Colors.purple,
                          child: CircleAvatar(
                              radius: 42,
                              backgroundColor: Colors.white,
                              child: image == null
                                  ? CircleAvatar(
                                      radius: 40,
                                      backgroundImage: AssetImage(
                                          "assets/images/profil.png"))
                                  : CircleAvatar(
                                      radius: 40,
                                      backgroundImage: FileImage(image!))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 85, top: 60),
                        child: Container(
                          width: 26,
                          height: 26,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                           onPressed: (){
                            showPic();
                           },
                           icon: Icon(Icons.add),
                          ),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 54, 244, 238),
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Center(
                child: Text(
                  "husan_elmurodov",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text("elmurodovhusan07@gmail.com"),
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "675",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 1,
                          height: 25,
                          color: Colors.grey,
                        ),
                        Text(
                          "4,562",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 1,
                          height: 25,
                          color: Colors.grey,
                        ),
                        Text(
                          "897",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "POSTS",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          "FOLLOWERS",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 30.0,
                        ),
                        Text(
                          "FOLLOWING",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.0,
              ),
              TabBar(
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 2.0),
                    insets: EdgeInsets.symmetric(horizontal: 30.0)),
                isScrollable: false,
                indicatorColor: Colors.black,
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.table_rows,
                      size: 25,
                      color: Colors.black,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.apps,
                      size: 25,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(children: [
                  Container(
                    child: ListView.builder(
                        itemCount: posts.length,
                        itemBuilder: ((context, index) => _itemOfPost(context,
                            posts[index].image_url!, posts[index].caption!))),
                  ),
                  Container(
                    child: GridView.builder(
                        itemCount: posts.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) => _itemOfPost2(context,
                            posts[index].image_url!, posts[index].caption!)),
                  )
                ]),
              ),
            ],
          )),
    );
  }
}

Widget _itemOfPost(BuildContext context, String imgUrl, String caption) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [
        Container(
          color: Colors.grey.withOpacity(0.3),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 2 / 3,
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: imgUrl,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.5),
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 2 / 3,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(caption),
      ],
    ),
  );
}

Widget _itemOfPost2(BuildContext context, String imgUrl, String caption) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Container(
          color: Colors.grey.withOpacity(0.3),
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.width * 0.38,
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: imgUrl,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.5),
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 2 / 3,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(caption),
      ],
    ),
  );
}
