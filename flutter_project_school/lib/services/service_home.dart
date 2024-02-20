import 'package:dio/dio.dart';
import 'package:flutter_project_school/models/mode_place.dart';

class ServiceHome {
  ServiceHome._();
  static ServiceHome instant = ServiceHome._();
  final dio = Dio();

  Future<List<ModelPlace>> getAllPlace() async {
    // final response = await dio.get('https://dart.dev');
    // if (response.statusCode == 200) {
    //   return response.data;
    // }
    // return [];
    return [
      ModelPlace(
        title: "Hội an",
        image: "https://phototravelnomads.com/wp-content/uploads/Vietnam_HoiAn-PhotoTravelNomads-Teaser.jpg",
        favorite: false,
        rate: 4.0,
      ),
      ModelPlace(
        title: "Hà nội",
        image: "https://owa.bestprice.vn/images/destinations/uploads/trung-tam-thanh-pho-ha-noi-603da1f235b38.jpg",
        favorite: false,
        rate: 4.0,
      ),
      ModelPlace(
        title: "TP. Hồ Chí Minh",
        image:
            "https://media.istockphoto.com/id/1401126607/vi/anh/khung-c%E1%BA%A3nh-tr%C3%AAn-kh%C3%B4ng-c%E1%BB%A7a-nh%E1%BB%AFng-t%C3%B2a-nh%C3%A0-ch%E1%BB%8Dc-tr%E1%BB%9Di-tuy%E1%BB%87t-%C4%91%E1%BA%B9p-d%E1%BB%8Dc-theo-d%C3%B2ng-s%C3%B4ng-tr%C3%AAn-b%E1%BA%A7u-tr%E1%BB%9Di.jpg?s=612x612&w=0&k=20&c=tKG0XCBB-k7AuUUNvH6VrCW7DjSojIGmrxJD6rcPabE=",
        favorite: true,
        rate: 4.0,
      ),
      ModelPlace(
        title: "Hà nội",
        image: "https://owa.bestprice.vn/images/destinations/uploads/trung-tam-thanh-pho-ha-noi-603da1f235b38.jpg",
        favorite: false,
        rate: 4.0,
      ),
      ModelPlace(
        title: "Hội an",
        image: "https://phototravelnomads.com/wp-content/uploads/Vietnam_HoiAn-PhotoTravelNomads-Teaser.jpg",
        favorite: false,
        rate: 4.0,
      ),
      ModelPlace(
        title: "TP. Hồ Chí Minh",
        image:
            "https://media.istockphoto.com/id/1401126607/vi/anh/khung-c%E1%BA%A3nh-tr%C3%AAn-kh%C3%B4ng-c%E1%BB%A7a-nh%E1%BB%AFng-t%C3%B2a-nh%C3%A0-ch%E1%BB%8Dc-tr%E1%BB%9Di-tuy%E1%BB%87t-%C4%91%E1%BA%B9p-d%E1%BB%8Dc-theo-d%C3%B2ng-s%C3%B4ng-tr%C3%AAn-b%E1%BA%A7u-tr%E1%BB%9Di.jpg?s=612x612&w=0&k=20&c=tKG0XCBB-k7AuUUNvH6VrCW7DjSojIGmrxJD6rcPabE=",
        favorite: false,
        rate: 4.0,
      ),
      ModelPlace(
        title: "Hà nội",
        image: "https://owa.bestprice.vn/images/destinations/uploads/trung-tam-thanh-pho-ha-noi-603da1f235b38.jpg",
        favorite: false,
        rate: 4.0,
      ),
    ];
  }
}
