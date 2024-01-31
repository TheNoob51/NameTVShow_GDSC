import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:nameshow/const/colors.dart';
import 'package:nameshow/const/exitscreen.dart';
import 'package:nameshow/const/linkers.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  //to initialize the name in the appbar, we created a key to fetch the title of the app
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ConnectivityResult _connectivityResult = ConnectivityResult.none;
  List<MovieDataModel> _moviesData = [];

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
  }

  Future<void> _checkConnectivity() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.none) {
      await _fetchDataFromApi();
    }
    setState(() {
      _connectivityResult = result;
    });
  }

  Future<void> _fetchDataFromApi() async {
    try {
      final response = await http
          .get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));
      // print('Response Body: ${response.body}');
      if (response.statusCode == 200) {
        final List<dynamic> list = json.decode(response.body);
        _moviesData = list.map((e) => MovieDataModel.fromJson(e)).toList();
      } else {
        SnackBar(content: Text("Failed to load data: ${response.statusCode}"));
      }
    } catch (error) {
      SnackBar(content: Text('Error: $error'));
    }
  }

//TO REMOVE
  // Future<List<MovieDataModel>> ReadJsonData() async {
  //   final jsondata =
  //       await rootbundle.rootBundle.loadString('jsonfile/allseries.json');
  //   final list = json.decode(jsondata) as List<dynamic>;

  //   return list.map((e) => MovieDataModel.fromJson(e)).toList();
  // }

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
              child: const Text("Retry"),
            ),
          ],
        ),
      );
    }

    //for list tiles
    return GridView.builder(
      shrinkWrap: true,
      itemCount: _moviesData.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          mainAxisExtent: 250),
      itemBuilder: (context, index) {
        final rating = _moviesData[index].rating?.average ?? 0;
        final imgurl = _moviesData[index].imageURL?.medium ?? "No Image";
        return Column(
          children: [
            10.heightBox,
            _moviesData[index]
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
                            _moviesData[index].imageURL!.medium.toString()),
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
            const Text("See More...",
                style: TextStyle(color: black, fontWeight: FontWeight.bold))
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
                    movieDataModel: _moviesData[index],
                  )));
        });
      },
    );
  }
}
