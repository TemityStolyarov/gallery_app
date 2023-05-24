import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery_app/constants.dart';
import 'package:gallery_app/ui/pages/bloc/select_page_bloc.dart';
// import 'package:gallery_app/ui/global_widgets/snack_message.dart';

class PopularPage extends StatefulWidget {
  final Widget? child;

  const PopularPage({
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  State<PopularPage> createState() => _PopularPageState();
}

class _PopularPageState extends State<PopularPage> {
  @override
  Widget build(BuildContext context) {
    final bloc = SelectPageBloc();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'New',
                  style: TextStyle(
                    fontSize: 22,
                    color: DEFAULT_SUBTITLE_COLOR,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
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
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      bloc.add(SelectPopularPageEvent());
                      print('Popular page selected!');
                    },
                    child: const Text(
                      'Popular',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
