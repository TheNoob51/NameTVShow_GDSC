class MovieDataModel {
  double? score;
  String? name;
  String? type;
  String? language;
  String? premiered;
  String? ended;
  Rating? rating;
  Imagea? imageURL;
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
    name = json['show']['name'];
    type = json['show']['type'];
    language = json['show']['language'];
    premiered = json['show']['premiered'];
    ended = json['show']['ended'];
    rating = Rating.fromJson(json['show']['rating']);
    if (json['show']['image'] != null) {
      imageURL = Imagea.fromJson(json['show']['image']);
    } else {
      imageURL = null;
    }
    ;
    summary = json['show']['summary'];
  }
}

class Rating {
  double? average;

  Rating({this.average});

  Rating.fromJson(Map<String, dynamic> json) {
    average = json['average']?.toDouble();
  }
}

class Imagea {
  String? medium;
  String? original;

  Imagea({this.medium, this.original});

  Imagea.fromJson(Map<String, dynamic> json) {
    medium = json['medium'];
    original = json['original'];
  }
}
