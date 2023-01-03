import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';
import 'package:netflix/domain/downloads/models.dart/downloads.dart';
import 'package:netflix/domain/search/i_search_repo.dart';
import 'package:netflix/domain/search/model/search_response/search_response.dart';

import '../../domain/core/api_end_points.dart';

@LazySingleton(as: ISearchRepo)
class SearchRepository implements ISearchRepo {
  @override
  Future<Either<MainFailures, List<SearchResponse>>> getSearchMovies(
      {required String moviename}) async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.search,
        queryParameters: {
          "query": moviename,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final searchResults =
            SearchResponse.fromJson(response.data) as List<SearchResponse>;

        return right(searchResults);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailures.clientFailure());
    }
  }
}
