import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:prueba_tecnica/src/Models/Users-Model.dart';
import 'package:prueba_tecnica/src/Widgets/Toast.dart';
import 'package:url_launcher/url_launcher.dart';

import 'AddressUser.dart';
import 'IconContacto.dart';


class ContactoUser extends StatefulWidget {
  final UserModel user;
  ContactoUser({Key? key, required this.user}) : super(key: key);

  @override
  _ContactoUserState createState() => _ContactoUserState();
}

class _ContactoUserState extends State<ContactoUser> {
  FToast fToast = FToast();

  @override
  void initState() {
    fToast.init(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.pink.shade50,
            blurRadius: 5.0,
            offset: Offset(0.0, 1.0),
            spreadRadius: 3.0
          )
        ]
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Contactame', style: TextStyle(fontSize: 14.0 , fontWeight: FontWeight.bold)),
                SizedBox(height: 5.0,),
                AddressUser(icon: Icons.phone_android_rounded, descripcion: widget.user.phone??'Sin telefono',),
                SizedBox(height: 3.0,),
                AddressUser(icon: Icons.email_rounded, descripcion: widget.user.email??'Sin Email',),
                SizedBox(height: 3.0,),
                AddressUser(icon: Icons.web_rounded, descripcion: widget.user.website??'Sin sitio Web',),
                SizedBox(height: 3.0,),
              ],
            ),
          ),
          SizedBox(width: 5.0,),
          Expanded(
            flex: 1,
            child: Wrap(
              alignment: WrapAlignment.end,
              // crossAxisAlignment: WrapCrossAlignment.end,
              // mainAxisAlignment: MainAxisAlignment.end,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: ()async{
                    String telefono =  'tel:${widget.user.phone!.split(" ")[0].replaceAll('-', '')}';
                    await canLaunch(telefono) 
                    ? await launch(telefono)
                    : ToastGenericos.toastIcon(context, fToast, Colors.grey.shade400, Icons.phone_android_rounded, 'Parece que no es un telefono valido', 2);
                  },
                  child: IconContacto(icon: Icons.phone_android_rounded,)
                ),
                GestureDetector(
                  onTap: ()async{
                    String correo =  'mailto:${widget.user.email}?subject=Obtener más información&body=Saludos\nquiero obtener mas información de los productos y servicios\n quedo atento.';
                    await canLaunch(correo) 
                    ? await launch(correo)
                    : ToastGenericos.toastIcon(context, fToast, Colors.grey.shade400, Icons.email_rounded, 'Parece que no es un correo valido', 2);
                  },
                  child: IconContacto(icon: Icons.email_rounded,)
                ),
                GestureDetector(
                  onTap: ()async{
                    String telefono =  'https://${widget.user.website}';
                    await canLaunch(telefono) 
                    ? await launch(telefono)
                    : ToastGenericos.toastIcon(context, fToast, Colors.grey.shade400, Icons.phone_android_rounded, 'Parece que no es un telefono valido', 2);
                  },
                  child: IconContacto(icon: Icons.web_rounded,)
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}