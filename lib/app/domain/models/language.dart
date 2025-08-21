class Language {
  final String tag;

  Language({required this.tag});


  Language.fromJsonSQFlite(var json) :
  tag = json['tag'];

  fromJsonSQFlite()=>{
    'tag': tag
  };

  toJsonSQFlite()=>{
    'tag':tag
  };
}