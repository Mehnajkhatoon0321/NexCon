part of 'auth_flow_bloc.dart';

@immutable
sealed class AuthFlowState {}

final class AuthFlowInitial extends AuthFlowState {}
final class AuthFlowLoading extends AuthFlowState {}

final class LogSuccess extends AuthFlowState {
  final Map<String ,dynamic> logResponse;


  LogSuccess(this.logResponse);

}
final class LogFailure extends AuthFlowState {

  final String failureMessage;
  LogFailure(this.failureMessage);

}


final class AuthServerFailure extends AuthFlowState {
  final String error;
  AuthServerFailure(this.error);

}


class CheckNetworkLoginConnection extends AuthFlowState {
  final String errorMessage;
  CheckNetworkLoginConnection(this.errorMessage);
}
