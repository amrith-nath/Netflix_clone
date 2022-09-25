import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failures.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';
import 'package:netflix/domain/downloads/models.dart/downloads.dart';
import 'package:netflix/domain/search/i_search_repo.dart';

import '../../domain/search/model/search_response/result.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsrepo;
  final ISearchRepo _searchRepo;

  SearchBloc(
    this._downloadsrepo,
    this._searchRepo,
  ) : super(SearchState.initial()) {
//
// idle state
//
    on<Initialize>((event, emit) async {
      emit(
        const SearchState(
          searchResults: [],
          downloads: [],
          isLoading: true,
          isError: false,
          isIdle: true,
        ),
      );

      // get trending
      final result = await _downloadsrepo.getDownloadsImage();
      result.fold((MainFailures f) {
        emit(
          const SearchState(
            searchResults: [],
            downloads: [],
            isLoading: false,
            isError: true,
            isIdle: true,
          ),
        );
      }, (List<Downloads> list) {
        emit(
          SearchState(
            searchResults: [],
            downloads: list,
            isLoading: true,
            isError: false,
            isIdle: false,
          ),
        );
      });

      //show to ui
    });

//
// search state
//
    on<MovieSearch>((event, emit) {
      // call search movie api
      _searchRepo.getSearchMovies(moviename: event.movieName);

      //show to ui
    });
  }
}
