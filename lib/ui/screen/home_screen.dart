import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;


  void _increment()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    counter++;
    sp.setInt("count", counter);
    setState(() {});
  }

  void _decrement()async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    counter--;
    sf.setInt("count", counter);
    setState(() {});
  }

  void _getData()async{
    SharedPreferences sm = await SharedPreferences.getInstance();
    int storeValue = sm.getInt("count") ?? 0;
    counter = storeValue;
    setState(() {});
  }


  @override
  void initState() {
    _getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
        title: const Text("Shared Preference Example"),
        centerTitle: true,
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Count: $counter",style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: _decrement,
                    child: const Text("-")
                ),
                const SizedBox(width: 5),
                ElevatedButton(
                    onPressed: _increment,
                    child: const Text("+")
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
