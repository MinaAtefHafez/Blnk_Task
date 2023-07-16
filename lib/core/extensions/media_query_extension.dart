



import 'package:flutter/widgets.dart';

extension MQ on BuildContext {
    double width (context) => MediaQuery.of(context).size.width ; 
    double height (context) => MediaQuery.of(context).size.height ; 
}