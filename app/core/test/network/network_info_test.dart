import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:core/network.dart';

class MockNetworkConnectionChecker extends Mock
    implements DataConnectionChecker {}

void main() {
  NetworkInfo networkInfo;
  MockNetworkConnectionChecker mockNetworkConnectionChecker;

  setUp(() {
    mockNetworkConnectionChecker = MockNetworkConnectionChecker();
    networkInfo = NetworkInfo(mockNetworkConnectionChecker);
  });

  group("Is connected", () {
    test('check if device has connection', () {
      // arrange
      final tHasConnectionFuture = Future.value(true);

      when(mockNetworkConnectionChecker.hasConnection)
          .thenAnswer((_) => tHasConnectionFuture);
      //act
      final result = networkInfo.isConnected;
      //assert
      verify(mockNetworkConnectionChecker.hasConnection);
      expect(result, tHasConnectionFuture);
    });
  });
}
