import 'package:consultagov/src/models/Endereco.dart';
import 'package:consultagov/src/repository/EnderecoRespository.dart';
import 'package:flutter/cupertino.dart';

class EnderecoController{
  EnderecoModel enderecos = new EnderecoModel();
  final repository = EnderecoRepository();
  final state = ValueNotifier<EnderecoState>(EnderecoState.start);
  Future start(String cep) async{
    state.value = EnderecoState.loading;
    try{
      enderecos = await repository.fetchEnderecos(cep);
      state.value = EnderecoState.success;
    }catch(e){
      print("Erro: $e");
      state.value = EnderecoState.error;
    }
  }
}

enum EnderecoState{
  start, loading, success, error;
}