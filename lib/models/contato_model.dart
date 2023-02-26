class Contato {
  String _nome = "";
  String _telefone = "";
  String _email = "";
  String _cep = "";
  String _cidade = "";
  String _uf = "";
  String _endereco = "";
  String _pathImg = "";
  String _dataDeNascimento = "";
  bool _favorito = false;

  Contato(String nome, String telefone, String email, String cep, String cidade,
      String uf, String endereco, String pathImg, String dataDeNascimento,bool favorito);

  String get nome => _nome;
  set nome(String nome) => _nome = nome;
  String get telefone => _telefone;
  set telefone(String telefone) => _telefone = telefone;
  String get email => _email;
  set email(String email) => _email = email;
  String get cep => _cep;
  set cep(String cep) => _cep = cep;
  String get cidade => _cidade;
  set cidade(String cidade) => _cidade = cidade;
  String get uf => _uf;
  set uf(String uf) => _uf = uf;
  String get endereco => _endereco;
  set endereco(String endereco) => _endereco = endereco;
  String get pathImg => _pathImg;
  set pathImg(String pathImg) => _pathImg = pathImg;
  String get dataDeNascimento => _dataDeNascimento;
  set dataDeNascimento(String dataDeNascimento) => _dataDeNascimento = dataDeNascimento;
  bool get favorito => _favorito;
  set favorito(bool favorito) => _favorito = favorito;

  Contato.fromJson(Map<String, dynamic> json) {
    _nome = json['nome'];
    _telefone = json['telefone'];
    _email = json['email'];
    _cep = json['cep'];
    _cidade = json['cidade'];
    _uf = json['uf'];
    _endereco = json['endereco'];
    _pathImg = json['pathImg'];
    _dataDeNascimento = json['dataDeNascimento'];
    _favorito = json['favorito'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['nome'] = _nome;
    data['telefone'] = _telefone;
    data['email'] = _email;
    data['cep'] = _cep;
    data['cidade'] = _cidade;
    data['uf'] = _uf;
    data['endereco'] = _endereco;
    data['dataDeNascimento'] = _dataDeNascimento;
    data['pathImg'] = _pathImg;
    data['favorito'] = _favorito;
    return data;
  }
}
