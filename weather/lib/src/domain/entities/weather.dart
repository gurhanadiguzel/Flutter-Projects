class Weather {
  final String lat;
  final String lon;
  final String condition;

  Weather(this.lat, this.lon, this.condition);

  Weather.fromJson(Map<String, dynamic> json)
      : lat = json['coord']['lat'].toString(),
        lon = json['coord']['lon'].toString(),
        condition = json['weather'][0]['main'];

  @override
  String toString() {
    return ' where  $lat : $lon is $condition';
  }
}
