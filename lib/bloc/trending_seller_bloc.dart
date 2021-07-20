import 'package:mockfeveret/models/trending_seller_model.dart';
import 'package:mockfeveret/repository/network_respository.dart';
import 'package:rxdart/rxdart.dart';

final TrendingSellerBloc trendingSellerBloc = TrendingSellerBloc();

class TrendingSellerBloc {
  final NetworkRepository _repository = NetworkRepository();

  final BehaviorSubject<List<TrendingSellerModel>> _subject =
      BehaviorSubject<List<TrendingSellerModel>>();

  BehaviorSubject<List<TrendingSellerModel>> get subject => _subject;

  dispose() {
    _subject.close();
  }

  getTrendingSellers() async {
    List<TrendingSellerModel> output = await _repository.getTrendingSellers();
    _subject.sink.add(output);
  }
}
