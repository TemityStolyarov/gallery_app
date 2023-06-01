import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/core/constants.dart';
import 'package:gallery_app/ui/pages/bloc/select_tab_bloc.dart';
import 'package:gallery_app/ui/pages/feed_page/widgets/image_grid.dart';
// import 'package:gallery_app/ui/global_widgets/snack_message.dart';

final dio = Dio();

class NewTab extends StatelessWidget {
  final Widget? child;

  const NewTab({
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectTabBloc, SelectTabState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<SelectTabBloc>(context);
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: DEFAULT_ACCENT_COLOR,
                            width: 2.5,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'New',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        bloc.add(SelectPopularTabEvent());
                      },
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 2),
                            child: Text(
                              'Popular',
                              style: TextStyle(
                                fontSize: 22,
                                color: DEFAULT_SUBTITLE_COLOR,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ImageGridScreen(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
