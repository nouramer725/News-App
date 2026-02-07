
import 'package:news_app/utils/size_config.dart';

double w(double value) {
  return value * SizeConfig.screenWidth / 393;
}

double h(double value) {
  return value * SizeConfig.screenHeight / 852;
}

double sp(double fontSize) => fontSize * SizeConfig.screenWidth / 393;
