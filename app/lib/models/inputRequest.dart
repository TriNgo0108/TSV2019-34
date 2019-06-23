class InputRequest {
    final String testMethod;
    final List<String> combinations;
    final int quantity;

  InputRequest({this.testMethod, this.combinations, this.quantity});

  factory InputRequest.fromJson(Map<String,dynamic> json){
    var list = json["combinations"];
    List<String> combinationsList = list.cast<String>();

    return new InputRequest(
      testMethod: json["testMethod"],
      combinations: combinationsList,
      quantity: json["quantity"]
    );
  }
    
}