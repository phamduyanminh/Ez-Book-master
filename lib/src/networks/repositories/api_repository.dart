import '../../models/book.dart';
import '../api/book_api.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<Book> returnFetchApi() async {
    return await _provider.fetchBookApi();
  }
}
