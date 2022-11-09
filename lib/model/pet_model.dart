class Pet{

  var _id, _name, _type, _breed, _age, _gender, _photo;

  Pet(this._id, this._name, this._type, this._breed, this._age, this._gender, this._photo);

  Pet.fromJson(Map<String, dynamic> data):
        _id = data['id'],
        _name = data['name'],
        _type = data['type'],
        _breed = data['breed'],
        _age = data['age'],
        _photo = data['photo'];

  Map<String, dynamic> convert() => {
    'id': _id,
    'name': _name,
    'type': _type,
    'breed': _breed,
    'age': _age,
    'photo': _photo,
  };

  get photo => _photo;
  set photo(value) {_photo = value;}

  get gender => _gender;
  set gender(value) {_gender = value;}

  get age => _age;
  set age(value) { _age = value;}

  get breed => _breed;
  set breed(value) {_breed = value;
  }

  get type => _type;
  set type(value) {_type = value;}

  get name => _name;
  set name(value) {_name = value;}

  get id => _id;
  set id(value) {_id = value;}
}