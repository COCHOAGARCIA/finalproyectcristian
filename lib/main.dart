import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//ENTREGADO POR CRISTIAN FELIPE OCHOA GARCIA

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueGrey, // Color primario de la aplicación
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            fontSize: 16.0, // Tamaño de fuente predeterminado
            color: Colors.black, // Color de fuente predeterminado
          ),
        ),
      ),
      home: const NavigationExample(),
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

enum MonedaCambio {dolar, euro, peso }
enum MonedaCambiar {dolar, euro, peso }

//Variables fijas para el aplicativo de calcular notas
enum SingingCharacter {matematica, quimica, programacion }
TextEditingController nota1 = TextEditingController();
TextEditingController nota2 = TextEditingController();
TextEditingController nota3 = TextEditingController();
TextEditingController nota4 = TextEditingController();
TextEditingController nota = TextEditingController();

TextEditingController cantidadCambiar = TextEditingController();
TextEditingController cantidadCambiada = TextEditingController();

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;
  double fontSize = 14.6;

  //Aplicativo de calcular promedio de nota
  SingingCharacter? _materias = SingingCharacter.quimica;
  static const String notaFinal = 'Nota final';
  bool nota1Vacia = false;
  bool nota2Vacia = false;
  bool nota3Vacia = false;
  bool nota4Vacia = false;

  //Aplicativo de casa de cambio
  MonedaCambio? _moneda = MonedaCambio.dolar;
  MonedaCambiar? _monedaCambiar = MonedaCambiar.dolar;
  bool cambio = false;

  //Aplicativo de tienda
  List<bool> entradas = [false, false, false];
  List<bool> proteina = [false, false, false];
  List<bool> carbohidrato = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proyecto final Cristian Ochoa'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        titleTextStyle: Theme.of(context).textTheme.headline6,
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.blueGrey[300],
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.school),
            label: 'Calcular Nota',
          ),
          NavigationDestination(
            icon: Icon(Icons.calculate),
            label: 'Convertir moneda',
          ),
          NavigationDestination(
            icon: Icon(Icons.local_convenience_store_rounded),
            label: 'Tienda',
          ),
        ],
      ),
      body: <Widget>[
        Container( //Inicio de aplicativo para calcular nota
          child: Align(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'Seleccione la materia a calificar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Radio<SingingCharacter>(
                      value: SingingCharacter.quimica,
                      groupValue: _materias,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _materias = value;
                        });
                      },
                    ),
                    const Text('Quimica'),
                    Radio<SingingCharacter>(
                      value: SingingCharacter.matematica,
                      groupValue: _materias,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _materias = value;
                        });
                      },
                    ),
                    const Text('Matematica'),
                    Radio<SingingCharacter>(
                      value: SingingCharacter.programacion,
                      groupValue: _materias,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _materias = value;
                        });
                      },
                    ),
                    const Text('Programación'),
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: TextField(
                    controller: nota1,
                    obscureText: false,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^([0-5](\.\d{0,2})?)?$')),
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Ingrese la primer nota.",
                      errorText: nota1Vacia? 'Este campo no puede estar vacio o ser mayor a 5' : null,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: TextField(
                    controller: nota2,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^([0-5](\.\d{0,2})?)?$')),
                    ],
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Ingrese la segunda nota.",
                      errorText: nota2Vacia? 'Este campo no puede estar vacio o ser mayor a 5' : null,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: TextField(
                    controller: nota3,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^([0-5](\.\d{0,2})?)?$')),
                    ],
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Ingrese la tercer nota.",
                      errorText: nota3Vacia? 'Este campo no puede estar vacio o ser mayor a 5' : null,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: TextField(
                    controller: nota4,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^([0-5](\.\d{0,2})?)?$')),
                    ],
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Ingrese la cuarta nota.",
                      errorText: nota4Vacia? 'Este campo no puede estar vació o ser mayor a 5' : null,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: TextField(
                    obscureText: false,
                    textAlign: TextAlign.center,
                    enabled: false,
                    controller: nota,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: notaFinal,
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xFF0D47A1),
                                Color(0xFF1976D2),
                                Color(0xFF42A5F5),
                              ],
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.all(16.0),
                          textStyle: const TextStyle(fontSize: 20.0),
                        ),
                        onPressed: () {
                          String materiaCalificar = "";
                          nota.clear();
                          // Verifica si los campos están vacíos
                          nota1Vacia = nota1.text.isEmpty || double.parse(nota1.text) > 5;
                          nota2Vacia = nota2.text.isEmpty || double.parse(nota2.text) > 5;
                          nota3Vacia = nota3.text.isEmpty || double.parse(nota3.text) > 5;
                          nota4Vacia = nota4.text.isEmpty || double.parse(nota4.text) > 5;
                          // Si alguno de los campos está vacío, muestra un mensaje de error
                          setState(() {});
                          if (!nota1Vacia || !nota2Vacia || !nota3Vacia || !nota4Vacia) {
                            switch(_materias) {
                              case SingingCharacter.matematica:
                                materiaCalificar = "Matematicas";
                                break;
                              case SingingCharacter.quimica:
                                materiaCalificar = "Quimica";
                                break;
                              case SingingCharacter.programacion:
                                materiaCalificar = "Programacion";
                                break;
                              case null:
                              // TODO: Handle this case.
                            }
                            double promedio = _calcularNota(double.parse(nota1.text), double.parse(nota2.text), double.parse(nota3.text), double.parse(nota4.text));
                            nota.text = promedio.toString();
                            if (promedio >= 3) {
                              mostrarAlerta(context, "El estudiante aprobo $materiaCalificar con una nota de $promedio");
                            } else {
                              mostrarAlerta(context, "El estudiante reprobo $materiaCalificar con una nota de $promedio");
                            }
                          }
                        },
                        child: const Text('Calcular'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ), //Fin de aplicación para calcular notas

        Container( //Inicio de aplicación para casa de cambio
          child: Align(
            child: Column(
              children: <Widget>[
                const Text(
                  'Calculadora para tasa de cambio',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                const Text(
                  'Seleccione la moneda que desea cambiar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Radio<MonedaCambio>(
                      value: MonedaCambio.dolar,
                      groupValue: _moneda,
                      onChanged: (MonedaCambio? value) {
                        setState(() {
                          _moneda = value;
                        });
                      },
                    ),
                    Text('Dolar'),
                    Radio<MonedaCambio>(
                      value: MonedaCambio.peso,
                      groupValue: _moneda,
                      onChanged: (MonedaCambio? value) {
                        setState(() {
                          _moneda = value;
                        });
                      },
                    ),
                    Text('Peso'),
                    Radio<MonedaCambio>(
                      value: MonedaCambio.euro,
                      groupValue: _moneda,
                      onChanged: (MonedaCambio? value) {
                        setState(() {
                          _moneda = value;
                        });
                      },
                    ),
                    Text('Euro'),
                  ],
                ),
                const Text(
                  'Seleccione la moneda por la cual desea cambiar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Radio<MonedaCambiar>(
                      value: MonedaCambiar.dolar,
                      groupValue: _monedaCambiar,
                      onChanged: (MonedaCambiar? value) {
                        setState(() {
                          _monedaCambiar = value;
                        });
                      },
                    ),
                    Text('Dolar'),
                    Radio<MonedaCambiar>(
                      value: MonedaCambiar.peso,
                      groupValue: _monedaCambiar,
                      onChanged: (MonedaCambiar? value) {
                        setState(() {
                          _monedaCambiar = value;
                        });
                      },
                    ),
                    Text('Peso'),
                    Radio<MonedaCambiar>(
                      value: MonedaCambiar.euro,
                      groupValue: _monedaCambiar,
                      onChanged: (MonedaCambiar? value) {
                        setState(() {
                          _monedaCambiar = value;
                        });
                      },
                    ),
                    Text('Euro'),
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: TextField(
                    obscureText: false,
                    controller: cantidadCambiar,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Ingrese la cantidad que desea cambiar',
                      errorText: cambio? 'Este campo no puede estar vació' : null,
                    ),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // Permite solo números
                    ],
                  ),
                ),
                 Expanded(
                  child: TextField(
                    obscureText: false,
                    enabled:false,
                    controller: cantidadCambiada,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Cantidad total del cambio',
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xFF0D47A1),
                                Color(0xFF1976D2),
                                Color(0xFF42A5F5),
                              ],
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.all(16.0),
                          textStyle: const TextStyle(fontSize: 20.0),
                        ),
                        onPressed: () {
                          String moneda = "";
                          String monedaACambiar = "";
                          cambio = cantidadCambiar.text.isEmpty;
                          cantidadCambiada.clear();
                          setState(() {});
                          if(!cambio) {
                            switch(_moneda) {
                              case MonedaCambio.peso:
                                moneda = "peso";
                                break;
                              case MonedaCambio.euro:
                                moneda = "euro";
                                break;
                              case MonedaCambio.dolar:
                                moneda = "dolar";
                                break;
                              case null:
                              // TODO: Handle this case.
                            }
                            switch(_monedaCambiar) {
                              case MonedaCambiar.peso:
                                monedaACambiar = "peso";
                                break;
                              case MonedaCambiar.euro:
                                monedaACambiar = "euro";
                                break;
                              case MonedaCambiar.dolar:
                                monedaACambiar = "dolar";
                                break;
                              case null:
                              // TODO: Handle this case.
                            }
                            double valorDelCambio = _calcularCambioMoneda(moneda, monedaACambiar, double.parse(cantidadCambiar.text));
                            cantidadCambiada.text = valorDelCambio.toString();
                          }
                        },
                        child: const Text('Calcular'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ), //Fin aplicación casa de cambio

        Container( //Inicio aplicación de ventas
          child:  Align(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'Bienvenido al restaurante de Cristian',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                const Text(
                  'Seleccione los ingredientes que desea incluir en su plato',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'Seleccione su entrada:',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Checkbox(
                      value: entradas[0],
                      onChanged: (bool? value) {
                        setState(() {
                          entradas[0] = value ?? false;
                        });
                      },
                    ),
                    Text('Empanadas'),
                    Checkbox(
                      value: entradas[1],
                      onChanged: (bool? value) {
                        setState(() {
                          entradas[1] = value ?? false;
                        });
                      },
                    ),
                    Text('Patacones'),
                    Checkbox(
                      value: entradas[2],
                      onChanged: (bool? value) {
                        setState(() {
                          entradas[2] = value ?? false;
                        });
                      },
                    ),
                    Text('Dedos de queso'),
                  ],
                ),
                const Text(
                  'Seleccione la proteina:',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Checkbox(
                      value: proteina[0],
                      onChanged: (bool? value) {
                        setState(() {
                          proteina[0] = value ?? false;
                        });
                      },
                    ),
                    Text('Pescado'),
                    Checkbox(
                      value: proteina[1],
                      onChanged: (bool? value) {
                        setState(() {
                          proteina[1] = value ?? false;
                        });
                      },
                    ),
                    Text('Pollo'),
                    Checkbox(
                      value: proteina[2],
                      onChanged: (bool? value) {
                        setState(() {
                          proteina[2] = value ?? false;
                        });
                      },
                    ),
                    Text('Carne'),
                  ],
                ),
                const Text(
                  'Seleccione el carbohidrato:',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Checkbox(
                      value: carbohidrato[0],
                      onChanged: (bool? value) {
                        setState(() {
                          carbohidrato[0] = value ?? false;
                        });
                      },
                    ),
                    Text('Papas al vapor'),
                    Checkbox(
                      value: carbohidrato[1],
                      onChanged: (bool? value) {
                        setState(() {
                          carbohidrato[1] = value ?? false;
                        });
                      },
                    ),
                    Text('Arroz'),
                    Checkbox(
                      value: carbohidrato[2],
                      onChanged: (bool? value) {
                        setState(() {
                          carbohidrato[2] = value ?? false;
                        });
                      },
                    ),
                    Text('Quinoa'),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xFF0D47A1),
                                Color(0xFF1976D2),
                                Color(0xFF42A5F5),
                              ],
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.all(16.0),
                          textStyle: const TextStyle(fontSize: 20.0),
                        ),
                        onPressed: () {
                          calcularPlato(entradas,proteina,carbohidrato,context);
                        },
                        child: const Text('Generar Pedido'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ][currentPageIndex],
    );
  }
}

