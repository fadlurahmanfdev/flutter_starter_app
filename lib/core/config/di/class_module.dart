import 'package:get_it/get_it.dart';

abstract class ClassModule {
  Future<void> registerDependency(GetIt c);
}