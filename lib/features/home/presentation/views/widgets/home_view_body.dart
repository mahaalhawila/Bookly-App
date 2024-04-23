import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import 'best_seller_list_view.dart';
import 'custom_app_bar.dart';
import 'featured_books_list_view.dart';
class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
     return CustomScrollView(
       physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: CustomAppBar(),
              ),
              const FeaturedBooksListView(),
              const SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text('Newset Books',
                  style: Styles.textStyle30.copyWith(
                      fontFamily: kGtSectraFine
                  ),),
              ),
              const SizedBox(
                height: 20,
              ),

            ],
          ) ,
        ),
        //ملء الاجزاء الفاضية
        const SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: BestSellerListView(),
          ),
        )

      ],
    );



  }
}









