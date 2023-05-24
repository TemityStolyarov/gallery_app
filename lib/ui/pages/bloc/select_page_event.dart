part of 'select_page_bloc.dart';

@immutable
abstract class SelectPageEvent {}

class SelectPopularPageEvent extends SelectPageEvent {
  SelectPopularPageEvent();
}

class SelectNewPageEvent extends SelectPageEvent {
  SelectNewPageEvent();
}
