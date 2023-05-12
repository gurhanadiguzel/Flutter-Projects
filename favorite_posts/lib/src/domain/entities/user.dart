class User {
  final String name;
  final String age;
  final String number;
  final String mail;

  User(this.name, this.age, this.number, this.mail);

  @override
  String toString() {
    return ' Name :  $name \n\n Age :  $age \n\n Number :  $number \n\n  Mail :  $mail \n';
  }
}
