import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/ui/pages/bloc/select_page_bloc.dart';
import 'package:gallery_app/ui/pages/new_page.dart';
import 'package:gallery_app/ui/pages/popular_page.dart';
// import 'package:gallery_app/ui/global_widgets/snack_message.dart';

class GTabBar extends StatelessWidget {
  final Widget? child;

  const GTabBar({
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectPageBloc(),
      child: BlocBuilder<SelectPageBloc, SelectPageState>(
        builder: (context, state) {
          if (state is SelectedNewPageState) {
            return BlocBuilder<SelectPageBloc, SelectPageState>(
              builder: (context, state) {
                return const Column(
                  children: [
                    NewPage(),
                  ],
                );
              },
            );
          }

          if (state is SelectedPopularPageState) {
            return BlocBuilder<SelectPageBloc, SelectPageState>(
              builder: (context, state) {
                return const Column(
                  children: [
                    PopularPage(),
                  ],
                );
              },
            );
          }
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Error #main'),
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
