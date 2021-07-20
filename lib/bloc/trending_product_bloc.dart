import 'package:mockfeveret/models/trending_product_model.dart';
import 'package:mockfeveret/repository/network_respository.dart';
import 'package:rxdart/rxdart.dart';

final TrendingProductBloc trendingProductBloc = TrendingProductBloc();

class TrendingProductBloc {
  final NetworkRepository _repository = NetworkRepository();

  final BehaviorSubject<List<TrendingProductModel>> _subject =
      BehaviorSubject<List<TrendingProductModel>>();

  BehaviorSubject<List<TrendingProductModel>> get subject => _subject;

  dispose() {
    _subject.close();
  }

  getTrendingProducts() async {
    List<TrendingProductModel> output = await _repository.getTrendingProducts();
    _subject.sink.add(output);
  }
}
