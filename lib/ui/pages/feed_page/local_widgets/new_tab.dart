import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/core/constants.dart';
import 'package:gallery_app/ui/pages/bloc/select_tab_bloc.dart';
import 'package:gallery_app/ui/pages/connection_error_page/connection_error_page.dart';
import 'package:gallery_app/ui/pages/feed_page/local_widgets/new_image_grid.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final dio = Dio();

class NewTab extends StatefulWidget {
  final Widget? child;

  const NewTab({
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  State<NewTab> createState() => _NewTabState();
}

class _NewTabState extends State<NewTab> {
  bool isConnected = false;

  @override
  void initState() {
    super.initState();
    checkInternetConnection();
  }

  Future<void> checkInternetConnection() async {
    final connectivityResult =
        await (InternetConnectionChecker().hasConnection);
    setState(() {
      isConnected = connectivityResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectTabBloc, SelectTabState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<SelectTabBloc>(context);
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: defaultAccentColor,
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
                                  color: defaultSubtitleColor,
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
              isConnected
                  ? const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: NewImageGridScreen(),
                    )
                  : const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 120, horizontal: 16),
                      child: Center(
                        child: ConnectionErrorPage(),
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
