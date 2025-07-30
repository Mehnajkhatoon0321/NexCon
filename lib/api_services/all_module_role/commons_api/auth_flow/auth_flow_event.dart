part of 'auth_flow_bloc.dart';

@immutable
sealed class AuthFlowEvent {}
class LogEventHandler extends AuthFlowEvent {
  final String email;
  final String password;
  LogEventHandler({required this.email, required this.password});
}
class RegisterDelegateEventHandler extends AuthFlowEvent {
  final int conferenceId;
  final String title;
  final String name;
  final String lastName;
  final int delegateCategoryId;
  final String mobile;
  final String email;
  final String dob;
  final String gender;
  final String password;
  final String passwordConfirmation;
  final int roleId;
  final String country;
  final String state;  // ✅ added this line
  final String city;

  RegisterDelegateEventHandler({
    required this.conferenceId,
    required this.title,
    required this.name,
    required this.lastName,
    required this.delegateCategoryId,
    required this.mobile,
    required this.email,
    required this.dob,
    required this.gender,
    required this.password,
    required this.passwordConfirmation,
    required this.roleId,
    required this.country,
    required this.state, // ✅ added this line
    required this.city,
  });
}
