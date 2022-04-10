# Implicit animations in flutter

This is an app written to demonstrates the use of implicit animations in flutter. It makes use of `AnimatedContainer` to animate transitions in color and size.

## Implicit Animations

Flutter provides implicitly animated widgets, these are variations of the regular widgets that are able to animate changes to their properties. When the property of an implicitly animated widget changes, the widget will animate from the old value to the new value.

To use one of these widgets you have to specify the `duration` property, this property is used to specify the duration of the animation. The duration argument must be provided, an optional property is the `curve` property. It is used to apply curves such as Curves.easeIn to the animation.

```dart
class ColorItem extends StatelessWidget {
  const ColorItem(
      {Key? key, this.onTap, required this.color, this.selected = false})
      : super(key: key);

  final VoidCallback? onTap;
  final Color color;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        margin: const EdgeInsets.all(10),
        duration: const Duration(seconds: 2),
        width: selected ? 70 : 50,
        height: selected ? 70 : 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          color: color,
          borderRadius: BorderRadius.circular(selected ? 50 : 10),
        ),
      ),
    );
  }
}
```

In the code snippet above, when the `selected` property changes, the `width`, `color` and `borderRadius` properties of the `AnimatedContainer` will animate to the new value, the anmation will last 2 seconds and it will use the default curve of `linear`.

![a](./implicit_animation_demo.mp4 "demo")
