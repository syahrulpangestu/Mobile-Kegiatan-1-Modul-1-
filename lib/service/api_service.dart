import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:kegiatan1ab/models/berita_model.dart';

class ApiService {
  final $baseUrl = "http://localhost:8080";
  // Client client = Client();
  Future<List<BeritaModel>> getBeritaModel() async {
    final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/api/v1/beritas'),
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.authorizationHeader:
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTAuMC4yLjI6ODAwMC9hcGkvdjEvYXV0aC9sb2dpbiIsImlhdCI6MTY1NzAyMzE2OCwiZXhwIjoxNjU3MDI2NzY4LCJuYmYiOjE2NTcwMjMxNjgsImp0aSI6IkxUVnprdmFlU1FMRjRwMkIiLCJzdWIiOiI2IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.FQJUgbgBrjULrdgifVbLa8qBOfRPbJn3fgS2ducqV_c',
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
      },
    );
    print(response.body);
    final responseJson = jsonDecode(response.body);
    print(responseJson);
    return beritaModelFromJSON(responseJson["data"]);
  }

  Future<bool> createBeritaModel(BeritaModel data) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/api/v1/beritas'),
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.authorizationHeader:
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTAuMC4yLjI6ODAwMC9hcGkvdjEvYXV0aC9sb2dpbiIsImlhdCI6MTY1NzAyMzE2OCwiZXhwIjoxNjU3MDI2NzY4LCJuYmYiOjE2NTcwMjMxNjgsImp0aSI6IkxUVnprdmFlU1FMRjRwMkIiLCJzdWIiOiI2IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.FQJUgbgBrjULrdgifVbLa8qBOfRPbJn3fgS2ducqV_c',
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        HttpHeaders.acceptHeader: 'application/json',
      },
      body: beritaModelToJSON(data),
    );
    print(response.statusCode);
    print(data);
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateBeritaModel(BeritaModel data) async {
    final response = await http.put(
      Uri.parse('http://10.0.2.2:8000/api/v1/beritas/${data.id}'),
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.authorizationHeader:
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTAuMC4yLjI6ODAwMC9hcGkvdjEvYXV0aC9sb2dpbiIsImlhdCI6MTY1NzAyMzE2OCwiZXhwIjoxNjU3MDI2NzY4LCJuYmYiOjE2NTcwMjMxNjgsImp0aSI6IkxUVnprdmFlU1FMRjRwMkIiLCJzdWIiOiI2IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.FQJUgbgBrjULrdgifVbLa8qBOfRPbJn3fgS2ducqV_c',
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        HttpHeaders.acceptHeader: 'application/json',
      },
      body: beritaModelToJSON(data),
    );
    print(response.statusCode);
    print(data);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteBeritaModel(int id) async {
    final response = await http.delete(
      Uri.parse('http://10.0.2.2:8000/api/v1/beritas/$id'),
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.authorizationHeader:
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTAuMC4yLjI6ODAwMC9hcGkvdjEvYXV0aC9sb2dpbiIsImlhdCI6MTY1NzAyMzE2OCwiZXhwIjoxNjU3MDI2NzY4LCJuYmYiOjE2NTcwMjMxNjgsImp0aSI6IkxUVnprdmFlU1FMRjRwMkIiLCJzdWIiOiI2IiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.FQJUgbgBrjULrdgifVbLa8qBOfRPbJn3fgS2ducqV_c',
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
