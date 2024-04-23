import 'package:equatable/equatable.dart';

import '../../../../../core/models/book_model/book_model.dart';

abstract class SearchBooksState extends Equatable{
  const SearchBooksState();
  @override
  List<Object> get props =>[];
}

class SearchBooksInitial extends SearchBooksState{}
class SearchBooksLoading extends SearchBooksState{}
class SearchBooksFailure extends SearchBooksState{
  final String errMessage;

  const SearchBooksFailure(this.errMessage);
}

class SearchBooksSuccess extends SearchBooksState{
  final List<BookModel> books;

  const SearchBooksSuccess(this.books);
}