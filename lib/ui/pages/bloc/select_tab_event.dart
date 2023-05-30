part of 'select_tab_bloc.dart';

abstract class SelectTabEvent {}

class SelectPopularTabEvent extends SelectTabEvent {
  SelectPopularTabEvent();
}

class SelectNewTabEvent extends SelectTabEvent {
  SelectNewTabEvent();
}
