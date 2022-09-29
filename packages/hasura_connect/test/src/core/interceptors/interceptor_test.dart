import 'package:hasura_connect/hasura_connect.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/scaffolding.dart';

class InterceptorBaseMock extends Mock implements InterceptorBase {}
class HasuraConnectMock extends Mock implements HasuraConnect {}


void main() {
  late InterceptorBase interceptorBase;
  late HasuraConnect connect;

  setUpAll(
    () {
      interceptorBase = InterceptorBaseMock();
      connect = HasuraConnectMock();
    },
  );

  group(InterceptorBase, () {
    test('Interceptor Base onConnected should work', () {
      interceptorBase.onConnected(connect);
    });
  });
}
