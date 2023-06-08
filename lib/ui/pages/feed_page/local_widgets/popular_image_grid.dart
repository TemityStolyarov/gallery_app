import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/api/image_service.dart';
import 'package:gallery_app/core/constants.dart';
import 'package:gallery_app/core/image_model.dart';
import 'package:gallery_app/core/loading_indicator.dart';
import 'package:gallery_app/ui/pages/image_detail_page/image_detail_page.dart';

import 'package:http/http.dart' as http;

class PopularImageGridScreen extends StatefulWidget {
  const PopularImageGridScreen({super.key});

  @override
  createState() => _ImageGridScreenState();
}

class _ImageGridScreenState extends State<PopularImageGridScreen> {
  final ImageService _imageService = ImageService();
  final scrollController = ScrollController();
  bool isLoading = false;
  int page = 1;
  late Future<List<ImageModel>> _imagesFuture;

  @override
  void initState() {
    super.initState();
    scrollController.removeListener(() {});
    scrollController.addListener(_scrollListener);
    _imagesFuture =
        _imageService.getImages(isNew: false, isPopular: true, page: page);
  }

  Future<void> _refreshPage() async {
    page = 1;
    isLoading = false;
    final response = await _imageService.getImages(
        isNew: false, isPopular: true, page: page);
    setState(() {
      scrollController.removeListener(() {});
      scrollController.addListener(_scrollListener);
      _imagesFuture = Future.delayed(
        Duration.zero,
        () {
          return response;
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ImageModel>>(
      future: _imagesFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<ImageModel> images = snapshot.data!;
          final screenHeight = MediaQuery.of(context).size.height - 258;
          return SizedBox(
            height: screenHeight,
            child: RefreshIndicator(
              color: defaultAccentColor,
              onRefresh: _refreshPage,
              displacement: 0,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.manual,
                controller: scrollController,
                child: Column(
                  children: [
                    GridView.builder(
                      semanticChildCount: images.length + 1,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 150 / 100,
                      ),
                      itemCount: images.length,
                      clipBehavior: Clip.hardEdge,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            final response = await http.get(Uri.parse(
                                'https://gallery.prod1.webant.ru${images[index].user}'));
                            final jsonResponse = jsonDecode(response.body);
                            final username = jsonResponse['username'];
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration: Duration.zero,
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return ImageDetailPage(
                                    images[index],
                                    username: username,
                                  );
                                },
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image.network(
                              'https://gallery.prod1.webant.ru/media/${images[index].image.name}',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return DottedBorder(
                                  dashPattern: const [6, 10],
                                  color: defaultAccentColor,
                                  strokeWidth: 3,
                                  strokeCap: StrokeCap.round,
                                  child: Center(
                                    child: Image.asset(
                                      'assets/images/on_error.png',
                                      scale: 10,
                                    ),
                                  ),
                                );
                              },
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                }
                                return const LoadingIndicator();
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    isLoading
                        ? const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: LoadingIndicator(),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          return const LoadingIndicator();
        }
      },
    );
  }

  Future<void> _scrollListener() async {
    if (isLoading) return;
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      setState(() {
        isLoading = true;
      });
      final prevData = _imagesFuture;
      page++;
      List<ImageModel> newData = await prevData +
          await _imageService.getImages(
              isNew: false, isPopular: true, page: page);

      _imagesFuture = Future.delayed(
        const Duration(seconds: 2),
        () {
          setState(() {
            isLoading = false;
          });
          return newData;
        },
      );
      setState(() {
        _imagesFuture = _imagesFuture;
      });
    }
  }
}
