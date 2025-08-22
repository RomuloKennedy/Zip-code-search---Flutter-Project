class Address {
  final int id;
  final String zipCode;
  final String street;
  final String state;
  final String city;
  final String district;

  Address(
      {required this.id,
      required this.zipCode,
      required this.street,
      required this.state,
      required this.city,
      required this.district});

  Address.fromJson(var json)
      : id = json['id'],
        zipCode = json['cep'],
        street = json['logradouro'],
        state = json['uf'],
        city = json['localidade'],
        district = json['bairro'];

  static List<Address> fromJsonToEnderecoList(var json) {
    List<Address> lista = [];
    if (json != null) {
      for (var n in json) {
        lista.add(Address.fromJson(n));
      }
    }
    return lista;
  }
}
