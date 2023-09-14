import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iq_movies_app/core/utils/constants/api_const.dart';
import 'package:iq_movies_app/core/utils/widgets/custom_circular_loading.dart';
import 'package:iq_movies_app/features/trending_movies/data/models/movie.dart';
import 'package:sizer/sizer.dart';

class MovieItemCard extends StatelessWidget {
  const MovieItemCard({
    super.key,
    required this.movie,
    this.isOfflineState = false,
    required this.onTap,
  });

  final Movie movie;
  final bool isOfflineState;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Card(
          child: Row(children: [
            Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(18.0),
                  ),
                  child: _imageBuilder(),
                )),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title!,
                        style: Theme.of(context).textTheme.titleLarge,
                        maxLines: 2,
                      ),
                      Text(
                          movie.releaseDate == null
                              ? "Unknown Release Date"
                              : DateTime.parse(movie.releaseDate!)
                                  .year
                                  .toString(),
                          style: Theme.of(context).textTheme.labelLarge),
                    ],
                  ),
                ))
          ]),
        ),
      ),
    );
  }

  _imageBuilder() {
    return isOfflineState
        ? movie.posterOfflinePath == null
            ? _imagePlaceHolder()
            : Image.file(
                File(movie.posterOfflinePath!),
                height: 100.h,
                fit: BoxFit.fill,
              )
        : movie.backdropPath == null
            ? _imagePlaceHolder()
            : CachedNetworkImage(
                height: 100.h,
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, progress) =>
                    const CustomCircularProgressIndicator(),
                errorWidget: (context, url, error) => _imagePlaceHolder(),
                imageUrl: ApiConsts.imageBaseUrl + movie.posterPath.toString(),
              );
  }

  _imagePlaceHolder() {
    return const Icon(
      Icons.image,
      size: 50,
      color: Colors.grey,
    );
  }
}
