// ignore_for_file: camel_case_types

import 'package:nameshow/const/colors.dart';

import 'const/linkers.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  //creating a method to change screen
  changeScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(() => const MyHomePage(title: appname));
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  //designing screen with image
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: black,
        child: const Column(
          children: [
            Expanded(
              child: Image(
                image: AssetImage('jsonfile/bg1.png'),
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
