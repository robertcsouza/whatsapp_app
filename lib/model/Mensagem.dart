class Mensagem{

  String _idUsuario;
  String _mensagem;
  String _urlImagem;
  DateTime _time;
  //define o tipo da mensagem
  String _tipo;

  Mensagem();

  Map<String,dynamic> toMap(){


    Map<String,dynamic> map = {

      "idUsuario":this.idUsuario,
      "mensagem": this.mensagem,
      "urlImagem": this.urlImagem,
      "tipo":this.tipo,
      "time": this._time

    };

    return map;

  }

  Map<String,dynamic> toMapUsuario(String iddestinatario){


    Map<String,dynamic> map = {


      iddestinatario: this.mensagem
    };

    return map;

  }




  DateTime get time => _time;

  set time(DateTime value) {
    _time = value;
  }

  String get tipo => _tipo;

  set tipo(String value) {
    _tipo = value;
  }

  String get urlImagem => _urlImagem;

  set urlImagem(String value) {
    _urlImagem = value;
  }

  String get mensagem => _mensagem;

  set mensagem(String value) {
    _mensagem = value;
  }

  String get idUsuario => _idUsuario;

  set idUsuario(String value) {
    _idUsuario = value;
  }


}