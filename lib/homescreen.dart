import 'package:flutter/material.dart';
import 'package:myapp/gamescreen.dart';
class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

// Suggested code may be subject to a license. Learn more: ~LicenseLog:2209326595.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController player1Controller = TextEditingController();
  final TextEditingController player2Controller = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xFF003049),
      body:Form(
       key: _formKey,
       child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2136952137.
          const Text("Enter player name",
           style: TextStyle(fontSize: 30,
            fontWeight: FontWeight.bold,color:
             Color(0xffedede9))),
          const SizedBox(height: 10),
          Padding(padding: const EdgeInsets.all(16),
          child:TextFormField(
            controller: player1Controller,
            style: const TextStyle(color: Color(0xffedede9)),
            decoration:const InputDecoration(
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(
               color: Color(0xffedede9)                    
            ),),
            focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(
               color: Color(0xffc1121f)                    
            )),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(
               color: Color(0xffedede9)                    
            )),
            errorBorder: OutlineInputBorder(borderSide: BorderSide(
               color: Color(0xffc1121f)                    
            )),
            hintText:"player1 username ",
            hintStyle: TextStyle(color: Color(0xffedede9) ),
            
            ),
            validator: (value){
              if(value!.isEmpty){
                return "Enter player name";
              }
              return null;
            },
            )
            ),
            Padding(padding: const EdgeInsets.all(16),
          child:TextFormField(
            controller: player2Controller,
            style: const TextStyle(color: Color(0xffedede9)),
            decoration:const InputDecoration(
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(
               color: Color(0xffedede9)                    
            ),),
            focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(
               color: Color(0xffc1121f)                    
            )),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(
               color: Color(0xffedede9)                    
            )),
            errorBorder: OutlineInputBorder(borderSide: BorderSide(
               color: Color(0xffc1121f)                    
            )),
            hintText:"player2 username ",
            hintStyle: TextStyle(color: Color(0xffedede9) ),
            
            ),
            validator: (value){
              if(value!.isEmpty){
                return "Enter player name";
              }
              return null;
            },
            )
            ),
          const SizedBox(height: 30,),
          InkWell(
            onTap: (){  
              if(_formKey.currentState!.validate()){
                Navigator.push(context,
                MaterialPageRoute(
                builder: (context) => GameScreen(
                p1: player1Controller.text, p2: player2Controller.text)));
              }
            },
            child: Container(decoration: BoxDecoration(
              color: const Color(0xffa7c957),
              borderRadius: BorderRadius.circular(10)
            ),
            padding: const EdgeInsets.symmetric(vertical:17, horizontal: 20),
            child: const Text("Start Game", style: 
            TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xffedede9)
            ))
            ),
          ),
          const SizedBox(height: 30,),
          const Text("Made by Hemant Thawani",style: TextStyle(color: Color(0xffedede9)))
        ],
       ),

      )
      );
  }
}