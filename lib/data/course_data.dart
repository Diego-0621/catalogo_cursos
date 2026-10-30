// Lista tipada: cada elemento es un Map (clave: texto, valor: cualquier tipo)
final List<Map<String, dynamic>> listaCursos = [
  {
    'nombre': 'Introducción a Flutter',
    'docente': 'Laura Gómez',
    'duracion': 40,        // número entero (horas)
    'nivel': 'Básico',
    'certificado': false,   // booleano
  },
  {
    'nombre': 'Bases de Datos con SQL',
    'docente': 'Carlos Ramírez',
    'duracion': 60,
    'nivel': 'Intermedio',
    'certificado': true,
  },
  {
    'nombre': 'Big Data con Spark',
    'docente': 'Marta Rojas',
    'duracion': 80,
    'nivel': 'Avanzado',
    'certificado': false,
  },
  {
    'nombre': 'Business Intelligence con Power BI',
    'docente': 'Andrés Pérez',
    'duracion': 50,
    'nivel': 'Intermedio',
    'certificado': true,
  },
];

// Función asíncrona que simula una consulta a un servidor
Future<List<Map<String, dynamic>>> obtenerCursos() async {
  await Future.delayed(const Duration(seconds: 5)); // espera 2 segundos
  return listaCursos;
}