import 'package:flutter/cupertino.dart';
import '../../../../../core/models/book_model/book_model.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});
final BookModel book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child:  CustomBookImage(
            imageUrl:book.volumeInfo.imageLinks?.thumbnail??''
          ),
        ),
        const SizedBox(
          height: 43,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left:60),
            child: Text(book.volumeInfo.title??'',
              style: Styles.textStyle30.copyWith(
                fontWeight: FontWeight.bold
            ),),
          ),
        ),
        const SizedBox(
          height: 6,),
        Opacity(
          opacity: .7,
          child: Center(
            child: Text(book.volumeInfo.authors?[0]??''
            ,style: Styles.textStyle18.copyWith(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500
            ),),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        BookRating(
          rating: book.volumeInfo.averageRating ?? 0,
          count: book.volumeInfo.ratingsCount ?? 0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 37,
        ),
       BooksAction(
         bookModel: book,
       ),
      ],
    );
  }
}