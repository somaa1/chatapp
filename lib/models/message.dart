import 'package:chatapp/constant.dart';

class Messages{
 final String message;
final String id;
Messages(this.message,this.id);

  factory Messages.fromJson( JsonData){
return Messages(JsonData[KMessage],JsonData[KId]);

}


}
