
class UserDataModel {
  String email;
  String phone;
  String firstName;
  String pincode;
  String roleId;
  UserDataModel(
      {
        this.email = '',
        this.firstName = '',
        this.phone = '',
        this.pincode = '',
        this.roleId = "2",
      });

  toJson(){
    return{
      "email": email,
      "phone": phone,
      "firstname":firstName,
      "pincode" : pincode,
    };
  }



}