// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:gallery_app/constants.dart';
// // import 'package:gallery_app/ui/global_widgets/snack_message.dart';

// class GTabBar extends StatelessWidget {
//   final Widget? child;

//   const GTabBar({
//     this.child,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: Row(
//         children: [
//           Expanded(
//             child: Container(
//               decoration: const BoxDecoration(
//                 border: Border(
//                   bottom: BorderSide(
//                     color: DEFAULT_ACCENT_COLOR,
//                     width: 2.5,
//                     style: BorderStyle.solid,
//                   ),
//                 ),
//               ),
//               child: const Center(
//                 child: Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(
//                     'New',
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const Expanded(
//             child: Center(
//               child: Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Text(
//                   'Popular',
//                   style: TextStyle(
//                     fontSize: 22,
//                     color: DEFAULT_SUBTITLE_COLOR,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
