
import 'package:applab/src/core/api_response.dart';
import 'package:applab/src/core/domain/entities/profile.dart';
import 'package:applab/src/core/http_client.dart';

import '../../domain/entities/user.dart';

class AuthService {
   final HttpClient httpClient;

    AuthService(this.httpClient);

     Future<ApiResponse<Profile>> login(User user) async {
      return await httpClient.post<Profile>(
        '/auth/login',
        data: user.toJson(),
        fromJson: (data) => Profile.fromJson(data),
      );
    }

    

}