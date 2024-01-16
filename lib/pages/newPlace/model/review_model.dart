class ReviewModle {
  String? id;
  String? value;
  num? star1;
  num? star2;
  num? star3;
  List<Steps>? steps;

  ReviewModle({
    this.id,
    this.value,
    this.star1,
    this.star2,
    this.star3,
    this.steps,
  });

  ReviewModle.fromJson(Map<String, dynamic> json) {
    id = json['questionId'];
    value = json['questionValue'];
    star1 = json['question1StarScore'];
    star2 = json['questionStarScore'];
    star3 = json['question3StarScore'];
    if (json['steps'] != null) {
      steps = <Steps>[];
      json['steps'].forEach((v) {
        steps!.add(Steps.fromJson(v));
      });
    }
  }
}

class Steps {
  String? id;
  String? title;
  String? imageUrl;
  List<Response>? responses;

  Steps({
    this.id,
    this.title,
    this.imageUrl,
    this.responses,
  });

  Steps.fromJson(Map<String, dynamic> json) {
    id = json['stepId'];
    title = json['stepTitle'];
    imageUrl = json['iconPath'];
    if (json['responses'] != null) {
      responses = <Response>[];
      json['responses'].forEach((v) {
        responses!.add(Response.fromJson(v));
      });
    }
  }
}

class Response {
  String? id;
  String? title;
  num? defScore;
  num? score;
  bool? isSelected;

  Response({
    this.id,
    this.title,
    this.defScore,
    this.score,
    this.isSelected,
  });

  Response.fromJson(Map<String, dynamic> json) {
    id = json['responseId'];
    title = json['responseTitle'];
    defScore = json['defaultScore'];
    score = json['score'];
    isSelected = json['isSelected'];
  }
}
