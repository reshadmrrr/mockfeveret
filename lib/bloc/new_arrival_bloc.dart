import 'package:mockfeveret/models/new_arrival_model.dart';
import 'package:mockfeveret/repository/network_respository.dart';
import 'package:rxdart/rxdart.dart';

final NewArrivalBloc arrivalBloc = NewArrivalBloc();

class NewArrivalBloc {
  final NetworkRepository _repository = NetworkRepository();

  final BehaviorSubject<List<NewArrivalModel>> _subject =
      BehaviorSubject<List<NewArrivalModel>>();

  BehaviorSubject<List<NewArrivalModel>> get subject => _subject;

  dispose() {
    _subject.close();
  }

  getNewArrivals() async {
    List<NewArrivalModel> output = await _repository.getNewArrivals();
    _subject.sink.add(output);
  }
}
