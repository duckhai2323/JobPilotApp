class University {
  final int? cv_id;
  final int candidate_id;
  final String univer_name;
  final String specialized;
  final String start_uni;
  final String end_uni;
  final String description;

  University(
      this.candidate_id,
      this.univer_name,
      this.specialized,
      this.start_uni,
      this.end_uni,
      this.description,
      {this.cv_id});

  factory University.fromJson(dynamic json) {
    return University(
        json['candidate_id']??0,
        json['univer_name']??"",
        json['specialized']??"",
        json['start_uni']??"",
        json['end_uni']??"",
        json['description']??"",
        cv_id: json['cv_id'] as int,
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'candidate_id' : candidate_id,
      'univer_name' : univer_name,
      'specialized': specialized,
      'start_uni' : start_uni,
      'end_uni' : end_uni,
      'description': description,
    };
  }
}