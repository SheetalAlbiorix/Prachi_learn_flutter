import 'dart:collection';

import 'package:flutter/material.dart';

enum CarType { sedan, suv, truck, hatchback }

class CarSelectionApp extends StatefulWidget {
  @override
  _CarSelectionAppState createState() => _CarSelectionAppState();
}

class _CarSelectionAppState extends State<CarSelectionApp> {
  CarType? selectedCarType;
  final Map<CarType, Set<String>> carModels = {
    CarType.sedan: {
      'Maruti Dzire',
      'Hyundai Verna',
      'Hyundai Aura',
      'Honda Amaze'
    },
    CarType.suv: {
      'Mahindra Scorpio N',
      'Tata Punch',
      'Toyota Fortuner',
      'Thar ROXX'
    },
    CarType.truck: {
      'Chevrolet Silverado',
      'Ashok Leyland',
      'Eicher',
      'Ford F-150'
    },
    CarType.hatchback: {
      'Maruti Swift',
      'Maruti Baleno',
      'Maruti Wagon R',
      'MG EV'
    },
  };

  Set<String> selectedModels = {};
  Queue<String> selectedModelsQueue = Queue<String>();

  void addModel(String model) {
    setState(() {
      if (!selectedModels.contains(model)) {
        selectedModels.add(model);
        selectedModelsQueue.addLast(model);
        carModels[selectedCarType]!.remove(model);
      }
    });
  }

  void removeModel(String model) {
    setState(() {
      selectedModels.remove(model);
      selectedModelsQueue.remove(model);
      if (selectedCarType != null) {
        carModels[selectedCarType]!.add(model);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Car Selection')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Car Type:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: CarType.values.map((CarType type) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedCarType = type;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedCarType == type
                            ? Colors.pink
                            : Colors.grey[150],
                        foregroundColor: selectedCarType == type
                            ? Colors.grey[100]
                            : Color.fromARGB(255, 86, 54, 160),
                      ),
                      child:
                          Text(type.toString().split('.').last.toUpperCase()),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 16),
            if (selectedCarType != null) ...[
              Text(
                'Available Models: (${carModels[selectedCarType]!.length} models)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              if (carModels[selectedCarType]!.isEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'No models available',
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
                )
              else
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    childAspectRatio: 2.5,
                  ),
                  itemCount: carModels[selectedCarType]!.length,
                  itemBuilder: (context, index) {
                    String model = carModels[selectedCarType]!.elementAt(index);
                    return Card(
                      color: Colors.orange[100],
                      child: ListTile(
                        title: Text(model, textAlign: TextAlign.center),
                        trailing: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () => addModel(model),
                        ),
                      ),
                    );
                  },
                ),
            ],
            Divider(),
            Text('Selected Models: (${selectedModels.length} selected)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            if (selectedModels.isNotEmpty)
              Expanded(
                child: SingleChildScrollView(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                      childAspectRatio: 2.5,
                    ),
                    itemCount: selectedModels.length,
                    itemBuilder: (context, index) {
                      String model = selectedModels.elementAt(index);

                      return Card(
                        color: Colors.brown[200],
                        child: ListTile(
                          title: Text(model, textAlign: TextAlign.center),
                          trailing: IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () => removeModel(model),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            else
              Text(
                'No Models Selected',
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
