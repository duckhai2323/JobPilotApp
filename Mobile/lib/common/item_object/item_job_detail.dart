class ItemJobDetail {
  final String? company_name;
  final String? company_image;
  final String? job_title;
  final String? job_location;
  final String? experience_require;
  final String? salary;
  final String? deadline_job;

  ItemJobDetail(
      this.company_name,
      this.company_image,
      this.job_title,
      this.job_location,
      this.experience_require,
      this.salary,
      this.deadline_job
      );

  factory ItemJobDetail.fromJson(dynamic json) {
    return ItemJobDetail(
        json['company_name'] as String,
        json['company_image'] as String,
        json['job_title'] as String,
        json['job_location'] as String,
        json['experience_require'] as String,
        json['salary'] as String,
        json['deadline_job'] as String,
    );
  }
}