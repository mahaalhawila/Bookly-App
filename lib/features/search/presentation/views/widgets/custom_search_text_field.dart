import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../manger/search_books/search_books_cubit.dart';

class CustomSearchTextField extends StatelessWidget {
  CustomSearchTextField({super.key,});
  @override
  Widget build(BuildContext context) {
    return  TextField(
      onChanged:(value){
        context.read<SearchBooksCubit>().fetchSearchBooks(searchBook:value);
      } ,
      decoration: InputDecoration(
          enabledBorder:buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          hintText: 'Search',
          suffixIcon: IconButton(onPressed: (){},
              icon:const Opacity(
                opacity: .8,
                child: Icon(FontAwesomeIcons.magnifyingGlass,
                  size:22,),
              ))
      ),
    ) ;
  }
  OutlineInputBorder buildOutlineInputBorder(){
    return OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(12)

    );
  }
}