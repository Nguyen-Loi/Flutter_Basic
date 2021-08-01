import 'dart:convert';
import 'package:http/http.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
const ApiKey = '1749E08F-0500-4D3A-A911-35F657A2AC59';
const LinkUrl = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  Future getCointData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    for (String cryp in cryptoList) {
      String url = '$LinkUrl/$cryp/$selectedCurrency?apikey=$ApiKey';
      Response reponse = await get(Uri.parse(url));
      if (reponse.statusCode == 200) {
        var decodeData = jsonDecode(reponse.body);
        double price = decodeData['rate'];
        cryptoPrices[cryp] = price.toStringAsFixed(8);
      } else {
        print(reponse.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}
