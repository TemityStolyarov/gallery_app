part of 'select_tab_bloc.dart';

@immutable
abstract class SelectTabState {}

class SelectTabInitialState extends SelectTabState {}

class SelectedNewTabState extends SelectTabState {
  SelectedNewTabState();
}

class SelectedPopularTabState extends SelectTabState {
  SelectedPopularTabState();
}
