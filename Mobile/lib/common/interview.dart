class Interview {
  final int?  interview_id;
  final int job_id;
  final String interview_type;
  final int index;
  final String interview_date;
  final int status;

  Interview(this.job_id, this.interview_type, this.index, this.interview_date, this.status, {this.interview_id});

  factory Interview.fromJson(dynamic json) {
    return Interview(
        json['job_id'] as int,
        json['interview_type'] as String,
        json['index'] as int,
        json['interview_date'] as String,
        json['status'] as int,
        interview_id: json['interview_id'] as int
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'job_id' : job_id,
      'interview_type' : interview_type,
      'index' : index,
      'interview_date' : interview_date,
      'status' : status,
    };
  }
}