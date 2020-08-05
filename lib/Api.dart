import 'package:http/http.dart' as http;

const baseurl =
    "http://192.168.112.200:2845/api/pedido/TAgendamento/ListarConcorrentes";

class Api {
  static Future getConcorrente() async {
    var url = baseurl;
    return await http.get(url);
  }
}
