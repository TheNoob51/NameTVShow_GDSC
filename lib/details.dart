import 'package:nameshow/const/colors.dart';
import 'package:nameshow/const/linkers.dart';

class MovieDetails extends StatelessWidget {
  final MovieDataModel movieDataModel;
  const MovieDetails({Key? key, required this.movieDataModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: brown,
        title: Text(
          movieDataModel.name.toString(),
          style: const TextStyle(color: white),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('jsonfile/backe.png'),
            fit: BoxFit.fill,
          ),
        ),
        // color: red,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(34.0),
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        10.heightBox,
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: movieDataModel.imageURL != null
                                ? Image.network(
                                    movieDataModel.imageURL.toString())
                                : Image.network(
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/2048px-No_image_available.svg.png")),
                        10.heightBox,
                        Text(
                          movieDataModel.name.toString(),
                          style: const TextStyle(
                              color: black,
                              fontWeight: FontWeight.bold,
                              fontSize: Vx.dp40),
                        ),
                        10.heightBox,
                        Text(
                          'Language: ${movieDataModel.language}',
                          style: const TextStyle(
                              color: black,
                              fontWeight: FontWeight.bold,
                              fontSize: Vx.dp24),
                        ),
                        10.heightBox,
                        Text(
                          'Ratings: ${movieDataModel.rating ?? "No Ratings"}',
                          style: const TextStyle(
                              color: black,
                              fontWeight: FontWeight.bold,
                              fontSize: Vx.dp24),
                        ),
                        10.heightBox,
                        Text(
                          'Type: ${movieDataModel.type}',
                          style: const TextStyle(
                              color: black,
                              fontWeight: FontWeight.bold,
                              fontSize: Vx.dp24),
                        ),
                        20.heightBox,
                        Container(
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(88, 97, 107, 0.422),
                              border:
                                  Border.all(color: Colors.black, width: 2.0),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0))),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Premiered Date: ${movieDataModel.premiered ?? "No data available"}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 45,
                              ),
                              Expanded(
                                child: Text(
                                  'Ending Date: ${movieDataModel.ended ?? " No data available"}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // 5.heightBox,
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  10.heightBox,
                                  const Text(
                                    'Summary : ',
                                    style: TextStyle(
                                        color: black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: Vx.dp24),
                                  ),
                                  Text(
                                    '${movieDataModel.summary}',
                                    style: const TextStyle(
                                        color: black, fontSize: Vx.dp24),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
