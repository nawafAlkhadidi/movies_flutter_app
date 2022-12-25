////////////////!  formt time from second to MM:SS !////////////////
  String formatHHMMSS(int seconds) {
    seconds = (seconds % 3600).truncate();
    final minutes = (seconds / 60).truncate();
    final minutesStr = (minutes).toString().padLeft(2, '0');
    final secondsStr = (seconds % 60).toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr';
  }