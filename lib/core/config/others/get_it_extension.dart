import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

extension GetItX on GetIt {
  T read<T>(
    BuildContext context, {
    bool listen = false,
  }) {
    return BlocProvider.of(context, listen: listen);
  }
}
