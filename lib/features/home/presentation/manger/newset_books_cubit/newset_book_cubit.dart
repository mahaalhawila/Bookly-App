import 'package:bloc/bloc.dart';
import '../../../../../core/models/repos/home_repos.dart';
import 'newset_book_state.dart';
class NewsetBooksCubit extends Cubit<NewsetBooksState>
{
  NewsetBooksCubit(this.homeRepo):super(NewsetBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchNewsetBooks() async {
    emit(NewsetBooksLoading());
    var result = await homeRepo.fetchNewsetBooks();
    result.fold((failure)
    {
      emit(NewsetBooksFailure(failure.toString()));
    }, (books)
    {
      emit(NewsetBooksSuccess(books));
    });
  }
}