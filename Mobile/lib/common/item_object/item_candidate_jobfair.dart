class ItemCandidateApply {
  final int job_fair_id;
  final String candidate_name;
  final String candidate_email;
  final String candidate_image;
  final int? status_offer;

  ItemCandidateApply(
      this.job_fair_id,
      this.candidate_name,
      this.candidate_email,
      this.candidate_image,
      {this.status_offer}
      );

  factory ItemCandidateApply.fromJson(dynamic json) {
    return ItemCandidateApply(
        json['job_fair_id'] as int,
        json['candidate_name'] as String,
        json['candidate_email'] as String,
        json['candidate_image'] as String,
        status_offer:  json['status_offer'] ??0,
    );
  }
}