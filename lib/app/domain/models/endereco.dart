class Endereco {
  final int id;
  final String cep;
  final String logradouro;
  final String uf;
  final String localidade;
  final String bairro;

  Endereco(
      {required this.id,
      required this.cep,
      required this.logradouro,
      required this.uf,
      required this.localidade,
      required this.bairro});

  Endereco.fromJson(var json)
      : id = json['id'],
        cep = json['cep'],
        logradouro = json['logradouro'],
        uf = json['uf'],
        localidade = json['localidade'],
        bairro = json['bairro'];

  static List<Endereco> fromJsonToEnderecoList(var json) {
    List<Endereco> lista = [];
    if (json != null) {
      for (var n in json) {
        lista.add(Endereco.fromJson(n));
      }
    }
    return lista;
  }
}
