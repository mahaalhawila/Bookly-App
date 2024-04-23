import 'package:bloc/bloc.dart';
import 'package:untitled2/features/search/presentation/manger/search_books/search_books_state.dart';
import '../../../../../core/models/repos/home_repos.dart';

class SearchBooksCubit extends Cubit<SearchBooksState>
{
  SearchBooksCubit(this.homeRepo):super(SearchBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchSearchBooks({required String searchBook}) async {
    emit(SearchBooksLoading());
    var result = await homeRepo.SearchBooks(searchBook:searchBook);
    result.fold((failure)
    {
      emit(SearchBooksFailure(failure.errMessage));
    }, (books)
    {
      emit(SearchBooksSuccess(books));
    });
  }
}