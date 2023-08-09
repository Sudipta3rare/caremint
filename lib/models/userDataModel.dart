class UserDataModel {
  String email;
  String phone;
  String firstName;
  String pincode;

  UserDataModel({
    this.email = '',
    this.firstName = '',
    this.phone = '',
    this.pincode = '',
  });

  toJson() {
    return {
      "email": email,
      "phone": phone,
      "firstname": firstName,
      "pincode": pincode,
    };
  }


/*
  factory UserDataModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data();
    return UserDataModel(

      email: data?["email"] ?? "", // Assigns an empty string if data?["email"] is null
      phone: data?["phone"] ?? "", // Assigns an empty string if data?["phone"] is null
      firstName: data?["firstname"] ?? "", // Assigns an empty string if data?["firstname"] is null
      pincode:  data?["pincode"]?? '',
      // address: data["address"],
      // city: data["city"],
      // date: data["date"],
      // description: data["description"],
      // payment: data["payment"],
      // providerId: data["provider_id"],
      // price: data["price"],
      // sCategory: data["s_category"],
      // sName: data["s_name"],
      // state: data["state"] == "1" ? "Completed" : "Ongoing" ,
      // status: data["status"],
      // time: data["time"],
    );
  }
}*/

}
