import 'package:flutter/material.dart';
import 'package:funny_macro/Constants/style.dart';
import 'package:lottie/lottie.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Widget> macroFunctionButton = [
      MacroButton(
        animation: "assets/lottie/war.json",
      ),
      MacroButton(
        animation: "assets/lottie/key_press.json",
      ),
    ];
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: size.height * 1,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height * 0.2,
                color: Colors.orange,
                child: Center(child: Text("User Detay")),
              ),
              SizedBox(height: kDefaultPadding * 2),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Container(
                  width: size.width,
                  height: size.height * 0.5,
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: kDefaultPadding,
                        crossAxisSpacing: kDefaultPadding,
                      ),
                      itemCount: macroFunctionButton.length,
                      itemBuilder: (BuildContext context, index) {
                        return Center(
                          child: macroFunctionButton[index],
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MacroButton extends StatefulWidget {
  final String animation;

  MacroButton({
    Key? key,
    required this.animation,
  }) : super(key: key);

  @override
  State<MacroButton> createState() => _MacroButtonState();
}

class _MacroButtonState extends State<MacroButton>
    with TickerProviderStateMixin {
  void Function()? onTap;
  bool _isActive = false;
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        (_isActive) ? _controller.stop() : _controller.forward();
        _isActive = !_isActive;
        onTap;
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
            color: (_isActive) ? kPrimaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: kPrimaryColor, width: 2)),
        child: Center(
          child: Lottie.asset(
            widget.animation,
            controller: _controller,
            repeat: true,
            reverse: true,
            onLoaded: (composition) {
              _controller.duration = composition.duration;
            },
          ),
        ),
      ),
    );
  }
}
