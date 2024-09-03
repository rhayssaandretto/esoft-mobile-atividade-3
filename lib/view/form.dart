import 'package:flutter/material.dart';

import '../model/contabancaria.dart';

class FormContaBancaria extends StatefulWidget {
  const FormContaBancaria({super.key});

  @override
  State<FormContaBancaria> createState() => _FormContaBancariaState();
}

class _FormContaBancariaState extends State<FormContaBancaria> {
  final TextEditingController _ctrlNome = TextEditingController();
  final TextEditingController _ctrlNumeroConta = TextEditingController();
  final TextEditingController _ctrlSald = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conta Bancária'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _ctrlNome,
                decoration: const InputDecoration(
                    labelText: 'Nome do titular', hintText: 'Meow Gatto'),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _ctrlNumeroConta,
                decoration: const InputDecoration(
                    labelText: 'Número da conta', hintText: '123456-7'),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _ctrlSald,
                decoration: const InputDecoration(
                    labelText: 'Saldo', hintText: '1000.00'),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            FloatingActionButton(
              child: const Icon(Icons.save),
              onPressed: () {
                final String nome = _ctrlNome.text;
                final String numeroConta = _ctrlNumeroConta.text;
                
                // Conversão segura para double
                final double? saldo = double.tryParse(_ctrlSald.text);

                if (saldo != null) {
                  final contaBancaria = ContaBancaria(nome, numeroConta, saldo);

                  // Retorna para a tela anterior com o objeto ContaBancaria
                  Navigator.pop(context, contaBancaria);
                } else {
                  // Exibe uma mensagem de erro caso o saldo não seja um número válido
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Por favor, insira um saldo válido.'),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
