import 'package:nameshow/const/linkers.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('API Demo'),
        ),
        body: FutureBuilder<Map<String, dynamic>>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              // Use the data from the API response
              final data = snapshot.data;
              return Text('Show Name: ${data?['name']}');
            }
          },
        ),
      ),
    );
  }
}





// class MovieDetails extends StatefulWidget {
//   const MovieDetails({super.key});

//   @override
//   State<MovieDetails> createState() => _MovieDetailsState();
// }

// class _MovieDetailsState extends State<MovieDetails> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
