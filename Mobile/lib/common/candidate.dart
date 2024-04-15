class Candidate {
  final int? candidate_id;
  final String candidate_name;
  final String candidate_email;
  final String candidate_password;
  final String? remember_token;
  final String? candidate_image;
  final int status;

  Candidate(
      this.candidate_name,
      this.candidate_email,
      this.candidate_password,
      this.status,
      {this.candidate_id,this.remember_token,this.candidate_image});

  factory Candidate.fromJson(dynamic json) {
    return Candidate(
      json['candidate_email'] as String,
      json['candidate_password'] as String,
      json['candidate_name'] as String,
      json['status'] as int,
      candidate_id: json['candidate_id'] as int,
      remember_token: json['remember_token'] as String,
      candidate_image: json['candidate_image'] as String
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'candidate_name' : candidate_name,
      'candidate_email' : candidate_email,
      'candidate_password' : candidate_password,
      'status' : status,
    };
  }
}