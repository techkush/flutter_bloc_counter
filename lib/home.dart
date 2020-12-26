import 'package:blocpattern/bloc.dart';
import 'package:blocpattern/bloc_model.dart';
import 'package:blocpattern/bloc_provider.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final BlocEngine _controller = BlocProvider.of<BlocEngine>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC Pattern'),
      ),
      body: StreamBuilder<BlocModel>(
          stream: _controller.modelStream,
          initialData: BlocModel(),
          builder: (BuildContext context, AsyncSnapshot<BlocModel> snapshot) {
            return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text('${snapshot.data.counter}'),
                      SizedBox(
                        height: 10,
                      ),
                      RaisedButton(
                        child: Text('+'),
                        onPressed: (){
                          _controller.setCounter('Done!');
                        },
                      ),
                      Text('I\'m text')
                    ],
                  ),
                ));
          }),
    );
  }
}
