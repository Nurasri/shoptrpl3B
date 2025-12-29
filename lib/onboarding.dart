import 'package:flutter/material.dart';
import 'package:shoptrpl3b/homepage.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  PageController page = PageController();
  int indexPage = 0;

  List<Map<String, String>> onBoardData = [
    {
      "title": "Alat Elekronik",
      "subtitle":
          "Tersedia beragam elektronik yang dapat membantu anda dalam kehidupan sehari-hari",
      "image":
          "https://komparase-v2.sgp1.digitaloceanspaces.com/news/01JFV9PXXN1VHW6CAPYC5NTNMH.jpg"
    },
    {
      "title": "Baju Kemeja Pria",
      "subtitle": "Rekomendasi Baju Pria keren dan modis 2025",
      "image":
          "https://p16-images-sign-sg.tokopedia-static.net/tos-alisg-i-aphluv4xwc-sg/14f0a5a7e2084f4c9fa3abc158176385~tplv-aphluv4xwc-white-pad-v1:1600:1600.jpeg?lk3s=0ccea506&x-expires=1766560853&x-signature=K3DoYwFZOhOFcsshV8BaCtxhaCU%3D&x-signature-webp=BjWqjqW7L4fO2g4eag5Ob%2BaPKBE%3D"
    },
    {
      "title": "Baju Wanita",
      "subtitle": "Rekomendasi Baju Wanita lucu dan modis 2025",
      "image":
          "https://p19-images-common-sign-sg.tokopedia-static.net/tos-maliva-i-o3syd03w52-us/3c4dd20b416044e6bdb1e68cd5561f74~tplv-o3syd03w52-resize-jpeg:200:200.webp?lk3s=97278606&x-expires=1766553691&x-signature=VmENqiNFNf6EZQHj9VfZZwvMssQ%3D&x-signature-webp=VmENqiNFNf6EZQHj9VfZZwvMssQ%3D&ect=4g"
    },
    {
      "title": "Sepatu Cowok",
      "subtitle": "Rekomendasi Sepatu cowok keren dan kekinian 2025",
      "image":
          "https://p16-images-sign-sg.tokopedia-static.net/tos-alisg-i-aphluv4xwc-sg/95f22d23495b40f18eb53970f0020dd5~tplv-aphluv4xwc-white-pad-v1:200:200.webp?lk3s=97278606&x-expires=1766553729&x-signature=MNPgx%2FPdFxbOqlrMK8g1RViJjkE%3D&x-signature-webp=MNPgx%2FPdFxbOqlrMK8g1RViJjkE%3D&ect=4g"
    },
    {
      "title": "Sepatu Cewek",
      "subtitle": "Rekomendasi Sepatu cewek lucu dan kekinian 2025",
      "image":
          "https://p16-images-sign-sg.tokopedia-static.net/tos-alisg-i-aphluv4xwc-sg/00cc92b5f22745b88c545c27c0da3d34~tplv-aphluv4xwc-white-pad-v1:200:200.webp?lk3s=97278606&x-expires=1766553768&x-signature=PRdkRSji3s6y5psihCD2zXoNz98%3D&x-signature-webp=PRdkRSji3s6y5psihCD2zXoNz98%3D&ect=4g"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Expanded(
          child: PageView.builder(
            controller: page,
            itemCount: onBoardData.length,
            itemBuilder: (context, index) {
              return OnBoardLayout(
                  title: "${onBoardData[index]["title"]}",
                  subtitle: "${onBoardData[index]["subtitle"]}",
                  image: "${onBoardData[index]["image"]}");
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              indexPage == onBoardData.length - 1
                  ? TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ));
                      },
                      child: const Text("Get Started"))
                  : const Text(""),
              Row(
                children: List.generate(
                  onBoardData.length,
                  (index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: indexPage == index
                            ? Colors.black45
                            : Colors.blueAccent),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                icon: Icon(Icons.arrow_forward),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

class OnBoardLayout extends StatelessWidget {
  const OnBoardLayout(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.image});

  final String title;
  final String subtitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.network(
          image,
          height: 350,
          width: 300,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            subtitle,
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
