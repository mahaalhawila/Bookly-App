import 'package:flutter/material.dart';
import 'package:untitled2/features/search/presentation/views/widgets/search_view_body.dart';
class SearchView extends StatelessWidget {
  SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SearchViewBody(),
      ),
    );
  }
}