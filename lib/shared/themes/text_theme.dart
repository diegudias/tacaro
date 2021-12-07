// extensions, coloca uma função que não existe na classe do dart
import 'package:flutter/material.dart';

import 'app_theme.dart';

extension TextThemeExt on Text {
  Text get label => Text(
        this.data!,
        style: AppTheme.textStyles.label,
      );
}

// Text("").label;