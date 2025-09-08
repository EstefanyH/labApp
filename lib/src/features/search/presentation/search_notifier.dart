
import 'package:applab/src/core/domain/entities/laboratory.dart';
import 'package:applab/src/features/search/data/search_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final searchNotifierProvider =
    StateNotifierProvider<SearchNotifier, AsyncValue<List<Laboratory>>>((ref) {
  return SearchNotifier(ref.read(SearchRepositoryProvider));
});

final SearchRepositoryProvider = Provider<SearchRepository>((ref) {
  return SearchRepository();
});

class SearchNotifier extends StateNotifier<AsyncValue<List<Laboratory>>> {

  final SearchRepository _repository;
  List<Laboratory> _allLab = [];

  SearchNotifier(this._repository): super(const AsyncValue.loading()) {
    loadFetch();
  }

  Future<void> loadFetch () async {
    state = const AsyncValue.loading();
    try{
      final labs = await _repository.fetchLab();
      _allLab = labs;
      state = AsyncValue.data(labs);
    }catch(e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void search(String query) {
    if (query.isEmpty) {
      state = AsyncValue.data(_allLab);
    } else {
      final filtered = _allLab
          .where((exam) => exam.Name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      state = AsyncValue.data(filtered);
    }
  }

}