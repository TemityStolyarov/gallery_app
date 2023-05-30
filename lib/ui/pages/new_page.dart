import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/core/constants.dart';
import 'package:gallery_app/ui/pages/bloc/select_page_bloc.dart';
import 'package:gallery_app/ui/pages/feed_widgets/image_grid.dart';
// import 'package:gallery_app/ui/global_widgets/snack_message.dart';

final dio = Dio();

class NewPage extends StatelessWidget {
  final Widget? child;

  const NewPage({
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectPageBloc, SelectPageState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<SelectPageBloc>(context);
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
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            bloc.add(SelectPopularPageEvent());
                          },
                          child: const Padding(
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
            Padding(
              padding: const EdgeInsets.all(10),
              child: ImageGridScreen(),
            ),
            // const Padding(
            //   padding: EdgeInsets.all(10.0),
            //   child: Column(
            //     children: [
            //       Row(
            //         children: [
            //           SizedBox(
            //             child: Card(
            //               color: Colors.red,
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.all(Radius.circular(10)),
            //               ),
            //               child: Text('1'),
            //             ),
            //           ),
            //           SizedBox(
            //             child: Card(
            //               color: Colors.red,
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.all(Radius.circular(10)),
            //               ),
            //               child: Text('1'),
            //             ),
            //           ),
            //         ],
            //       ),
            //       Row(
            //         children: [
            //           SizedBox(
            //             child: Card(
            //               color: Colors.red,
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.all(Radius.circular(10)),
            //               ),
            //               child: Text('1'),
            //             ),
            //           ),
            //           SizedBox(
            //             child: Card(
            //               color: Colors.red,
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.all(Radius.circular(10)),
            //               ),
            //               child: Text('1'),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
          ],
        );
      },
    );
  }
}
