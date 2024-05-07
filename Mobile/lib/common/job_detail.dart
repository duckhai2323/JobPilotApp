class JobDetail {
  final int? job_id;
  final int company_id;
  final String job_title;
  final String job_details;
  final String job_require;
  final String job_benefit;
  final String salary;
  final String job_location;
  final int candidate_number;
  final String experience_require;
  final String work_form;
  final int status;
  final String deadline_job;

  JobDetail(
      this.company_id,
      this.job_title,
      this.job_details,
      this.job_require,
      this.job_benefit,
      this.salary,
      this.job_location,
      this.candidate_number,
      this.experience_require,
      this.work_form,
      this.status,
      this.deadline_job,{this.job_id});

  factory JobDetail.fromJson(dynamic json) {
    return JobDetail(
        json['company_id'] as int,
        json['job_title'] as String,
        json['job_details'] as String,
        json['job_require'] as String,
        json['job_benefit'] as String,
        json['salary'] as String,
        json['job_location'] as String,
        json['candidate_number'] as int,
        json['experience_require'] as String,
        json['work_form'] as String,
        json['status'] as int,
        json['deadline_job'] as String,
        job_id: json['job_id'] as int
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'company_id' : company_id,
      'job_title' : job_title,
      'job_details' : job_details,
      'job_require' : job_require,
      'job_benefit' : job_benefit,
      'salary' : salary,
      'job_location' : job_location,
      'candidate_number': candidate_number,
      'experience_require' : experience_require,
      'work_form' : work_form,
      'status' : status,
      'deadline_job' : deadline_job,
    };
  }

}