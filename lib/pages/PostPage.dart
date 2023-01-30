import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clom/pages/uploadpage.dart';
import 'package:like_button/like_button.dart';
import 'package:shimmer/shimmer.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'model/postmodel.dart';

class PostPage extends StatefulWidget {
  PageController? pageController;
  PostPage({this.pageController, super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
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
      Post(
        _image_url2,
        "Buncha chiroyli sher",
      ),
    );
    posts.add(
      Post(_image_url3, "Dunyoning qimmat mashinalari"),
    );
    posts.add(
      Post(_image_url4, "Uyga gap yo'q"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
        toolbarHeight: 80,
        actions: [
          IconButton(
              onPressed: () {
                
                widget.pageController!.animateToPage(
                  2,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.linear,
                );
              },
              icon: const Icon(
                Icons.camera_alt_outlined,
                color: Color.fromARGB(255, 0, 0, 0),
                size: 30,
              ))
        ],
        elevation: 0.1,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Instagram",
          style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              fontFamily: "Billabong",
              color: Color.fromARGB(255, 5, 0, 0)),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white,
          // gradient: LinearGradient(
          //     begin: Alignment.topRight,
          //     end: Alignment.bottomLeft,
          //     colors: [
          // Colors.white
          //     ]),
        ),
        child: ListView.separated(
          itemBuilder: (context, index) => _itemPost(
              context, posts[index].image_url!, posts[index].caption!),
          separatorBuilder: (context, index) => const Divider(
            thickness: 0.8,
          ),
          itemCount: posts.length,
        ),
      ),
    );
  }
}

void saveimage(String image_url) async {
  print(image_url);
  await GallerySaver.saveImage(
      "https://image.shutterstock.com/image-photo/montreal-canada-july-11-2019-600w-1450023539.jpg");
}

imageMenu(BuildContext context, String image_url) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
    context: context,
    builder: ((context) => Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 5,
              ),
              Container(
                width: 130,
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          saveimage(image_url);
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Icon(
                              Icons.save_alt_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "save Image",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(
                            EvaIcons.link,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Save link",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        )),
  );
}

Widget _itemPost(BuildContext context, String imgUrl, String caption) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/images/profil.png"),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(
                  height: 5,
                ),
                Text(
                  "User Name",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "11-yanvar 2023",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  imageMenu(context, imgUrl);
                },
                icon: const Icon(
                  EvaIcons.moreHorizontal,
                  size: 30,
                  color: Colors.black,
                ))
          ],
        ),
      ),
      SizedBox(
        height: 5,
      ),
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
      Row(
        children: [
          SizedBox(
            width: 5,
          ),
          LikeButton(
            size: 30,
          ),
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(
                EvaIcons.paperPlane,
                color: Colors.black,
                size: 25,
              ))
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          caption,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
      SizedBox(
        height: 10,
      )
    ],
  );
}