double _calcularNota(double nota1, double nota2, double nota3, double nota4){
  double promedio = 0;
  promedio = (nota1 + nota2 + nota3 + nota4)/4;
  return promedio;
}

double _calcularCambioMoneda(String monedaParaCambiar, String monedaACambiar, double cantidad){
  double cambio = 0;
  const double euro = 4265;
  const double dolar = 3975;
  switch(monedaParaCambiar){
    case("dolar"):
      if(monedaACambiar == "dolar"){
        cambio = cantidad;
      } else if (monedaACambiar == "peso"){
        cambio =  cantidad * dolar;
      } else if (monedaACambiar == "euro") {
        cambio = cantidad * dolar;
        cambio = cambio / euro;
      }
      break;

    case("peso"):
      if(monedaACambiar == "dolar"){
        cambio = cantidad / dolar;
      } else if (monedaACambiar == "peso"){
        cambio = cantidad;
      } else if (monedaACambiar == "euro") {
        cambio = cantidad / euro;
      }
      break;

    case("euro"):
      if(monedaACambiar == "dolar"){
        cambio = cantidad * euro;
        cambio = cambio / dolar;
      } else if (monedaACambiar == "peso"){
        cambio = cantidad * euro;
      } else if (monedaACambiar == "euro") {
        cambio = cantidad;
      }
      break;
  }
  return cambio;
}

