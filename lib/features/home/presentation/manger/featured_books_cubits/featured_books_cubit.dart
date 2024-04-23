import 'package:bloc/bloc.dart';
import '../../../../../core/models/repos/home_repos.dart';
import 'featured_books_state.dart';
class FeaturedBooksCubit extends Cubit<FeaturedBooksState>
{
  FeaturedBooksCubit(this.homeRepo):super(FeaturedBooksInitial());
final HomeRepo homeRepo;

Future<void> fetchFeaturedBooks() async {
  emit(FeaturedBooksLoading());
 var result = await homeRepo.fetchFeaturedBooks();
 result.fold((failure)
 {
   emit(FeaturedBooksFailure(failure.errMessage));
 }, (books)
 {
   emit(FeaturedBooksSuccess(books));
 });
}
}