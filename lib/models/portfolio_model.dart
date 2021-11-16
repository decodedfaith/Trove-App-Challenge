
class Portfolio {
  Portfolio({
    required this.symbol,
    required this.totalQuantity,
    required this.equityValue,
    required this.pricePerShare,
  });
  late final String symbol;
  late final dynamic totalQuantity;
  late final dynamic equityValue;
  late final dynamic pricePerShare;
  
  Portfolio.fromJson(Map<String, dynamic> json){
    symbol = json['symbol'];
    totalQuantity = json['totalQuantity'];
    equityValue = json['equityValue'];
    pricePerShare = json['pricePerShare'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['symbol'] = symbol;
    _data['totalQuantity'] = totalQuantity;
    _data['equityValue'] = equityValue;
    _data['pricePerShare'] = pricePerShare;
    return _data;
  }
}