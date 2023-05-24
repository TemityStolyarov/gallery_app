import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/ui/pages/bloc/select_page_bloc.dart';
import 'package:gallery_app/ui/pages/new_page/new_page.dart';
import 'package:gallery_app/ui/pages/popular_page/popular_page.dart';

class GPage extends StatefulWidget {
  const GPage({super.key});

  @override
  State<GPage> createState() => _GPage();
}

class _GPage extends State<GPage> {
  final bloc = SelectPageBloc();

  // @override
  // void initState() {
  //   super.initState();
  //   bloc = SelectPageBloc();
  // }

  // @override
  // void dispose() {
  //   bloc.close(); // Don't forget to close the bloc when it's no longer needed
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SelectPageBloc>(
      create: (_) => bloc,
      child: BlocConsumer<SelectPageBloc, SelectPageState>(
        listener: (context, state) {
          if (state is SelectPageInitial || state is SelectedNewPage) {
            //bloc.add(SelectNewPageEvent());
          }

          if (state is SelectedPopularPage) {
            //bloc.add(SelectPopularPageEvent());
          }
        },
        builder: (context, state) {
          if (state is SelectPageInitial || state is SelectedNewPage) {
            return const NewPage();
          }

          if (state is SelectedPopularPage) {
            return const PopularPage();
          }
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Error!'),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
