class Login {
  int age;
  String country;
  String department;
  String city;

  Login({this.age, this.country, this.department, this.city});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['edad'] = age;
    data['pais'] = country;
    if (country == 'Colombia') {
      data['departamento'] = department;
      data['municipio'] = city;
    }
    return data;
  }
}

