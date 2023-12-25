// ignore_for_file: public_member_api_docs, sort_constructors_first
class MovieDataModel {
  double? score;
  String? name;
  String? type;
  String? language;
  String? premiered;
  String? ended;
  double? rating;
  String? imageURL;
  String? summary;

  MovieDataModel(
      {this.score,
      this.name,
      this.type,
      this.language,
      this.premiered,
      this.ended,
      this.rating,
      this.imageURL,
      this.summary});

  MovieDataModel.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    name = json['name'];
    type = json['type'];
    language = json['language'];
    premiered = json['premiered'];
    ended = json['ended'];
    rating = json['rating'];
    imageURL = json['image'];
    summary = json['summary'];
  }
}
