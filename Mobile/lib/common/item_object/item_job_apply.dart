class ItemJobApply {
  final String? company_name;
  final String? company_image;
  final int? job_id;
  final int? company_id;
  final String? job_title;
  final String? job_location;
  final String? experience_require;
  final String? salary;
  final int? candidate_number;
  final String? deadline_job;
  final int? status;
  final int? jobfair_status;
  final int? status_offer;
  final int? job_fair_id;

  ItemJobApply(
      this.company_name,
      this.company_image,
      this.job_id,
      this.company_id,
      this.job_title,
      this.job_location,
      this.experience_require,
      this.salary,
      this.candidate_number,
      this.deadline_job,
      this.status,
      this.jobfair_status,
      this.status_offer,
      this.job_fair_id,
      );

  factory ItemJobApply.fromJson(dynamic json) {
    return ItemJobApply(
      json['company_name'] as String,
      json['company_image'] as String,
      json['job_id'] as int,
      json['company_id'] as int,
      json['job_title'] as String,
      json['job_location'] as String,
      json['experience_require'] as String,
      json['salary'] as String,
      json['candidate_number'] as int,
      json['deadline_job'] as String,
      json['status'] as int,
      json['jobfair_status'] as int,
      json['status_offer'] as int,
      json['job_fair_id'] as int,
    );
  }
}