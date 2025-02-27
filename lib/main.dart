import 'package:flutter/material.dart';
import 'dog_image_service.dart';
import 'dog_image_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dog Image App',
      theme: ThemeData(primarySwatch: Colors.brown),
      home: DogImageScreen(),
    );
  }
}

class DogImageScreen extends StatefulWidget {
  const DogImageScreen({super.key});

  @override
  _DogImageScreenState createState() => _DogImageScreenState();
}

class _DogImageScreenState extends State<DogImageScreen> {
  final DogImageService _dogImageService = DogImageService();
  DogImage? _dogImage;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchDogImage();
  }

  Future<void> _fetchDogImage() async {
    setState(() {
      _isLoading = true;
    });
    _dogImage = await _dogImageService.fetchDogImage();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(
          'Cachorro cururu',
          style: TextStyle(color: Colors.yellowAccent),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _isLoading
                ? CircularProgressIndicator(color: Colors.brown)
                : _dogImage != null
                ? Image.network(_dogImage!.url)
                : Text('Deu errado ó'),
            SizedBox(height: 20),
            FloatingActionButton(
              backgroundColor: Colors.brown,
              onPressed: _fetchDogImage,
              child: Icon(Icons.refresh, color: Colors.yellowAccent),
            ),
          ],
        ),
      ),
    );
  }
}
