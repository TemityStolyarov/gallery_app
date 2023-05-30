import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'select_tab_event.dart';
part 'select_tab_state.dart';

class SelectTabBloc extends Bloc<SelectTabEvent, SelectTabState> {
  SelectTabBloc() : super(SelectTabInitialState()) {
    on<SelectPopularTabEvent>(_selectPopularTab);
    on<SelectNewTabEvent>(_selectNewTab);
    _initialize();
  }

  _selectPopularTab(SelectPopularTabEvent event, Emitter<SelectTabState> emit) {
    emit(
      SelectedPopularTabState(),
    );
  }

  _selectNewTab(SelectNewTabEvent event, Emitter<SelectTabState> emit) {
    emit(
      SelectedNewTabState(),
    );
  }

  _initialize() {
    emit(
      SelectedNewTabState(),
    );
  }
}
