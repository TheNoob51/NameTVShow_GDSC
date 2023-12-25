import 'package:nameshow/const/colors.dart';
import 'package:nameshow/const/exitscreen.dart';
import 'package:nameshow/const/linkers.dart';

//TO REMOVE
import 'package:flutter/services.dart' as rootbundle;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//TO REMOVE
  Future<List<MovieDataModel>> ReadJsonData() async {
    final jsondata =
        await rootbundle.rootBundle.loadString('jsonfile/allseries.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => MovieDataModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => exitDialog(context));
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromRGBO(0, 0, 0, 1.0),
          title: Text(
            widget.title,
            style: const TextStyle(
                fontSize: 26.0, fontWeight: FontWeight.bold, color: white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context, delegate: CustomSearchDelegate());
                },
                icon: const Icon(
                  Icons.search_sharp,
                  color: white,
                ))
          ],
        ),

        // Remove The Future Builder
        body: Container(
          color: black,
          padding: const EdgeInsets.all(15),
          child: FutureBuilder(
            future: ReadJsonData(),
            builder: (context, data) {
              //if
              if (data.hasError) {
                return Center(child: Text("${data.error}"));
              }
              //else

              else if (data.hasData) {
                var items = data.data as List<MovieDataModel>;
                return GridView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            mainAxisExtent: 240),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          // Image.asset(categoryImages[index],
                          //     height: 150, width: 200, fit: BoxFit.cover),
                          10.heightBox,
                          items[index]
                              .name
                              .toString()
                              .text
                              .color(black)
                              .fontWeight(FontWeight.bold)
                              .align(TextAlign.center)
                              .make(),
                          10.heightBox,
                          SizedBox(
                            height: 140,
                            child: Image(
                                image: NetworkImage(
                                    items[index].imageURL.toString()),
                                fit: BoxFit.fill),
                          ),
                          const Divider(),
                          "Rating : ${items[index].rating.toString()}"
                              .text
                              .align(TextAlign.center)
                              .make(),
                          const Text("See More...",
                              style: TextStyle(
                                  color: black, fontWeight: FontWeight.bold))
                        ],
                      )
                          .box
                          .white
                          .rounded
                          .clip(Clip.antiAlias)
                          .outerShadowMd
                          .make()
                          .onTap(() {
                        Get.to(() => MovieDetails(
                            //title: categoryList[index]
                            ));
                      });
                    });
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
