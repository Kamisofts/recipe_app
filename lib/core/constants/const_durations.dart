import 'package:flutter_animate/flutter_animate.dart';

class ConstDurations {
  // On Boarding Screen

  static final mainPlayDuration = 1000.ms;
  static final leavesDelayDuration = 600.ms;
  static final titleDelayDuration = mainPlayDuration + 50.ms;
  static final descriptionDelayDuration = titleDelayDuration + 300.ms;
  static final buttonDelayDuration = descriptionDelayDuration + 100.ms;
  static final buttonPlayDuration = mainPlayDuration - 200.ms;

  // Home Screen
  static final avatarPlayDuration = 500.ms;
  static final avatarWaitingDuration = 400.ms;
  static final nameDelayDuration =
      avatarWaitingDuration + avatarWaitingDuration + 200.ms;
  static final namePlayDuration = 800.ms;
  static final categoryListPlayDuration = 750.ms;
  static final categoryListDelayDuration =
      nameDelayDuration + namePlayDuration - 400.ms;
  static final selectedCategoryPlayDuration = 400.ms;
  static final selectedCategoryDelayDuration =
      categoryListDelayDuration + categoryListPlayDuration;

  // Details Screen
  static final appBarPlayTime = 800.ms;
  static final appBarDelayTime = 400.ms;
  static final infoDelayTime = appBarPlayTime + appBarDelayTime - 200.ms;
  static final infoPlayTime = 500.ms;
  static final dishPlayTime = 600.ms;

  // Recipe Card
  static final playDuration = 600.ms;
}
