import 'dart:convert';

class BeritaModel {
  int id;
  String judul;
  String deskripsi;
  String image;
  int user_id;
  int category_id;
  String created_at;
  String updated_at;
  BeritaModel({
    this.id = 51,
    required this.judul,
    required this.deskripsi,
    required this.image,
    required this.user_id,
    required this.category_id,
    this.created_at = '',
    this.updated_at = '',
  });
  factory BeritaModel.fromJSON(Map<String, dynamic> data) {
    return BeritaModel(
      id: data['id'],
      judul: data['judul'],
      deskripsi: data['deskripsi'],
      image: data['image'],
      user_id: data['user_id'],
      category_id: data['category_id'],
      created_at: data['created_at'],
      updated_at: data['updated_at'],
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      "id": id,
      "judul": judul,
      "deskripsi": deskripsi,
      "image": image,
      "user_id": user_id,
      "category_id": category_id,
      "created_at": created_at,
      "updated_at": updated_at,
    };
  }

  @override
  String toString() {
    return 'BeritaModel{judul:$judul,deskripsi:$deskripsi,image:$image,user_id :$user_id,category_id :$category_id}';
  }
}

List<BeritaModel> beritaModelFromJSON(List data) {
  return List<BeritaModel>.from(data.map((item) => BeritaModel.fromJSON(item)));
}

String beritaModelToJSON(BeritaModel data) {
  // final jsondata = data.toJSON();
  return json.encode(data.toJSON());
}
