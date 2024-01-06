import 'package:flutter/material.dart';
import 'package:test_application/bloc/user_bloc.dart';

// InheritedWidget objects have the ability to be
// searched for anywhere 'below' them in the widget tree.
class Provider extends InheritedWidget {
  final UserBloc userBloc;

  Provider({Key? key, required Widget child})
      : userBloc = UserBloc(),
        super(key: key, child: child);

  @override
  // ignore: avoid_renaming_method_parameters
  bool updateShouldNotify(_) => true;

  // this method is used to access an instance of
  // an inherited widget from lower in the tree.
  // `BuildContext.dependOnInheritedWidgetOfExactType` is a built in
  // Flutter method that does the hard work of traversing the tree for you
  static Provider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()!;
  }
}
