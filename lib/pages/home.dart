import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Homepage"),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Text(
            //   "Value is $count",
            //   style: TextStyle(color: Colors.amber),
            // ),
            // Container(
            //   height: 200,
            //   width: 200,
            //   decoration: BoxDecoration(
            //     color: Colors.amber,
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 10),
            //   child: ElevatedButton(
            //       onPressed: () {
            //         setState(() {
            //           count++;
            //         });
            //       },
            //       child: Text("Increase")),
            // ),
            // Container(
            //   height: 150,
            //   width: 500,
            //   color: Colors.white,
            //   child: Stack(
            //     children: [
            //       Container(
            //         height: 100,
            //         width: 500,
            //         decoration: BoxDecoration(color: Colors.black12),
            //       ),
            //       Positioned(
            //         bottom: 25,
            //         child: Container(
            //           height: 30,
            //           width: 50,
            //           decoration: BoxDecoration(color: Colors.blue),
            //         ),
            //       )
            //     ],
            //   ),
            // )

            Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.black26,
                ),
                Positioned(
                  bottom: -50,
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
