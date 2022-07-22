import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/book.dart';
import '../../networks/repositories/api_repository.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc() : super(BookInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<BookEvent>((event, emit) async {
      try {
        emit(BookLoading());
        final responseData = await apiRepository.returnFetchApi();
        emit(BookLoaded(responseData));
      } on HttpException {
        emit(const BookError("Failed to fetch data!"));
      }
    });
  }
}
