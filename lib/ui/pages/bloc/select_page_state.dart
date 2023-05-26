part of 'select_page_bloc.dart';

@immutable
abstract class SelectPageState {}

class SelectPageInitialState extends SelectPageState {}

class SelectedNewPageState extends SelectPageState {
  SelectedNewPageState();
}

class SelectedPopularPageState extends SelectPageState {
  SelectedPopularPageState();
}

class SelectedAddPhotoPageState extends SelectPageState {
  SelectedAddPhotoPageState();
}
