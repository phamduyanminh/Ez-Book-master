part of 'book_bloc.dart';

abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

class BookInitial extends BookState {}

class BookLoading extends BookState {}

class BookLoaded extends BookState {
  final Book bookModel;
  const BookLoaded(this.bookModel);

  @override
  List<Object> get props => [bookModel];
}

class BookError extends BookState {
  final String errorMessage;
  const BookError(this.errorMessage);
}
