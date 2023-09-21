import 'package:connectivity_plus/connectivity_plus.dart';

import 'network_info.dart';

class NetworkInfoImpl implements INetworkInfo {
  final Connectivity _connectivity;

  NetworkInfoImpl({required Connectivity connectivity}) : _connectivity = connectivity;

  @override
  Future<bool> get isConnected async {
    final connectivityResult = await (_connectivity.checkConnectivity());
    return connectivityResult == ConnectivityResult.none ? false : true;
  }
}
