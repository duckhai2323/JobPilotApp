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
        json['company_id']??0,
        json['job_title'] ??"",
        json['job_details'] ??"",
        json['job_require'] ??"",
        json['job_benefit'] ??"",
        json['salary'] ??"",
        json['job_location'] ??"",
        json['candidate_number'] ??0,
        json['experience_require'] ??"",
        json['work_form']??"",
        json['status'] ??0,
        json['deadline_job'] ??"",
        job_id: json['job_id'] ??0
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