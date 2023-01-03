import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/failures/main_failures.dart';
import 'package:netflix/domain/search/model/search_response/search_response.dart';

abstract class ISearchRepo {
  Future<Either<MainFailures, List<SearchResponse>>> getSearchMovies(
      {required String moviename});
}

//*SearchResponse is created by the extension json class;