import 'package:flutter/material.dart';

import '../constant.dart';

class Onboarding_Screen extends StatefulWidget {
  const Onboarding_Screen({Key? key}) : super(key: key);

  @override
  State<Onboarding_Screen> createState() => _Onboarding_ScreenState();
}

class _Onboarding_ScreenState extends State<Onboarding_Screen> {
  final PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;
  Color white = Colors.white;

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Text("OnBoarding Screen"),
        centerTitle: true,
        backgroundColor: white,
        elevation: 5.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 20.0),
            child: InkWell(
              onTap: () {},
              child: const Text(
                "skip",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              children: [  createPage(
                size: size,
                title: Constants.title_1,
                description: Constants.description_1,
                image: 'assets/images/plant-one.png',
              ),
                createPage(
                  size: size,
                  title: Constants.title_2,
                  description: Constants.description_2,
                  image: 'assets/images/plant-two.png',
                ),
                createPage(
                  size: size,
                  title: Constants.title_3,
                  description: Constants.description_3,
                  image: 'assets/images/plant-three.png',
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}

class createPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const createPage(
      {Key? key,
      required this.size,
      required this.image,
      required this.description,
      required this.title})
      : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height / 3,
            child: Image.asset(image),
          ),
          SizedBox(height: size.height / 50),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Constants.primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height / 50),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400, color: Colors.grey),
          ),
          SizedBox(height: size.height / 50),
        ],
      ),
    );
  }
}
