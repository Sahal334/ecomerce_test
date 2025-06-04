import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityProvider with ChangeNotifier {
  bool _isConnected = true;
  bool get isConnected => _isConnected;

  late StreamSubscription<List<ConnectivityResult>> _subscription;

  ConnectivityProvider() {
    _initializeConnectivity();
    _startMonitoring();
  }

  Future<void> _initializeConnectivity() async {
    try {
      final result = await Connectivity().checkConnectivity();
      _checkConnection(result);
    } catch (e) {
      _isConnected = true;
      notifyListeners();
    }
  }

  void _startMonitoring() {
    _subscription = Connectivity().onConnectivityChanged.listen(
          (List<ConnectivityResult> results) {
        _checkConnection(results);
      },
      onError: (error) {
        debugPrint('Connectivity stream error: $error');
      },
    );
  }

  void _checkConnection(List<ConnectivityResult> results) {
    final hasConnection = results.any((result) => result != ConnectivityResult.none);

    if (_isConnected != hasConnection) {
      _isConnected = hasConnection;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}