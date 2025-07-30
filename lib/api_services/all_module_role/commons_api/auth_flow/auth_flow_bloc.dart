
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
   //delegates register
    on<RegisterDelegateEventHandler>((event, emit) async {
      if (await ConnectivityService.isConnected()) {
        emit(AuthFlowLoading());
        try {
          developer.log("Requesting create: ${Uri.parse(APIEndPoints.delegatesRegister)}");

          final requestData = json.encode({
            "conference_id": event.conferenceId,
            "title": event.title,
            "name": event.name,
            "last_name": event.lastName,
            "delegate_category_id": event.delegateCategoryId,
            "mobile": event.mobile,
            "email": event.email,
            "dob": event.dob,
            "gender": event.gender,
            "password": event.password,
            "password_confirmation": event.passwordConfirmation,
            "role_id": event.roleId,
            "country": event.country,
            "city": event.city,
          });

          final response = await http.post(
            Uri.parse(APIEndPoints.delegatesRegister),
            headers: {
              'Content-Type': 'application/json',
            },
            body: requestData,
          );

          if (response.statusCode == 200) {
            final responseData = jsonDecode(response.body);
            emit(DelegatesRegisterSuccess(responseData));
            developer.log("Delegate registration successful: $responseData");
          } else {
            String errorMessage = "Registration failed";

            try {
              final errorData = jsonDecode(response.body);
              errorMessage = errorData["message"] ?? errorMessage;
            } catch (_) {}

            emit(DelegatesRegisterFailure(errorMessage));
            developer.log("Registration failed: ${response.statusCode}, message: $errorMessage");
          }
        } on SocketException catch (e) {
          emit(AuthServerFailure("Network Error: ${e.message}"));
          developer.log("Network error: ${e.message}");
        } catch (e) {
          emit(AuthServerFailure("Unexpected Error: $e"));
          developer.log("General error: $e");
        }
      } else {
        emit(CheckNetworkLoginConnection("No internet connection"));
      }
    });



  }
}
