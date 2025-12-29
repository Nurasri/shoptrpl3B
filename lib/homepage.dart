import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shoptrpl3b/GridDress.dart';
import 'dart:convert';

import 'package:shoptrpl3b/GridElectronic.dart';
import 'package:shoptrpl3b/GridSepatuCewek.dart';
import 'package:shoptrpl3b/GridSepatuCowok.dart';
import 'package:shoptrpl3b/GridTshirt.dart';
import 'package:shoptrpl3b/onboarding.dart';
import 'package:shoptrpl3b/splashscreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchProduct = TextEditingController();
  PageController bannerController = PageController();
  Timer? bannerTimer;
  int indexBanner = 0;
  List<dynamic> allProductList = [];

  @override
  void initState() {
    super.initState();
    bannerController.addListener(() {
      setState(() {
        indexBanner = bannerController.page!.round() ?? 0;
      });
    });
    bannerOnBoarding();
  }

  Future<void> getProductItem() async {
    String urlProductItem = "http://localhost/servershop/allproductitem.php";
    try {
      var response = await http.get(Uri.parse(urlProductItem));
      setState(() {
        allProductList = jsonDecode(response.body);
      });
    } catch (exc) {
      if (kDebugMode) {
        print(exc);
      }
    }
  }

  void bannerOnBoarding() {
    bannerTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (indexBanner < 2) {
        indexBanner++;
      } else {
        indexBanner = 0;
      }
      bannerController.animateToPage(indexBanner,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> bannerList = [
      'lib/images/ecommerce1.png',
      'lib/images/ecommerce2.png',
      'lib/images/ecommerce3.png'
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nurasri Fauzi Online Shop",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.green.shade400,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            size: 22,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.info_rounded,
              size: 22,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              size: 22,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              controller: searchProduct,
              decoration: InputDecoration(
                labelText: "Search Product",
                labelStyle: const TextStyle(
                    fontSize: 17,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
                suffixIcon: const Align(
                  widthFactor: 1.0,
                  heightFactor: 1.0,
                  child: Icon(
                    Icons.filter_list,
                    color: Colors.red,
                  ),
                ),
                prefixIcon: const Align(
                  widthFactor: 1.0,
                  heightFactor: 1.0,
                  child: Icon(
                    Icons.search_rounded,
                    color: Colors.red,
                  ),
                ),
                filled: true,
                fillColor: Colors.green.shade100,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: 140,
              child: PageView.builder(
                controller: bannerController,
                itemCount: bannerList.length,
                itemBuilder: (context, index) {
                  return Image.asset(
                    bannerList[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                height: 100,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Card(
                      elevation: 5,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const GridElectronic(),
                            ),
                          );
                        },
                        child: SizedBox(
                          height: 80,
                          width: 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('lib/images/electronic.png',
                                  height: 45, width: 45),
                              const Text(
                                'Electronic',
                                style: TextStyle(
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const GridSepatuCewek(),
                            ),
                          );
                        },
                        child: SizedBox(
                          height: 80,
                          width: 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('lib/images/sepatucewek.png',
                                  height: 45, width: 45),
                              const Text(
                                'Sepatu Cewek',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const GridSepatuCowok(),
                            ),
                          );
                        },
                        child: SizedBox(
                          height: 80,
                          width: 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('lib/images/sepatucowok.png',
                                  height: 45, width: 45),
                              const Text(
                                'Sepatu Cowok',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const GridTshirt(),
                            ),
                          );
                        },
                        child: SizedBox(
                          height: 80,
                          width: 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('lib/images/t-shirt.png',
                                  height: 45, width: 45),
                              const Text(
                                'T-Shirt',
                                style: TextStyle(
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const GridDress(),
                            ),
                          );
                        },
                        child: SizedBox(
                          height: 80,
                          width: 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('lib/images/dress.png',
                                  height: 45, width: 45),
                              const Text(
                                'Dress',
                                style: TextStyle(
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  const Text(
                    'Our Product List',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 5),
                  if (allProductList.isEmpty) ...[
                    const Center(
                      child: Text("Product Not Found"),
                    ),
                  ] else ...[
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5),
                      itemCount: allProductList.length,
                      itemBuilder: (context, index) {
                        final productItem = allProductList[index];
                        return GestureDetector(
                          onTap: () {},
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.network(
                                  productItem['images'],
                                  height: 125,
                                  width: 165,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    productItem['name'],
                                    maxLines: 1,
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