void calcularPlato(List<bool> entrada, List<bool> proteina, List<bool>carbohidrato, BuildContext context) {
  const List<double> entradasPrecios= [5000,5500,4000];
  const List<double> proteinasPrecios= [10000,4000,5700];
  const List<double> carbohidratoPrecios= [10000,4000,5700];
  double total = 0;
  String mensaje = "";
  for (int i = 0; i < entrada.length; i++) {
    bool isChecked = entrada[i];
    if(i == 0 && isChecked){
      total = total + entradasPrecios[i];
    }
    if(i == 1 && isChecked){
      total = total + entradasPrecios[i];
    }
    if(i == 2 && isChecked){
      total = total + entradasPrecios[i];
    }
  }
  for (int i = 0; i < proteina.length; i++) {
    bool isChecked = proteina[i];
    if(i == 0 && isChecked){
      total = total + proteinasPrecios[i];
    }
    if(i == 1 && isChecked){
      total = total + proteinasPrecios[i];
    }
    if(i == 2 && isChecked){
      total = total + proteinasPrecios[i];
    }
  }
  for (int i = 0; i < carbohidrato.length; i++) {
    bool isChecked = carbohidrato[i];
    if (i == 0 && isChecked) {
      total = total + carbohidratoPrecios[i];
    }
    if (i == 1 && isChecked) {
      total = total + carbohidratoPrecios[i];
    }
    if (i == 2 && isChecked) {
      total = total + carbohidratoPrecios[i];
    }
  }
  if (total > 0 ){
    mensaje = "Su plato tendra un costo de: $total";
  } else {
    mensaje = "Debe seleccionar por lo menos un producto para realizar el pedido";
  }
  mostrarAlerta(context, mensaje);
}

void mostrarAlerta(BuildContext context, String mensaje) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Row(
          children: <Widget>[
            Icon(Icons.info), // Agregar un icono al título
            SizedBox(width: 8), // Espacio entre el icono y el texto
            Text('Resultado'),
          ],
        ),
        content: Text(mensaje),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cerrar'),
          ),
        ],
      );
    },
  );
}