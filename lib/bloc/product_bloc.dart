import 'package:mockfeveret/models/product_model.dart';
import 'package:mockfeveret/repository/network_respository.dart';
import 'package:rxdart/rxdart.dart';

final ProductBloc productBloc = ProductBloc();

class ProductBloc {
  final NetworkRepository _repository = NetworkRepository();

  final BehaviorSubject<List<ProductModel>> _subject =
      BehaviorSubject<List<ProductModel>>();

  BehaviorSubject<List<ProductModel>> get subject => _subject;

  dispose() {
    _subject.close();
  }

  getProducts() async {
    List<ProductModel> output = await _repository.getProducts();
    _subject.sink.add(output);
  }
}
