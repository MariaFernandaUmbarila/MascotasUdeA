class User{

  var _id, _names, _surnames, _email;
  var _phone, _address, _gender, _password;

  User(this._id, this._names, this._surnames, this._email, this._phone, this._address, this._gender, this._password);

  User.fromJson(Map<String, dynamic> data):
      _id = data['id'],
      _names = data['names'],
      _surnames = data['surnames'],
      _email = data['email'],
      _phone = data['phone'],
      _address = data['address'],
      _gender = data['gender'],
      _password = data['password'];

  Map<String, dynamic> convert() => {
    'id': _id,
    'names': _names,
    'surnames': _surnames,
    'email': _email,
    'phone': _phone,
    'address': _address,
    'gender': _gender,
    'password': _password
  };

  get password => _password;

  set password(value) {_password = value;}

  get id => _id;

  set id(value) {_id = value;}

  get names => _names;

  set names(value) {_names = value;}

  get surnames => _surnames;

  set surnames(value) {_surnames = value;}

  get email => _email;

  set email(value) {_email = value;}

  get phone => _phone;

  set phone(value) {_phone = value;}

  get address => _address;

  set address(value) {_address = value;}

  get gender => _gender;

  set gender(value) {_gender = value;}
}