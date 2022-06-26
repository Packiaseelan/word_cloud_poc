import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_cloud_poc/core/ioc/di_container.dart';

class BaseView<T extends StateNotifier<S>, S> extends StatefulWidget {
  final Function(T) setupCoordinator;
  final Widget Function(BuildContext context, S state, T coordinator) builder;

  BaseView({Key? key, required this.builder, required this.setupCoordinator});

  @override
  _BaseViewState<T, S> createState() => _BaseViewState<T, S>();
}

class _BaseViewState<T extends StateNotifier<S>, S> extends State<BaseView<T, S>> {
  late T _coordinator;
  late AutoDisposeStateNotifierProvider<T, S> _myNotifierProvider;

  @override
  void initState() {
    _coordinator = DIContainer.container<T>();
    widget.setupCoordinator(_coordinator);
    _myNotifierProvider = StateNotifierProvider.autoDispose<T, S>((ref) => _coordinator);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch<S>(_myNotifierProvider);
        final coordinator = ref.watch(_myNotifierProvider.notifier);
        return widget.builder(context, state, coordinator);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
