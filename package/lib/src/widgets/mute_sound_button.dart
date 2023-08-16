import 'package:flutter/material.dart';
import 'package:flutter_meedu_videoplayer/meedu_player.dart';

class MuteSoundButton extends StatelessWidget {
  final Responsive responsive;
  final EdgeInsets? customPadding;
  final double? size;

  const MuteSoundButton({Key? key, required this.responsive, this.customPadding, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _ = MeeduPlayerController.of(context);
    return RxBuilder(
      //observables: [_.mute, _.fullscreen],
            (__) {
          String iconPath = 'assets/icons/mute.png';
          Widget? customIcon = _.customIcons.mute;

          if (!_.mute.value) {
            iconPath = 'assets/icons/sound.png';
            customIcon = _.customIcons.sound;
          }

          return PlayerButton(
            // size: responsive.buttonSize(),
            size: size ?? 30,
            circle: false,
            backgroundColor: Colors.transparent,
            iconColor: Colors.white,
            iconPath: iconPath,
            customIcon: customIcon,
            customPadding: customPadding,
            onPressed: () {
              _.setMute(!_.mute.value);
            },
          );
        });
  }
}
