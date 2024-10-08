import 'package:flutter/material.dart';

extension StringValidation on BuildContext {
  Future<dynamic>push(Widget page){
    return Navigator.of(this).push(
        MaterialPageRoute(builder:(context) => page,)
    );
  }

  Future<dynamic>pushNamed(String routeName, {Object?arguments}){
    return Navigator.of(this).pushNamed(routeName,arguments:arguments);
  }

  Future<dynamic>pushReplacementNamed(String routeName, {Object?arguments}){
    return Navigator.of(this).pushReplacementNamed(routeName,arguments:arguments);
  }
  Future<dynamic>pushNamedAndRemoveUntil(String routeName, {Object?arguments,required RoutePredicate predicate}){
    return Navigator.of(this).pushNamedAndRemoveUntil(routeName,predicate,arguments:arguments);
  }
  void pop() => Navigator.of(this).pop();

  void popWithArguments({Object?arguments}) => Navigator.of(this).pop(arguments);
}