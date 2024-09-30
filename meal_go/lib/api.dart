const String url = 'https://api.openrouteservice.org/v2/directions/driving-car';
const String apiKey =
    '5b3ce3597851110001cf6248eacc124ac8304eb287ae9bb865a5ef1e';

getRouteurl(String start, String end) {
  return Uri.parse('$url?api_key=$apiKey&start=$start&end=$end');
}
