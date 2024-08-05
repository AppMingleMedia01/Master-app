

import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final bool addOpacity;

  const Loader({
    super.key,
    this.addOpacity = true,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => true,
        child: Material(
          type: MaterialType.transparency,
          color: Colors.white,
          child: Stack(
            children: [
              if (addOpacity)
                const Opacity(
                  opacity: 0.65,
                  child: ModalBarrier(dismissible: false, color: Colors.white),
                ),
              appLoader
            ],
          ),
        ));
  }

  Widget get appLoader {
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 20),
        child: const CircularProgressIndicator());
  }
}
