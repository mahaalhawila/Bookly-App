import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_ loading_indicator.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../home/presentation/views/widgets/book_list_view_item.dart';
import '../../manger/search_books/search_books_cubit.dart';
import '../../manger/search_books/search_books_state.dart';
class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
    if (state is SearchBooksSuccess) {
          return Expanded(
              child:ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount:state.books.length ,
                  itemBuilder: (context,index){
                    print(state.books[index].volumeInfo);
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: BookListViewItem(bookModel:state.books[index],),

                    );
                  })
          );

        } else if (state is SearchBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        }else if (state is SearchBooksLoading){
      return const CustomLoadingIndicator();
    }else{
      return Container();
    }
      },
    );
  }
}