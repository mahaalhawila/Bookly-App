import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/core/utils/app_router.dart';
import 'package:untitled2/core/utils/service_locator.dart';
import 'constants.dart';
import 'core/models/repos/home_repo_impl.dart';
import 'core/widgets/simple_bloc_observer.dart';
import 'features/home/presentation/manger/featured_books_cubits/featured_books_cubit.dart';
import 'features/home/presentation/manger/newset_books_cubit/newset_book_cubit.dart';
import 'features/search/presentation/manger/search_books/search_books_cubit.dart';

void main() {
  Bloc.observer =SimpleBlocObserver();
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(create:(context)=> FeaturedBooksCubit(
            getIt.get<HomeRepoImpl>()
        )..fetchFeaturedBooks(),
        ),
        BlocProvider(create:(context)=> NewsetBooksCubit(
        getIt.get<HomeRepoImpl>()
        )..fetchNewsetBooks(),
        ),
        BlocProvider(create:(context)=> SearchBooksCubit(
            getIt.get<HomeRepoImpl>()
        ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
          theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: kPrimaryColor,
              textTheme: GoogleFonts.montserratTextTheme(ThemeData
                  .dark()
                  .textTheme)
          ),
          debugShowCheckedModeBanner: false,
      ),
    );
  }
}
