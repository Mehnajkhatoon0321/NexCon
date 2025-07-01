part of 'all_delegates_bloc.dart';

sealed class AllDelegatesEvent {}
class ConferenceListHandler extends AllDelegatesEvent {
  String search;
  int page;
  int size;
  ConferenceListHandler(this.search,this.page,this.size);
}