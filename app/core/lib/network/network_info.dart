import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkInfoContract {
  Future<bool> get isConnected;
}

class NetworkInfo implements NetworkInfoContract {
  final DataConnectionChecker dataConnectionChecker;

  NetworkInfo(this.dataConnectionChecker);

  @override
  Future<bool> get isConnected => dataConnectionChecker.hasConnection;
}
