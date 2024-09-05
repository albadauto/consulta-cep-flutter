import 'dart:convert';

import 'package:consultagov/src/controllers/EnderecoController.dart';
import 'package:consultagov/src/models/Endereco.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnderecoPage extends StatefulWidget {
  final String CEP;
  const EnderecoPage({super.key, required this.CEP});

  @override
  State<EnderecoPage> createState() => _EnderecoPageState();
}

class _EnderecoPageState extends State<EnderecoPage> {
  final EnderecoController controller = new EnderecoController();
  _start() {
    return Container();
  }

  _success() {
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          var enderecos = controller.enderecos;
          return ListTile(
            title: Text(enderecos.bairro.toString()),
          );
        });
  }

  _error() {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            controller.start(widget.CEP);
          },
          child: Text('Tente novamente')),
    );
  }

  _loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  stateManegement(EnderecoState state) {
    switch (state) {
      case EnderecoState.start:
        return _start();
      case EnderecoState.loading:
        return _loading();
      case EnderecoState.error:
        return _error();
      case EnderecoState.success:
        return _success();
      default:
        return _start();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.start(widget.CEP);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: AnimatedBuilder(
          animation: controller.state,
          builder: (context, child) {
            return stateManegement(controller.state.value);
          },
        ));
  }
}
