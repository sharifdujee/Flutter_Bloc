import 'package:http/http.dart' as http;
import 'dart:convert';

const String BASE_URL = 'https://www.prothomalo.com/';
class NewsPaperService{

  static Future<dynamic> getNews() async{
    try{
      var response = await http.get(Uri.parse('${BASE_URL}/world'),
      );
     /* if(response.statusCode==200){
        var jsonData= json.decode(response.body);
        print('the json response is ${jsonData}');

      }*/
      print('the api response is ${response.body}');
      return response;

    }
    on Exception catch(e){
      print(e.toString());
    }
  }

}