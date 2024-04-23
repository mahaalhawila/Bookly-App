import 'package:bloc/bloc.dart';
import 'package:untitled2/features/home/presentation/manger/similar_books/similar_book_state.dart';

import '../../../../../core/models/repos/home_repos.dart';


class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) :super(SimilarBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold((failure) {
      emit(SimilarBooksFailure(failure.toString()));
    }, (books) {
      emit(SimilarBooksSuccess(books));
    });
  }
}