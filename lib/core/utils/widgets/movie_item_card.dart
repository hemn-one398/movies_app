import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iq_movies_app/core/utils/constants/api_const.dart';
import 'package:iq_movies_app/feature/trending_movies/data/models/movie.dart';
import 'package:sizer/sizer.dart';

class MovieItemCard extends StatelessWidget {
  const MovieItemCard({
    super.key,
    required this.movie,
    this.isOfflineState = false,
  });

  final Movie movie;
  final bool isOfflineState;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
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
    );
  }

  _imageBuilder() {
    return isOfflineState
        ? movie.backdropOfflinePath == null
            ? _imagePlaceHolder()
            : Image.asset(
                movie.backdropOfflinePath!,
                height: 100.h,
                fit: BoxFit.fill,
              )
        : movie.backdropPath == null
            ? _imagePlaceHolder()
            : CachedNetworkImage(
                height: 100.h,
                fit: BoxFit.fill,
                imageUrl: ApiConsts.imageBaseUrl + movie.backdropPath!,
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
