String canDrive(int age) {
  String str = '';
  if (age >= 18) {
    str = 'age: $age, 可以考駕照';
  }
  else {
    str = 'age: $age, 不可以考駕照';
  }
   return str;
}
void main() {
  print(canDrive(19));
  print(canDrive(10));
}