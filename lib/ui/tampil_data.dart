import 'package:flutter/material.dart';

class TampilDataPage extends StatelessWidget {
  final String nama;
  final String nim;
  final int tahunLahir;
  final int umur;

  const TampilDataPage({
    super.key,
    required this.nama,
    required this.nim,
    required this.tahunLahir,
    required this.umur,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perkenalan')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          'Nama saya $nama, NIM $nim,\n'
          'dan umur saya adalah $umur tahun',
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
