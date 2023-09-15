import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iq_movies_app/core/utils/constants/api_const.dart';
import 'package:iq_movies_app/core/utils/widgets/custom_circular_loading.dart';
import 'package:iq_movies_app/features/trending_movies/data/models/movie_detail.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

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
      Expanded(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movieDetail.title!,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: movieDetail.genres
                          .map((e) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                                child: Text(e.name),
                              ))
                          .toList(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      const Text("Release Date : "),
                      Text(DateFormat("LLLL yyyy")
                          .format(DateTime.parse(movieDetail.releaseDate))),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Overview",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(movieDetail.overview!),
                    Text(movieDetail.overview!),
                    const SizedBox(
                      height: 10,
                    ),
                    movieDetail.homepage == null
                        ? const SizedBox.shrink()
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                                const Text("Homepage : ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextButton(
                                    onPressed: () async {
                                      final Uri url = Uri.parse(
                                          movieDetail.homepage.toString());
                                      if (!await launchUrl(url)) {
                                        throw Exception(
                                            'Could not launch $url');
                                      }
                                    },
                                    child:
                                        Text(movieDetail.homepage.toString())),
                              ]),
                    const SizedBox(
                      height: 10,
                    ),
                    movieDetail.budget == null
                        ? const SizedBox.shrink()
                        : Row(
                            children: [
                              const Text("Budget : "),
                              Text(MoneyFormatter(
                                      amount: movieDetail.budget!.toDouble())
                                  .output
                                  .symbolOnLeft),
                            ],
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                    movieDetail.revenue == null
                        ? const SizedBox.shrink()
                        : Row(
                            children: [
                              const Text("Revenue : "),
                              Text(MoneyFormatter(
                                      amount: movieDetail.revenue!.toDouble())
                                  .output
                                  .symbolOnLeft),
                            ],
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Language",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Row(
                        children: movieDetail.spokenLanguages
                            .map((e) => Text(e.name))
                            .toList()),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Status",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(movieDetail.status!),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Runtime",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(movieDetail.runtime.toString()),
                  ]),
            )),
      ),
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
