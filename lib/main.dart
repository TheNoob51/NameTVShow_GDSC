import 'package:nameshow/splashscreen.dart';

import 'const/linkers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(231, 132, 64, 64)),
        useMaterial3: true,
      ),
      home: const splashscreen(),
    );
  }
}
