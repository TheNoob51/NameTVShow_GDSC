import 'package:nameshow/const/linkers.dart';

class MovieDetails extends StatelessWidget {
  final MovieDataModel movieDataModel;
  const MovieDetails({Key? key, required this.movieDataModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movieDataModel.name.toString()),
      ),
      body: Column(
        children: [
          Image.network(movieDataModel.imageURL.toString()),
          Text(movieDataModel.language.toString()),
        ],
      ),
    );
  }
}
