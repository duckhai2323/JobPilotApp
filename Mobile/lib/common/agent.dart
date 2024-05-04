class Agent {
  final int? agent_id;
  final int company_id;
  final String agent_name;
  final String agent_email;
  final String agent_password;
  final String? password_confirmation;
  final String? agent_image;
  final int status;

  Agent(
      this.company_id,
      this.agent_name,
      this.agent_email,
      this.agent_password,
      this.status,
      {this.agent_id,this.password_confirmation,this.agent_image});

  factory Agent.fromJson(dynamic json) {
    return Agent(
        json['company_id']??0,
        json['agent_name']??"",
        json['agent_email']??"",
        json['agent_password']??"",
        json['status']??0,
        agent_id: json['agent_id'] as int,
        agent_image: json['agent_image'] as String
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'company_id' : company_id,
      'agent_name' : agent_name,
      'agent_email' : agent_email,
      'agent_password' : agent_password,
      'password_confirmation': password_confirmation,
      'status' : status,
    };
  }
}