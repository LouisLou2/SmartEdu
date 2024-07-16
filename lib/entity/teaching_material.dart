enum TeachingMaterialType{
  PPT,
  PDF,
  DOC,
  VIDEO,
  AUDIO,
  IMAGE,
  OTHER
}
class TeachingMaterial{
  int fileId;
  String name;
  String url;
  int size;
  TeachingMaterialType type;

  TeachingMaterial({required this.fileId, required this.name, required this.size, required this.type, required this.url});

  factory TeachingMaterial.fromJson(Map<String, dynamic> json){
    return TeachingMaterial(
      fileId: json['fileId'],
      name: json['name'],
      size: json['size'],
      type: json['type'],
      url: json['url']
    );
  }

  //get_type
  String get typeString{
    switch(type){
      case TeachingMaterialType.PPT:
        return 'PPT';
      case TeachingMaterialType.PDF:
        return 'PDF';
      case TeachingMaterialType.DOC:
        return 'DOC';
      case TeachingMaterialType.VIDEO:
        return 'VIDEO';
      case TeachingMaterialType.AUDIO:
        return 'AUDIO';
      case TeachingMaterialType.IMAGE:
        return 'IMAGE';
      case TeachingMaterialType.OTHER:
        return 'OTHER';
    }
  }
}