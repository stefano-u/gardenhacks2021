import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterinit/constants.dart';
import 'package:flutterinit/models/plant.dart';
import 'package:flutterinit/pages/owned_plant_page.dart';

class OwnedPlantButton extends StatelessWidget {
  /// Text to show on button

  final Plant plant;

  OwnedPlantButton({
    required this.plant,
  });

  void onPlantInfoButtonPressed(BuildContext context, Plant selectedPlant) async {
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => OwnedPlantPageWidget(
          plant: selectedPlant,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 250,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => this.onPlantInfoButtonPressed,
          child: Stack(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                  child: Text(
                    plant.name,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 40.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  plant.photoCard,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15)),
            shadowColor: MaterialStateProperty.all<Color>(Colors.grey.withOpacity(0.3)),
            backgroundColor: MaterialStateProperty.all<Color>(CustomColorScheme.primaryColorSand),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: CustomColorScheme.grey),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
