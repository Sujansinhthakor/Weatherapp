import 'package:geolocator/geolocator.dart';
 class Location{
   double?latitude;
   double?longitude;

   Future<void> getCurrentlocation() async{
     try{
       LocationPermission permission;
       permission = await Geolocator.requestPermission();
       Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
       latitude=position.latitude;
       longitude=position.longitude;
     }
     catch(e){
       print(e);
     }
   }
 }