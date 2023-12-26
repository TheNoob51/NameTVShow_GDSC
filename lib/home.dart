import 'package:connectivity_plus/connectivity_plus.dart';
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
  ConnectivityResult _connectivityResult = ConnectivityResult.none;
  @override
  void initState() {
    super.initState();
    _checkConnectivity();
  }

  Future<void> _checkConnectivity() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();
    setState(() {
      _connectivityResult = result;
    });
  }

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
          child: _buildContent(),
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (_connectivityResult == ConnectivityResult.none) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "No Internet Connection",
              style: TextStyle(color: Colors.red),
            ),
            ElevatedButton(
              onPressed: () async {
                await _checkConnectivity();
                if (_connectivityResult != ConnectivityResult.none) {
                  setState(() {});
                }
              },
              child: Text("Retry"),
            ),
          ],
        ),
      );
    }
    return FutureBuilder(
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
              itemCount: items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 250),
              itemBuilder: (context, index) {
                final rating = items[index].rating ?? 0;
                final imgurl = items[index].imageURL ?? "No Image";
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
                    (imgurl == "No Image")
                        ? const SizedBox(
                            height: 140,
                            child: Image(
                                image: NetworkImage(
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/2048px-No_image_available.svg.png"),
                                fit: BoxFit.fill),
                          )
                        : SizedBox(
                            height: 140,
                            child: Image(
                                image: NetworkImage(
                                    items[index].imageURL.toString()),
                                fit: BoxFit.fill),
                          ),

                    const Divider(
                      thickness: 1.0,
                      color: grey,
                    ),

                    (rating == 0)
                        ? "No Rating".text.align(TextAlign.center).make()
                        : VxRating(
                            isSelectable: false,
                            value: rating,
                            onRatingUpdate: (value) {},
                            normalColor: grey,
                            selectionColor: golden,
                            count: 5,
                            size: 25,
                            maxRating: 10,
                          ),

                    // "Rating : ${rating.toString()}"
                    //     .text
                    //     .align(TextAlign.center)
                    //     .make(),

                    const Text("See More...",
                        style: TextStyle(
                            color: black, fontWeight: FontWeight.bold))
                  ],
                )
                    .box
                    .color(const Color.fromARGB(173, 255, 255, 255))
                    .rounded
                    .clip(Clip.antiAlias)
                    .outerShadowMd
                    .make()
                    .onTap(() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MovieDetails(
                            movieDataModel: items[index],
                          )));
                  // Get.to(() => MovieDetails(
                  //     //title: categoryList[index]
                  //     ));
                });
              });
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
