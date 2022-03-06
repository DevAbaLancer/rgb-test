import 'package:flutter/material.dart';
import 'package:rgb_test/model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Model> modelList = [Model('Light', false), Model('Fan', false)];

  List<Model> newList = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
          title: const Text('Tabs Demo'),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
              itemCount: modelList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      modelList[index].isSelected =
                          !modelList[index].isSelected;
                      if (modelList[index].isSelected == true) {
                        newList.add(modelList[index]);
                        print(newList[index].name);
                      } else {
                        newList.remove(modelList[index]);
                        print('removed');
                      }
                    });
                  },
                  child: Card(
                    child: GridTile(
                      child: Text(modelList[index].name),
                      //just for testing, will fill with image later
                    ),
                  ),
                );
              },
            ),
            GridView.builder(
              itemCount: newList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: GridTile(
                    child: Text(newList[index].name),
                    //just for testing, will fill with image later
                  ),
                );
              },
            ),
            const Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
