import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/ui/pages/bloc/select_tab_bloc.dart';
import 'package:gallery_app/ui/pages/feed_page/widgets/new_tab.dart';
import 'package:gallery_app/ui/pages/feed_page/widgets/popular_tab.dart';
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
      create: (context) => SelectTabBloc(),
      child: BlocBuilder<SelectTabBloc, SelectTabState>(
        builder: (context, state) {
          if (state is SelectedNewTabState) {
            return BlocBuilder<SelectTabBloc, SelectTabState>(
              builder: (context, state) {
                return const Column(
                  children: [
                    NewTab(),
                  ],
                );
              },
            );
          }

          if (state is SelectedPopularTabState) {
            return BlocBuilder<SelectTabBloc, SelectTabState>(
              builder: (context, state) {
                return const Column(
                  children: [
                    PopularTab(),
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
