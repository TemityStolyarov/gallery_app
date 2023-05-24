part of 'select_page_bloc.dart';

@immutable
abstract class SelectPageState {}

class SelectPageInitial extends SelectPageState {}

class SelectedPopularPage extends SelectPageState {
  final bool isPopularPageSelected;

  SelectedPopularPage(this.isPopularPageSelected);
}

class SelectedNewPage extends SelectPageState {
  final bool isNewPageSelected;

  SelectedNewPage(this.isNewPageSelected);
}
