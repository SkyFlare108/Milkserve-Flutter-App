class FeedbackForm{
  String _nameo;
  String _given;
  String _datee;

  FeedbackForm(this._nameo, this._given, this._datee);

  String toParams() => "?nameo=$_nameo&given=$_given&datee=$_datee";
}