import 'dart:convert';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../../../../utils/api_constant.dart';
import '../../../../utils/connectivity_service.dart';
import '../../../../utils/pref_utils.dart';

part 'all_delegates_event.dart';
part 'all_delegates_state.dart';

class AllDelegatesBloc extends Bloc<AllDelegatesEvent, AllDelegatesState> {
  AllDelegatesBloc() : super(AllDelegatesInitial()) {
    on<AllDelegatesEvent>((event, emit) {
      // TODO: implement event handler
    });

    //Conference list API
    on<ConferenceListHandler>((event, emit) async {
      final hasInternet = await ConnectivityService.isConnected();

      if (!hasInternet) {
        developer.log('📡 No internet connection.');
        emit(CheckNetworkConnection('No internet connection'));
        return;
      }

      emit(AllDelegatesInitial()); // Show shimmer or loader on UI

      try {
        final String authToken = PrefUtils.getToken();
        final int userId = PrefUtils.getUserId();
        final apiUrl = Uri.parse(
          "${APIEndPoints.conferenceDelegatesList}$userId?page=${event.page}&per_page=${event.size}&search=${event.search}",
        );

        developer.log("🌐 GET => $apiUrl");

        final response = await http.get(
          apiUrl,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $authToken',
          },
        );

        if (response.statusCode == 200) {
          final responseData = jsonDecode(response.body);
          developer.log("✅ Data Fetched: $responseData");
          emit(ConferenceSuccess(responseData));
        } else if (response.statusCode == 400) {
          final responseError = jsonDecode(response.body);
          developer.log("⚠️ 400 Error: $responseError");
          emit(AllDelegatesFailure(responseError));
        } else if (response.statusCode == 500) {
          final responseError = jsonDecode(response.body);
          developer.log("🚨 500 Error: $responseError");
          emit(AllDelegatesServerFailure(responseError));
        } else {
          developer.log("❌ Unexpected Error: ${response.statusCode}");
          emit(AllDelegatesExceptionFailure('Unexpected error occurred.'));
        }
      } catch (e) {
        developer.log('❗ Exception caught: $e');
        emit(AllDelegatesExceptionFailure('Exception occurred: $e'));
      }
    });

  }
}
