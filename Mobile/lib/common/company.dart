class Company {
  final int? company_id;
  final String company_name;
  final String email ;
  final String employee_scale;
  final String company_intro;
  final String company_link;
  final String company_image;
  final String company_location;
  final String company_filed;
  final String company_organize;
  final int status;

  Company(this.company_name, this.email, this.employee_scale, this.company_intro,this.company_link, this.company_image, this.company_location, this.company_filed,this.company_organize,this.status,{this.company_id});

  factory Company.fromJson(dynamic json) {
    return Company(
        json['company_name'] as String,
        json['email'] as String,
        json['employee_scale'] as String,
        json['company_intro'] as String,
        json['company_link'] as String,
        json['company_image'] as String,
        json['company_location'] as String,
        json['company_filed'] as String,
        json['company_organize'] as String,
        json['status'] as int,
        company_id: json['company_id'] as int
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'company_name' : company_name,
      'email' : email,
      'employee_scale' : employee_scale,
      'company_intro' : company_intro,
      'company_link' : company_link,
      'company_image' : company_image,
      'company_location' : company_location,
      'company_filed' : company_filed,
      'company_organize': company_organize,
      'status' : status,
    };
  }
}