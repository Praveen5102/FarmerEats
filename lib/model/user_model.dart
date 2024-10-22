// lib/models/user_model.dart

class UserModel {
  String fullName;
  String email;
  String phone;
  String password;
  String role;
  String businessName;
  String informalName;
  String streetAddress;
  String city;
  String state;
  int zipCode; // Changed to int to match the JSON format
  String registrationProof;
  Map<String, List<String>> businessHours;

  UserModel({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
    required this.role,
    required this.businessName,
    required this.informalName,
    required this.streetAddress,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.registrationProof,
    required this.businessHours,
  });

  Map<String, dynamic> toMap() {
    return {
      'full_name': fullName,
      'email': email,
      'phone': phone,
      'password': password,
      'role': role,
      'business_name': businessName,
      'informal_name': informalName,
      'address': streetAddress,
      'city': city,
      'state': state,
      'zip_code': zipCode,
      'registration_proof': registrationProof,
      'business_hours': businessHours,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      fullName: map['full_name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      password: map['password'] ?? '',
      role: map['role'] ?? '',
      businessName: map['business_name'] ?? '',
      informalName: map['informal_name'] ?? '',
      streetAddress: map['address'] ?? '',
      city: map['city'] ?? '',
      state: map['state'] ?? '',
      zipCode: map['zip_code'] ?? 0,
      registrationProof: map['registration_proof'] ?? '',
      businessHours: Map<String, List<String>>.from(map['business_hours'] ?? {}),
    );
  }
}
