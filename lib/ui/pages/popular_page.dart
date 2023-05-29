import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/core/constants.dart';
import 'package:gallery_app/ui/pages/bloc/select_page_bloc.dart';
// import 'package:gallery_app/ui/global_widgets/snack_message.dart';

class PopularPage extends StatelessWidget {
  final Widget? child;

  const PopularPage({
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SelectPageBloc>(context);
    return BlocBuilder<SelectPageBloc, SelectPageState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        bloc.add(SelectNewPageEvent());
                      },
                      child: const Text(
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
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
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
            ],
          ),
        );
      },
    );
  }
}
