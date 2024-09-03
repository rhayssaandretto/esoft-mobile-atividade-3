import 'package:atividade_0209/model/contabancaria.dart';
import 'package:atividade_0209/view/form.dart';
import 'package:flutter/material.dart';

class ListContaBancaria extends StatefulWidget {
  final List<ContaBancaria> _contaBancaria = [];

  ListContaBancaria({super.key});

  @override
  State<ListContaBancaria> createState() => _ListContaBancariaState();
}

class _ListContaBancariaState extends State<ListContaBancaria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contas Bancárias'),
      ),
      body: ListView.builder(
        itemCount: widget._contaBancaria.length,
        itemBuilder: (context, index) {
          final contaBancaria = widget._contaBancaria[index];
          return ItemContaBancaria(contaBancaria);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const FormContaBancaria();
          })).then((contaBancaria) {
            if (contaBancaria != null) {
              setState(() {
                widget._contaBancaria.add(contaBancaria);
              });
            }
          });
        },
      ),
    );
  }
}

class ItemContaBancaria extends StatelessWidget {
  final ContaBancaria _contaBancaria;
  
  const ItemContaBancaria(this._contaBancaria, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(_contaBancaria.nome),
        subtitle: Text(_contaBancaria.numeroConta),
        trailing: Text(_contaBancaria.saldo.toString()),
      ),
    );
  }
}
