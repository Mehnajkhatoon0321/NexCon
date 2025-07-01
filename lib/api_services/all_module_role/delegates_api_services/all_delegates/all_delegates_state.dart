part of 'all_delegates_bloc.dart';

@immutable
sealed class AllDelegatesState {}

final class AllDelegatesInitial extends AllDelegatesState {}
class CheckNetworkConnection extends AllDelegatesState {
  final String errorMessage;
  CheckNetworkConnection(this.errorMessage);
}
final class AllDelegatesLoading extends AllDelegatesState {}
final class AllDelegatesFailure extends AllDelegatesState {

  final String failureMessage;
  AllDelegatesFailure(this.failureMessage);

}
final class AllDelegatesServerFailure extends AllDelegatesState {
  final String error;
  AllDelegatesServerFailure(this.error);

}
final class AllDelegatesExceptionFailure extends AllDelegatesState {
  final String error;
  AllDelegatesExceptionFailure(this.error);

}

// My Conference List

final class ConferenceSuccess extends AllDelegatesState {
  final Map<String ,dynamic> logResponse;
  ConferenceSuccess(this.logResponse);

}




