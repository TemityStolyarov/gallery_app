import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'select_page_event.dart';
part 'select_page_state.dart';

class SelectPageBloc extends Bloc<SelectPageEvent, SelectPageState> {
  SelectPageBloc() : super(SelectPageInitialState()) {
    on<SelectPopularPageEvent>(_selectPopularPage);
    on<SelectNewPageEvent>(_selectNewPage);
    on<SelectAddPhotoPageEvent>(_selectAddPhotoPage);
    _initialize();
  }

  _selectPopularPage(
      SelectPopularPageEvent event, Emitter<SelectPageState> emit) {
    emit(
      SelectedPopularPageState(),
    );
  }

  _selectNewPage(SelectNewPageEvent event, Emitter<SelectPageState> emit) {
    emit(
      SelectedNewPageState(),
    );
  }

  _selectAddPhotoPage(
      SelectAddPhotoPageEvent event, Emitter<SelectPageState> emit) {
    emit(
      SelectedAddPhotoPageState(),
    );
  }

  _initialize() {
    emit(
      SelectedNewPageState(),
    );
  }
}
