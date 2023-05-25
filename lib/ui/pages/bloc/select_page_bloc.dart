import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'select_page_event.dart';
part 'select_page_state.dart';

class SelectPageBloc extends Bloc<SelectPageEvent, SelectPageState> {
  SelectPageBloc() : super(SelectPageInitialState()) {
    on<SelectPopularPageEvent>(_selectPopularPage);
    on<SelectNewPageEvent>(_selectNewPage);
    _initialize();
  }

  void _selectPopularPage(
      SelectPopularPageEvent event, Emitter<SelectPageState> emit) {
    emit(
      SelectedPopularPageState(),
    );
  }

  void _selectNewPage(SelectNewPageEvent event, Emitter<SelectPageState> emit) {
    emit(
      SelectedNewPageState(),
    );
  }

  void _initialize() {
    emit(
      SelectedNewPageState(),
    );
  }
}
