import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/custom_ loading_indicator.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../manger/similar_books/similar_book_state.dart';
import '../../manger/similar_books/similar_books_cubit.dart';
import 'custom_book_image.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit,SimilarBooksState>(
        builder:(context,state){
         if(state is SimilarBooksSuccess){
           return SizedBox(
             height: MediaQuery.of(context).size.height * .15,
             child: ListView.builder(
               itemCount: state.books.length,
                 scrollDirection: Axis.horizontal,
                 itemBuilder: (context,index){
                   return  Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 5),

                     child:CustomBookImage(
                       imageUrl:state.books[index].volumeInfo.imageLinks?.thumbnail ??'',
                     ),
                   );
                 }),
           );
         }else if(state is SimilarBooksFailure){

           return CustomErrorWidget(errMessage: state.errMessage);
         } else {
           return const CustomLoadingIndicator();
         }
        }
        );
  }
}