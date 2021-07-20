import 'package:mockfeveret/models/new_arrival_model.dart';
import 'package:mockfeveret/repository/network_respository.dart';
import 'package:rxdart/rxdart.dart';

final ProductBloc productBloc = ProductBloc();

class ProductBloc {
  final NetworkRepository _repository = NetworkRepository();

  final BehaviorSubject<List<NewArrivalModel>> _subject =
      BehaviorSubject<List<NewArrivalModel>>();

  BehaviorSubject<List<NewArrivalModel>> get subject => _subject;

  dispose() {
    _subject.close();
  }

  getProducts() async {
    List<NewArrivalModel> output = await _repository.getProducts();
    _subject.sink.add(output);
  }
}
