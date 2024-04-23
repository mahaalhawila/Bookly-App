import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_ loading_indicator.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../manger/newset_books_cubit/newset_book_cubit.dart';
import '../../manger/newset_books_cubit/newset_book_state.dart';
import 'book_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit,NewsetBooksState>(
        builder:(context,state){
      if(state is NewsetBooksSuccess){
        return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context,index){

              return  Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BookListViewItem(
                  bookModel: state.books[index],
                ),
              );
            });
      }else if (state is NewsetBooksFailure){
        return CustomErrorWidget(errMessage: state.errMessage);
      } else {
        return const CustomLoadingIndicator();
      }
      }
    );
  }
}