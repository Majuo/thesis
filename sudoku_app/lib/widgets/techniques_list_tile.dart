import 'package:flutter/material.dart';

class TechniquesListTile extends StatelessWidget {
  static double tileWidth = 250;
  static const double tileHeight = 80;
  static const double tilePadding = 5;

  const TechniquesListTile({super.key, required this.onTapHandler, required this.imageAssetPath, required this.techniqueName});
  final VoidCallback onTapHandler;
  final String imageAssetPath;
  final String techniqueName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(tilePadding),
      child: GestureDetector(
        onTap: () {
          onTapHandler();
        },
        child: SizedBox(
          width: tileWidth,
          height: tileHeight,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
              border: Border.all(
                color: Theme.of(context).primaryColorDark
              ),
              borderRadius: const BorderRadius.all(Radius.circular(3))
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColorDark
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(3))
                    ),
                    child: Image.asset(imageAssetPath),
                  ),
                ),
                Expanded(
                  child: Padding(padding: const EdgeInsets.symmetric(horizontal: 5), child: Text(techniqueName))
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}