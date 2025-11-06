import 'package:flutter/material.dart';
import 'tampil_data.dart';

class FormDataPage extends StatefulWidget {
  const FormDataPage({super.key});

  @override
  State<FormDataPage> createState() => _FormDataPageState();
}

class _FormDataPageState extends State<FormDataPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaC = TextEditingController();
  final _nimC = TextEditingController();
  final _tahunLahirC = TextEditingController();

  @override
  void dispose() {
    _namaC.dispose();
    _nimC.dispose();
    _tahunLahirC.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final nama = _namaC.text.trim();
    final nim = _nimC.text.trim();
    final tahun = int.parse(_tahunLahirC.text.trim());
    final nowYear = DateTime.now().year;
    final umur = (tahun <= nowYear) ? (nowYear - tahun) : 0;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) =>
            TampilDataPage(nama: nama, nim: nim, tahunLahir: tahun, umur: umur),
      ),
    );
  }

  InputDecoration _dec(String label) => InputDecoration(labelText: label);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Input Data')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _namaC,
                decoration: _dec('Nama'),
                textInputAction: TextInputAction.next,
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Nama wajib' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _nimC,
                decoration: _dec('NIM'),
                textInputAction: TextInputAction.next,
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'NIM wajib' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _tahunLahirC,
                decoration: _dec('Tahun Lahir'),
                keyboardType: TextInputType.number,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return 'Tahun lahir wajib';
                  }
                  final n = int.tryParse(v);
                  final yr = DateTime.now().year;
                  if (n == null || n < 1900 || n > yr) {
                    return 'Masukkan tahun yang valid (1900–$yr)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 36,
                  child: ElevatedButton(
                    onPressed: _submit,
                    child: const Text('Simpan'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
