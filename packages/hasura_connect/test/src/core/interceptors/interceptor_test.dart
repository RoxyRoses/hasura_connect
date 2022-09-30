import 'package:hasura_connect/hasura_connect.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class InterceptorBaseMock extends Mock implements InterceptorBase {}
class HasuraConnectMock extends Mock implements HasuraConnect {}
class HasuraErrorMock extends Mock implements HasuraError {}
class ResponseMock extends Mock implements Response {}
class SnapshotMock extends Mock implements Snapshot {}



void main() {
  late InterceptorBase interceptorBase;
  late HasuraConnect connect;
  late HasuraError error;
  late Request request;
  late Snapshot snapshot;
  late Response response;

  setUpAll(
    () {
      interceptorBase = InterceptorBaseMock();
      connect = HasuraConnectMock();
      error = HasuraErrorMock();
      request = Request(url: '', query: const Query(document: 'query'));
      response = ResponseMock();
      snapshot = SnapshotMock();
    },
  );

  group(InterceptorBase, () {
    test('Interceptor Base onConnected should work', () {
      expect(interceptorBase.onConnected(connect), isNull);
    });

    test('Interceptor Base onDisconnected should work', () {
      expect(interceptorBase.onDisconnected(), isNull);
    });

    test('Interceptor Base onError should work', () {
      expect(interceptorBase.onError(error, connect), isNull);
    });

    test('Interceptor Base onRequest should work', () {
      expect(interceptorBase.onRequest(request, connect), isNull);
    });

    test('Interceptor Base onResponse should work', () {
      expect(interceptorBase.onResponse(response, connect), isNull);
    });

    test('Interceptor Base onSubscription should work', () {
      expect(interceptorBase.onSubscription(request, snapshot), isNull);
    });

    test('Interceptor Base onTryAgain should work', () {
      expect(interceptorBase.onTryAgain(connect), isNull);
    });
  });
}
