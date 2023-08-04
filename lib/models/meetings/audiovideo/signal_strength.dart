enum SignalStrength { none, low, high }

extension SignalStrengthExtension on SignalStrength {
  int get value {
    switch (this) {
      case SignalStrength.none:
        return 0;
      case SignalStrength.low:
        return 1;
      case SignalStrength.high:
        return 2;
    }
  }
}

extension ListSignalStrengthExtension on List<SignalStrength> {
  SignalStrength fromValue(int code) {
    for (var volume in this) {
      if (volume.value == code) return volume;
    }
    return SignalStrength.none;
  }
}
