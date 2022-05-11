import 'package:cyfit/constant/theme_color.dart';
import 'package:cyfit/page/signIn_page/sign_in_page.dart';
import 'package:cyfit/page/signUp_page/sign-up_provider.dart';
import 'package:cyfit/widget/double_line.dart';
import 'package:cyfit/widget/form_button.dart';
import 'package:cyfit/widget/input_field.dart';
import 'package:cyfit/widget/social_icon.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';


class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpProvider>(
      create: (context)=>SignUpProvider(),
    child: HomePageWidget(),);
  }
}

class HomePageWidget extends StatelessWidget {
   HomePageWidget({Key? key}) : super(key: key);
  // final _formKey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
   final signUpProvider = Provider.of<SignUpProvider>(context);
    final Size size  = MediaQuery.of(context).size;
    return Container(
      decoration:  const BoxDecoration(
        color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),fit: BoxFit.cover
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(36, 0, 36, 0),
          child: ListView(
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      IconButton(onPressed:(){
                        print("BackButton Click");
                      }, icon: const Icon(Icons.arrow_back), iconSize: 44,),
                      // SizedBox(height: 10,),
                      Image.asset("assets/images/logo.png",height: size.height * 0.10,),
                    ],
                  ),
                  const SizedBox(height: 18,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Register with socials",style: registerHeadingStyle ,),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SocialIcon(bgColor:bgButtonWhite, svgImage: 'assets/icons/google-icon.svg',onTap: (){ print("google");},),
                          SocialIcon(bgColor:kbgBlue,color: Colors.white, svgImage: 'assets/icons/facebook-2.svg',onTap: (){print("facebook");},),
                          SocialIcon(bgColor:lightBlue,color: Colors.white, svgImage: 'assets/icons/twitter.svg',onTap: (){print("twitter");},),
                        ],
                      )
                    ],
                  ),
                  // const SizedBox(height: 6,),
                  const DoubleLine(),
                  // const SizedBox(height: 6,),
                  Row(
                    children:  [
                      Text("Register with email",style:  registerHeadingStyle,),
                    ],
                  ),
                  const SizedBox(height: 12,),
                  Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      children: [
                        InputFieldWidget(
                          initialValue: signUpProvider.signUpUser.email ?? "Email@gmail.com",
                          hintText: "Email@gmail.com",
                          textInputType: TextInputType.emailAddress,
                          labelText: "Email",
                          validate:signUpProvider.validateUsername,
                          onSaved: signUpProvider.onSaveUsername,
                          prefixIcon: const Icon(Icons.person,color: lightBlue,),

                        ),
                        const SizedBox(height: 18,),
                        InputFieldWidget(
                          initialValue: signUpProvider.signUpUser.password ?? "12345678",
                          labelText: "password",
                          isPassword: true,
                          prefixIcon: const Icon(Icons.https,color: lightBlue,),
                          validate:signUpProvider.validatePassword,
                          onSaved: signUpProvider.onSavedPassword,
                          onChanged:signUpProvider.onChancedPassword ,
                        ),const SizedBox(height: 15,),
                        InputFieldWidget(
                          initialValue: "12345678",
                          isPassword: true,
                          labelText: "Confirm password",
                          prefixIcon: const Icon(Icons.https,color: lightBlue,),
                          validate:signUpProvider.validateConfirmPassword,
                          onChanged: signUpProvider.onChangedConfirmPassword,
                          onSaved:signUpProvider.onSaveConfirmPassword,
                        ),
                        const SizedBox(height: 7,),
                        RichText(
                          text: TextSpan(
                            children:  <TextSpan>[
                              TextSpan(text: ' Bt creating an account I accept the ',style: privacyHeadingStyle),
                              TextSpan(text: 'Terms & Conditions', style: privacyHeadingStyle.copyWith(color: Colors.blue)),
                              TextSpan(text: ' and!',style: privacyHeadingStyle),
                              TextSpan(text: ' privacy policy!',style: privacyHeadingStyle.copyWith(color: Colors.blue)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20,),
                        FormButton(

                          onTap: (){
                            if(_formKey.currentState!.validate()){
                              _formKey.currentState!.save();
                              signUpProvider.onSubmit();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("VaLIDATION PASSED")));
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const LoginPage()));
                            }else{
                              signUpProvider.onSubmit();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("VALIDATION ERROR")));
                            }
                          },
                          padding:const EdgeInsets.symmetric(vertical: 14) ,
                          bgcolor: lightBlue, color: Colors.white,
                          width: double.infinity, textButton: 'Join Us',),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already a member?",
                        style: memberHeadingStyle,
                      ),
                      const SizedBox(width: 3,),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const LoginPage()));
                        },
                        child:  Text("Sign in",
                          style: memberHeadingStyle.copyWith(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}


