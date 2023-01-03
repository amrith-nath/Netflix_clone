import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/api_end_points.dart';
import 'package:netflix/domain/core/failures/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';
import 'package:netflix/domain/downloads/models.dart/downloads.dart';

@LazySingleton(as: IDownloadsRepo)
class DownloadRepository extends IDownloadsRepo {
  @override
  Future<Either<MainFailures, List<Downloads>>> getDownloadsImage() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());

        final downloadList = (response.data["results"] as List)
            .map((e) => Downloads.fromJson(e))
            .toList();

        return right(downloadList);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailures.clientFailure());
    }
  }
}
