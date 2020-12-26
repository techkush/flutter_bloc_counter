
class BlocModel {
  BlocModel({this.counter = 0, this.verificationId = '', this.smsCode = ''});

  final int counter;
  final String verificationId;
  final String smsCode;

  BlocModel copyWith({
    int counter,
    String verificationId,
    String smsCode,
  }) {
    return BlocModel(
      counter: counter ?? this.counter,
      verificationId: verificationId ?? this.verificationId,
      smsCode: smsCode ?? this.smsCode,
    );
  }
}
