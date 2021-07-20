import 'package:mockfeveret/models/new_shop_model.dart';
import 'package:mockfeveret/repository/network_respository.dart';
import 'package:rxdart/rxdart.dart';

final NewShopBloc newShopBloc = NewShopBloc();

class NewShopBloc {
  final NetworkRepository _repository = NetworkRepository();

  final BehaviorSubject<List<NewShopModel>> _subject =
      BehaviorSubject<List<NewShopModel>>();

  BehaviorSubject<List<NewShopModel>> get subject => _subject;

  dispose() {
    _subject.close();
  }

  getNewShops() async {
    List<NewShopModel> output = await _repository.getNewShops();
    _subject.sink.add(output);
  }
}
