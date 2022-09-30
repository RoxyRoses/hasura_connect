import 'package:flutter_test/flutter_test.dart';
import 'package:hasura_connect/hasura_connect.dart';

void main() {
  late Response response1;
  late Response response2;
  late Response response3;
  late String query;

  setUpAll(() {
    query = r'''
            subscription getBooks($id: Int) {
  books(where: {id: {_eq: $id}}) {
    id
    name
    authors {
      name
      id
    }
  }
}''';

    response1 = Response(
      data: const {'teste1': 'teste1'},
      statusCode: 200,
      request: Request(url: 'url', query: Query(document: query)),
    );

     response3 = Response(
      data: const {'teste1': 'teste1'},
      statusCode: 200,
      request: Request(url: 'url', query: Query(document: query)),
    );

    response2 = Response(
      data: const {'teste2': 'teste2'},
      statusCode: 202,
      request: Request(url: 'url2', query: Query(document: query)),
    );
  });

  group(Response, () {
    test('response 1 is not equal respose 2', () {
      expect(response1.data == response2.data, isFalse);
    });
    test('response 1 is equal respose 3', () {
      expect(response1.data == response3.data, isTrue);
    });
  });
}
