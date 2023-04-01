class Historical {
  String? date;
  dynamic open;
  dynamic high;
  dynamic low;
  dynamic close;
  dynamic volume;

  Historical({
    this.date,
    this.open,
    this.high,
    this.low,
    this.close,
    this.volume,
  });

  Historical.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    open = json['open'];
    high = json['high'];
    low = json['low'];
    close = json['close'];

    volume = json['volume'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['open'] = open;
    data['high'] = high;
    data['low'] = low;
    data['close'] = close;
    data['volume'] = volume;
    return data;
  }
}
