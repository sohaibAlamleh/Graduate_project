


import 'package:get/get.dart';

class BoatTotalController extends GetxController {
   int adult=1;
   int child=0;
   int kids=0;
   int ?priceAdult;
   int  ?priceChild;
   int ?priceKids;



   int incrementAdult(){
     return adult++;

   }
   int decrementAdult(){
     if (adult >1) {
        return adult--;
     }else{
        return 1;
     }
   }

   int incrementChild(){
     return child++;

   }
   int decrementChild(){
     if (adult >=1 && child>0) {
       return child--;
     }else{
       return adult=1;
     }
   }
   int incrementKids(){
     return kids++;

   }
   int decrementKids(){
     if (adult >=1 && kids >0) {
       return kids--;
     }else{
       return adult= 1;
     }
   }
   int price(int adlut){
     return adlut;
   }
   int totalAdult(){
     return  (priceAdult!*adult)+(priceChild!*child)+(priceKids!*kids);
   }
}