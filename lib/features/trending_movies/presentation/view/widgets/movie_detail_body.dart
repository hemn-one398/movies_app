import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iq_movies_app/core/utils/constants/api_const.dart';
import 'package:iq_movies_app/core/utils/widgets/custom_circular_loading.dart';
import 'package:iq_movies_app/features/trending_movies/data/models/movie_detail.dart';
import 'package:sizer/sizer.dart';

class MovieDetailBody extends StatelessWidget {
  const MovieDetailBody(
      {Key? key, required this.movieDetail, required this.isOfflineState})
      : super(key: key);
  final MovieDetail movieDetail;
  final bool isOfflineState;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _imageBuilder(),
      const Expanded(child: Text("Movie Detail Body")),
    ]);
  }

  _imageBuilder() {
    return isOfflineState
        ? movieDetail.backdropOfflinePath == null
            ? const Icon(Icons.image)
            : Image.file(
                File(movieDetail.backdropOfflinePath!),
                height: 30.h,
                fit: BoxFit.fill,
              )
        : movieDetail.backdropPath == null
            ? const Icon(Icons.image)
            : CachedNetworkImage(
                height: 30.h,
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, progress) =>
                    const CustomCircularProgressIndicator(),
                imageUrl: ApiConsts.imageBaseUrl +
                    movieDetail.backdropPath.toString(),
              );
  }
}
