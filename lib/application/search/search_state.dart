part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required List<Result> searchResults,
    required List<Downloads> downloads,
    required bool isLoading,
    required bool isError,
    required bool isIdle,
  }) = _SearchState;

  factory SearchState.initial() => const SearchState(
        searchResults: [],
        downloads: [],
        isLoading: false,
        isError: false,
        isIdle: true,
      );
}
