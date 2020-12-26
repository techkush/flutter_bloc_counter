import 'dart:async';

import 'package:blocpattern/bloc_model.dart';

import 'bloc_provider.dart';

class BlocEngine extends BlocBase {
  BlocModel _model = BlocModel();

  final StreamController<BlocModel> _modelController =
      StreamController<BlocModel>();

  Sink<BlocModel> get _inAdd => _modelController.sink;
  Stream<BlocModel> get modelStream => _modelController.stream;

  void dispose() {
    _modelController.close();
  }

  void setCounter(String hello){
    _updateWith(counter: _model.counter + 1);
    print(hello);
  }

  // ---------------------------------------------------------------------------

  void _updateWith({int counter, String verificationId, String smsCode}) {
    _model = _model.copyWith(
        counter: counter, verificationId: verificationId, smsCode: smsCode);
    _inAdd.add(_model);
  }
}
