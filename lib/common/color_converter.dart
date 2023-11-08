import 'dart:ui';

class ColorConverter{

  Color convertColor(String colorCode){
    String characterToRemove = "#";
    String fString = colorCode.replaceFirst(characterToRemove, "");
    Color fColor =  Color(int.parse("0xff$fString"));
    return fColor;
  }

}