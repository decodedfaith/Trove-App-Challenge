import 'package:trove_app_challenge/models/portfolio_model.dart';

class TroveDataDetails {
  TroveDataDetails({
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.password,
    required this.phoneNumber,
    required this.portfolio,
  });
  late final String email;
  late final String firstname;
  late final String lastname;
  late final String password;
  late final String phoneNumber;
  late final List<Portfolio> portfolio;
  
  TroveDataDetails.fromJson(Map<String, dynamic> json){
    email = json['email'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    portfolio = List.from(json['portfolio']).map((e)=>Portfolio.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['firstname'] = firstname;
    _data['lastname'] = lastname;
    _data['password'] = password;
    _data['phoneNumber'] = phoneNumber;
    _data['portfolio'] = portfolio.map((e)=>e.toJson()).toList();
    return _data;
  }
}