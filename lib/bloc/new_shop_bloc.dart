import 'package:mockfeveret/models/new_arrival_model.dart';
import 'package:mockfeveret/repository/network_respository.dart';
import 'package:rxdart/rxdart.dart';

final NewShopBloc newShopBloc = NewShopBloc();

class NewShopBloc {
  final NetworkRepository _repository = NetworkRepository();

  final BehaviorSubject<List<NewArrivalModel>> _subject =
      BehaviorSubject<List<NewArrivalModel>>();

  BehaviorSubject<List<NewArrivalModel>> get subject => _subject;

  dispose() {
    _subject.close();
  }

  getNewShops() async {
    List<NewArrivalModel> output = await _repository.getNewShops();
    _subject.sink.add(output);
  }
}
