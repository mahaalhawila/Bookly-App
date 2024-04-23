import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/core/utils/function/launch_url.dart';
import '../../../../../core/models/book_model/book_model.dart';
import '../../../../../core/widgets/custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(child: CustomButton(
            text:"Free",
            backgroundColor: Colors.white,
            textButton: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16)),
          ),
          ),
          Expanded(child: CustomButton(
            onPressed: (){
              launchCustomUrl(context, bookModel.volumeInfo.previewLink!);
            },
            fontSize: 16,
            text: getText(bookModel),
            backgroundColor: const Color(0xffEF8262),
            textButton: Colors.white,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16)),
          ),
          ),
        ],
      ),
    );
  }

String  getText(BookModel bookModel) {
    if(bookModel.volumeInfo.previewLink == null){
      return 'Not Avaliable';
    }else{
      return 'Preview';
    }
  }
}