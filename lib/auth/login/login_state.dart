import 'package:loginwithbloc/auth/form_submission_status.dart';

class LoginState
{
 final String username;
 bool get isValidUsername => username.length>3;
 final String password;
 bool get isValidPass => password.length>3;
 final FormSubmissionStatus  formstatus;
 LoginState({ required this.username, required this.password,this.formstatus= const InitalFormStatus()});
 LoginState copyWith({
    String username='',
    String password='',
   FormSubmissionStatus formstatus =const InitalFormStatus()
})
 {
   return LoginState(
     username: username!=""?username:this.username,
     password: password!=""?password:this.password,
     formstatus: formstatus
   );
 }

}