import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GlobalController extends ChangeNotifier {
  static GlobalController _instance = GlobalController._internal();

  factory GlobalController() {
    return _instance;
  }

  GlobalController._internal();

  Session? _currentSession;
  Session? get currentSession => _currentSession;
  set currentSession(Session? value) {
    _currentSession = value;
  }

  static void reset() {
    _instance = GlobalController._internal();
  }

  static final supabase = Supabase.instance.client;
}
