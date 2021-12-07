import 'colors_theme.dart';
import 'textstyle_theme.dart';

class AppTheme {
  // Vamos utilizar o padrão SINGLETON (instância única)
  // para ser accesível de qualquer lugar do aplicativo
  // depois que for instanciado, vc nao consegue alterar, final
  static final instance = AppTheme();

  final _colors = ColorsTheme();
  static IColorsTheme get colors => instance._colors;

  final _textStyles = TextStylesTheme(); 
  static ITextStylesTheme get textStyles => instance._textStyles;
}