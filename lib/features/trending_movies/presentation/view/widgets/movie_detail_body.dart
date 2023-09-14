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
      ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(24)),
          child: SizedBox(
            height: 35.h,
            child: _imageBuilder(),
          )),
      Text(movieDetail.title!),
      Text(movieDetail.releaseDate),
      ...movieDetail.genres.map((e) => Text(e.name)).toList(),
      Text(movieDetail.overview!),
      Text(movieDetail.homepage!),
      Text(movieDetail.budget.toString()),
      Text(movieDetail.revenue.toString()),
      ...movieDetail.spokenLanguages.map((e) => Text(e.name)).toList(),
      Text(movieDetail.status!),
      Text(movieDetail.runtime.toString()),
    ]);
  }

  _imageBuilder() {
    return isOfflineState
        ? movieDetail.backdropOfflinePath == null
            ? const Icon(Icons.image)
            : Image.file(
                File(movieDetail.backdropOfflinePath!),
                fit: BoxFit.fill,
              )
        : movieDetail.backdropPath == null
            ? const Icon(Icons.image)
            : CachedNetworkImage(
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, progress) =>
                    const CustomCircularProgressIndicator(),
                imageUrl: ApiConsts.imageBaseUrl +
                    movieDetail.backdropPath.toString(),
              );
  }
}
