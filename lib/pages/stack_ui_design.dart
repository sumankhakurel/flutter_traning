import 'package:demo2/widgets/profilecard.dart';
import 'package:flutter/material.dart';

class StackUiDesign extends StatelessWidget {
  const StackUiDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 200,
                    color: Colors.blue,
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome back,',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  'Samantha William',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            //Spacer(),
                            Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.topRight,
                              children: [
                                Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                ),
                                Positioned(
                                  top: -3,
                                  right: -3,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red),
                                    child: Text(
                                      "1",
                                      style: TextStyle(
                                          fontSize: 11, color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Office News',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -75,
                    child: Container(
                      height: 150,
                      // width: 400,
                      width: MediaQuery.of(context).size.width - 50,
                      decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 75,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Main Menu',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MenuCard(
                      title: 'Management\nEmployees & Leave',
                      color: Colors.blue,
                      icon: Icons.person,
                    ),
                    MenuCard(
                      title: 'Claims & Salaries\nEmployee',
                      color: Colors.yellow,
                      icon: Icons.money,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MenuCard(
                      title: 'Program\nTraining',
                      color: Colors.orange,
                      icon: Icons.bar_chart,
                    ),
                    MenuCard(
                      title: 'System\nRecruitment',
                      color: Colors.teal,
                      icon: Icons.group_add,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
