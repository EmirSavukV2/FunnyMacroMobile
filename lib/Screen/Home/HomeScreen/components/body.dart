import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:lottie/lottie.dart';

import 'package:funny_macro/Constants/style.dart';

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
      MacroButton(
        animation: "assets/lottie/war.json",
      ),
      MacroButton(
        animation: "assets/lottie/key_press.json",
      ),
    ];

    List<Widget> itemSlotRadio = [
      ItemSlotTile(title: "Slot 1"),
      ItemSlotTile(title: "Slot 2"),
      ItemSlotTile(title: "Slot 3"),
      ItemSlotTile(title: "Slot 4"),
      ItemSlotTile(title: "Slot 5"),
      ItemSlotTile(title: "Slot 5"),
      ItemSlotTile(title: "Slot 5"),
      ItemSlotTile(title: "Slot 5"),
    ];
    int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 50;
    bool _timerEnd = false;
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: size.height * 1,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: Column(
              children: [
                Container(
                  height: size.height * 0.2,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: kPrimaryColor,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: ListTile(
                              leading: Container(
                                width: 50,
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            const Radius.circular(14)),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/funny_logo.png"))),
                                  ),
                                ),
                              ),
                              title: const Text("Emir Savuk"),
                              subtitle: const Text("emirsvk55@gmail.com"),
                            ),
                          ),
                          const Expanded(
                            child: ListTile(
                              title: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text("Last Login")),
                              subtitle: Align(
                                  alignment: Alignment.centerRight,
                                  child: const Text("12.34.2022")),
                            ),
                          )
                        ],
                      ),
                      ListTile(
                        title: ListTile(
                          title: const Center(
                            child: Text("Kalan Gün Sayısı"),
                          ),
                          subtitle: Center(
                            child: CountdownTimer(
                              endTime: endTime,
                              textStyle: const TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                              endWidget: const Center(
                                  child: Text(
                                      'MAC-RO Kullanım Süreniz Dolmuştur!')),
                              onEnd: () {
                                _timerEnd = !_timerEnd;
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: kDefaultPadding * 2),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Container(
                    width: size.width,
                    height: size.width - (kDefaultPadding * 2),
                    child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
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
                ),
                SizedBox(height: kDefaultPadding * 2),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Container(
                    width: size.width,
                    height: size.width / 2,
                    child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: kDefaultPadding,
                          childAspectRatio: 3.3,
                        ),
                        itemCount: itemSlotRadio.length,
                        itemBuilder: (BuildContext context, index) {
                          return Center(
                            child: itemSlotRadio[index],
                          );
                        }),
                  ),
                ),
                SizedBox(height: kDefaultPadding),
                TextButton(onPressed: () {}, child: Text("Çıkış Yap"))
              ],
            ),
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
      borderRadius: BorderRadius.circular(24),
      onTap: () {
        (_isActive) ? _controller.stop() : _controller.repeat();
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
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: kDefaultPadding / 2,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Atak Durumu",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const Spacer(),
                Lottie.asset(
                  widget.animation,
                  width: MediaQuery.of(context).size.width / 2 -
                      (kDefaultPadding * 4),
                  controller: _controller,
                  repeat: true,
                  reverse: true,
                  onLoaded: (composition) {
                    _controller.duration = composition.duration;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ItemSlotTile extends StatefulWidget {
  final String title;
  void Function()? onTap;
  ItemSlotTile({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  State<ItemSlotTile> createState() => _ItemSlotTileState();
}

class _ItemSlotTileState extends State<ItemSlotTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return kPrimaryColor;
    }

    return ListTile(
      leading: Checkbox(
        checkColor: Colors.white,
        fillColor: MaterialStateProperty.resolveWith(getColor),
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value!;
            widget.onTap;
          });
        },
      ),
      title: Text(widget.title),
    );
  }
}
