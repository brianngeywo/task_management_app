import 'dart:math';

import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:task_management_app/project_model.dart';
import 'package:task_management_app/test_data.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          children: <Widget>[
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: Card(
                      color: Colors.white,
                      elevation: 0,
                      shape:
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "assets/images/top-bg.jpeg",
                          fit: BoxFit.cover,
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          colorBlendMode: BlendMode.darken,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      )),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Hello Brian",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: const Text(
                                "Let's find your next project",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                softWrap: true,
                              ),
                            ),
                            const CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(
                                "https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Card(
                  margin: const EdgeInsets.only(
                    top: 120,
                    left: 20,
                    right: 20,
                  ),
                  elevation: 10,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: const Icon(FeatherIcons.search),
                      hintText: "Search",
                      hintStyle: const TextStyle(color: Colors.grey),
                      suffix: Card(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        margin: const EdgeInsets.only(right: 15),
                        child: Image.asset("assets/icons/settings-sliders.png",
                            height: 22, width: 22),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  const Text(
                    "Projects",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "See All",
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: projects.map((e) => projectCard(e)).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  const Text(
                    "Tasks",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "See All",
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: sampleTasks.map((e) => taskCard(e)).toList(),
            )
          ],
        ),
      ),
    );
  }
}

Widget taskCard(String text) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListTile(
      leading: Checkbox(
        value: Random().nextBool(),
        onChanged: (value) {},
        activeColor: Colors.black,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: Colors.grey.shade700,
        ),
        softWrap: true,
      ),
      trailing: const CircleAvatar(
        radius: 5,
        backgroundColor: Colors.black,
      ),
    ),
  );
}

Widget projectCard(ProjectModel model) {
  return Container(
      height: model.isActive ? 240 : 220,
      width: 220,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: model.isActive ? Colors.black : Colors.grey.shade300,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey.shade300,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Image.asset(
                    model.image,
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              model.title,
              style: TextStyle(
                color: model.isActive ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 200,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                model.description,
                style: TextStyle(
                  color: model.isActive ? Colors.white : Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
                softWrap: true,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.0, top: 10),
            child: Row(
              children: [
                Spacer(),
                CircleAvatar(
                  radius: 17,
                  backgroundColor: model.isActive ? Colors.white : Colors.black,
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: model.isActive ? Colors.black : Colors.grey.shade300,
                      size: 17,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ));
}
