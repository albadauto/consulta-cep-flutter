import 'package:consultagov/src/models/Endereco.dart';
import 'package:dio/dio.dart';

class EnderecoRepository{
  final dio = Dio();
  final url = 'https://viacep.com.br/ws';
  Future<EnderecoModel> fetchEnderecos(String CEP) async{
    final url_completa = '$url/$CEP/json/';
    final response = await dio.get(url_completa);
    final endereco = EnderecoModel.fromJson(response.data);
    return endereco;
  }
}