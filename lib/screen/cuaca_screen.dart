import 'package:intl/intl.dart';
import 'package:uas_iffan_cuaca/provider/cuaca_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  CuacaProvider cuacaProvider = CuacaProvider();

  @override
  Widget build(BuildContext context) {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('MMMM dd, yyyy').format(now); // Menambahkan Nama Bulan, Tanggal, dan Tahun
  String dayOfWeek = DateFormat('EEEE').format(now);


    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Image.network(
            'https://cdn.pixabay.com/photo/2021/01/25/18/38/storm-5949243_1280.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Consumer<CuacaProvider>(
            builder: (context, provider, child) {
              return Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: provider.cityNameText,
                      decoration: const InputDecoration(
                        hintText: "Masukkan Nama Kota",
                        hintStyle: TextStyle(color: Colors.white),
                        labelText: "Nama Kota",
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                      ),
                      onPressed: () {
                        provider.showWeatherData();
                      },
                      child: const Text(
                        "Tampilkan Data Cuaca",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      provider.cuacaModel.name ?? "Waiting Data",
                      style: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$dayOfWeek, $formattedDate",
                          style: const TextStyle(
                            fontSize: 20,
                  
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${provider.cuacaModel.main?.temp?.toStringAsFixed(0)}\u00B0c",
                          style: const TextStyle(
                            fontSize: 100,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "- - - - - - - - - - - - - - -",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      provider.cuacaModel.weather?.first.main ?? "Waiting data",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "${provider.cuacaModel.main?.tempMin?.toStringAsFixed(0)}°c",
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const TextSpan(
                                text: "/",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "${provider.cuacaModel.main?.tempMax?.toStringAsFixed(0)}°c",
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
