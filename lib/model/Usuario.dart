class Usuario{
  String _idUsuario;
  String _nome;
  String _email;
  String _senha;
  String _urlImagem;
  String _ultimaMensagem;

  Usuario();


  String get ultimaMensagem => _ultimaMensagem;

  set ultimaMensagem(String value) {
    _ultimaMensagem = value;
  }

  String get idUsuario => _idUsuario;

  set idUsuario(String value) {
    _idUsuario = value;
  }

  String get urlImagem => _urlImagem;

  set urlImagem(String value) {
    _urlImagem = value;
  }

  String get senha => _senha;

  set senha(String value) {
    _senha = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }


}