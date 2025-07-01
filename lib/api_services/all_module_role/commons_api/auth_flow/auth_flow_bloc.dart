
import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nexcon/utils/api_constant.dart';
import 'package:nexcon/utils/connectivity_service.dart';
import 'package:nexcon/utils/pref_utils.dart';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;
part 'auth_flow_event.dart';
part 'auth_flow_state.dart';

class AuthFlowBloc extends Bloc<AuthFlowEvent, AuthFlowState> {
  AuthFlowBloc() : super(AuthFlowInitial()) {
    on<AuthFlowEvent>((event, emit) {

      // TODO: implement event handler
    });
    on<LogEventHandler>((event, emit) async {

      final hasInternet = await ConnectivityService.isConnected();
      if (!hasInternet) {
        emit(CheckNetworkLoginConnection("No internet connection"));
        return;
      }

      emit(AuthFlowLoading());

      try {
        final requestData = json.encode({
          "email": event.email,
          "password": event.password,
        });

        developer.log("Requesting login: ${Uri.parse(APIEndPoints.login)}");

        final response = await http.post(
          Uri.parse(APIEndPoints.login),
          headers: {'Content-Type': 'application/json'},
          body: requestData,
        );

        if (response.statusCode == 200) {
          final responseData = jsonDecode(response.body);
          if (responseData.containsKey("token")) {
            final token = responseData["token"];
            PrefUtils.setToken(token);
            emit(LogSuccess(responseData));
            developer.log("Login successful: $responseData");
          } else {
            emit(LogFailure("Unexpected response format"));
          }
        } else {
          String errorMessage = "An error occurred";

          try {
            final errorData = jsonDecode(response.body);
            errorMessage = errorData["message"] ?? errorMessage;
          } catch (_) {
            // Do nothing, fallback to default error message
          }

          emit(LogFailure(errorMessage));
          developer.log("Login failed with status code: ${response.statusCode}, message: $errorMessage");
        }
      } on SocketException catch (e) {
        // Handle network-related errors like DNS lookup failures
        emit(AuthServerFailure("Network Error: Unable to connect to the server. Please check your internet connection."));
        developer.log("Network Error during login: ${e.message}");
      } catch (e) {
        // Handle any other general errors
        emit(AuthServerFailure(e.toString()));
        developer.log("Error during login: $e");
      }
    });
  }
}
