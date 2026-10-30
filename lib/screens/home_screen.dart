import 'package:flutter/material.dart';
import '../data/course_data.dart';

// StatefulWidget porque la pantalla cambia: primero carga, luego muestra la lista
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _cargando = true;                 // ¿estamos cargando?
  List<Map<String, dynamic>> _cursos = []; // aquí guardaremos los cursos

  // initState se ejecuta una sola vez, al abrir la pantalla
  @override
  void initState() {
    super.initState();
    _cargarCursos();
  }

  // Pide los datos y actualiza la pantalla cuando llegan
  Future<void> _cargarCursos() async {
    final datos = await obtenerCursos(); // espera los 2 segundos

    if (!mounted) return; // por seguridad, si la pantalla ya se cerró no hace nada

    setState(() {
      _cursos = datos;
      _cargando = false; // ya terminó la carga
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Cursos'),
        centerTitle: true,
        backgroundColor: Colors.red.shade900,
        foregroundColor: Colors.white,
      ),
      body: _cargando
          ? const Center(
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Image(
        image: AssetImage('assets/images/logo.png'),
        width: 150,
      ),
      SizedBox(height: 24),
      CircularProgressIndicator(),
      SizedBox(height: 16),
      Text('Cargando cursos...'),
    ],
  ),
)
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _cursos.length,
              itemBuilder: (context, index) {
                final curso = _cursos[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: const Icon(Icons.school, color:Color.fromARGB(255, 129, 0, 0), size: 36),
                    title: Text(
                      curso['nombre'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Docente: ${curso['docente']}\n'
                      'Duración: ${curso['duracion']} horas\n'
                      'Nivel: ${curso['nivel']}',
                    ),
                    isThreeLine: true,
                    trailing: Icon(
                      curso['certificado'] ? Icons.verified : Icons.cancel,
                      color: curso['certificado'] ? const Color.fromARGB(255, 128, 0, 0) : const Color.fromARGB(255, 5, 5, 5),
                    ),
                  ),
                );
              },
            ),
    );
  }
}