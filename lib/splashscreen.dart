// ignore_for_file: camel_case_types

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
    // return const Scaffold(
    //     //backgroundColor: golden,
    //     body: DecoratedBox(
    //   // BoxDecoration takes the image
    //   decoration: BoxDecoration(
    //     // Image set to background of the body
    //     image: DecorationImage(image: AssetImage(splashimg), fit: BoxFit.cover),
    //   ),
    // ));

    return const Scaffold(
      body: Center(
        child: Text('Hello World'),
      ),
    );
  }
}
