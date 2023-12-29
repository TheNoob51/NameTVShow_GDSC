import 'package:nameshow/const/linkers.dart';
// import 'package:flutter/services.dart' as rootbundle;

class CustomSearchDelegate extends SearchDelegate {
  // Future<List<MovieDataModel>> ReadJsonData() async {
  //   final jsondata =
  //       await rootbundle.rootBundle.loadString('jsonfile/allseries.json');
  //   final list = json.decode(jsondata) as List<dynamic>;

  //   return list.map((e) => MovieDataModel.fromJson(e)).toList();
  // }

  List<String> searchTerms = ["All Rise", "All American", "All That"];

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.black),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var movie in searchTerms) {
      if (movie.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(movie);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var movie in searchTerms) {
      if (movie.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(movie);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
