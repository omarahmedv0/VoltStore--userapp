
import 'init_app.dart';

translateDataBase(columnAR , columnEN){
    if( sharedPreferences.getString('lange') == 'ar')
    {
      return columnAR;
    }else
    {
      return columnEN;
    }
}