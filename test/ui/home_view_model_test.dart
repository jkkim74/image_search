import 'package:flutter_test/flutter_test.dart';
import 'package:image_search/Photo.dart';
import 'package:image_search/ui/data/photo_api_repository.dart';
import 'package:image_search/ui/data/pixabay_api.dart';
import 'package:image_search/ui/home_view_model.dart';

void main(){

  test("Stream이 잘 동작해야함.",() async{
    final viewModel = HomeViewModel(FakePhotoApiRepository());
    await viewModel.fetch('apple');
    await viewModel.fetch('apple');

    final result = fakeJson.map((e) => Photo.fromJson(e)).toList();
    expect(viewModel.photoStream,
      emitsInOrder([
        equals([]),
        equals(result),
        equals(result),
      ])
    );

  });

}

class FakePhotoApiRepository extends PhotoApiRepository{
  @override
  Future<List<Photo>> fetch(String query) async {
    Future.delayed(const Duration(microseconds: 500));
    return fakeJson.map((e) => Photo.fromJson(e)).toList();
  }

}

List<Map<String,dynamic>> fakeJson = [
{
"id": 1834639,
"pageURL": "https://pixabay.com/photos/apple-red-fruit-food-fresh-ripe-1834639/",
"type": "photo",
"tags": "apple, red, fruit",
"previewURL": "https://cdn.pixabay.com/photo/2016/11/18/13/47/apple-1834639_150.jpg",
"previewWidth": 150,
"previewHeight": 150,
"webformatURL": "https://pixabay.com/get/gc7b058648e61a0d03f16fd19becb52aa631a7884f064fd9926d6553721a22f47212bcaf223d03aa9bc9a9c4e5b9a8616f49e4c13593865107c258adc5bbb5c6c_640.jpg",
"webformatWidth": 640,
"webformatHeight": 640,
"largeImageURL": "https://pixabay.com/get/g4911a9469e889e03617b2cfd9f58514b227dc6ba5a06986fe9f9fcb1ac622e4daa0a59247b0666ca94602224a8f83b14126b5481a38ce85f5d05f11611b62326_1280.jpg",
"imageWidth": 2827,
"imageHeight": 2827,
"imageSize": 1022194,
"views": 72171,
"downloads": 43596,
"collections": 2630,
"likes": 163,
"comments": 40,
"user_id": 2286921,
"user": "Pexels",
"userImageURL": "https://cdn.pixabay.com/user/2016/03/26/22-06-36-459_250x250.jpg"
},
{
"id": 1122537,
"pageURL": "https://pixabay.com/photos/apple-water-droplets-fruit-moist-1122537/",
"type": "photo",
"tags": "apple, water droplets, fruit",
"previewURL": "https://cdn.pixabay.com/photo/2016/01/05/13/58/apple-1122537_150.jpg",
"previewWidth": 150,
"previewHeight": 95,
"webformatURL": "https://pixabay.com/get/ga70d72c7d3c2ae9fd3a7462b91f12fcd91a74f080a1e4cb3483a7ef491cfd7e6270c2e3381ebafbd964ef0e29dc87abf7cb5fef4a500ef4bae8e2308774f5ed4_640.jpg",
"webformatWidth": 640,
"webformatHeight": 409,
"largeImageURL": "https://pixabay.com/get/g50720d4913fffa021f44ffa72af54bff8576c1323200e344a5e911c4509b28ec34b5d7dc4788c7277e0be66b99f763a78f4471b2bf6cc7cedb3895737b46bc61_1280.jpg",
"imageWidth": 4752,
"imageHeight": 3044,
"imageSize": 5213632,
"views": 251033,
"downloads": 142721,
"collections": 3982,
"likes": 1024,
"comments": 162,
"user_id": 1445608,
"user": "mploscar",
"userImageURL": "https://cdn.pixabay.com/user/2016/01/05/14-08-20-943_250x250.jpg"
},
{
"id": 2788599,
"pageURL": "https://pixabay.com/photos/apples-red-apple-ripe-apple-orchard-2788599/",
"type": "photo",
"tags": "apples, red apple, ripe",
"previewURL": "https://cdn.pixabay.com/photo/2017/09/26/13/21/apples-2788599_150.jpg",
"previewWidth": 150,
"previewHeight": 99,
"webformatURL": "https://pixabay.com/get/ga109dce6809e7baffb2b5b1e956f927f922408645e99f041a7fb195bfcd7e1c5cb1462e612a437cf5a44182515171cf788b56aaafecd6fb041bc4e4ae0e838e2_640.jpg",
"webformatWidth": 640,
"webformatHeight": 426,
"largeImageURL": "https://pixabay.com/get/gbed5c63324e59477927e8c2d56daad94431a1066e4e83f83f425fceeb7211f74f8f7d019d1c8698621f65c06449d380174df5146e96502d54e10e32b7927a6e4_1280.jpg",
"imageWidth": 6000,
"imageHeight": 4000,
"imageSize": 3660484,
"views": 108343,
"downloads": 58566,
"collections": 1975,
"likes": 603,
"comments": 59,
"user_id": 2364555,
"user": "pixel2013",
"userImageURL": "https://cdn.pixabay.com/user/2020/07/25/21-10-11-80_250x250.jpg"
},
{
"id": 1868496,
"pageURL": "https://pixabay.com/photos/apple-computer-desk-workspace-1868496/",
"type": "photo",
"tags": "apple, computer, desk",
"previewURL": "https://cdn.pixabay.com/photo/2016/11/29/08/41/apple-1868496_150.jpg",
"previewWidth": 150,
"previewHeight": 99,
"webformatURL": "https://pixabay.com/get/gc4af53785e8e012555f1cf6bfa8251c7c0fd5a2d799bc3cec17ae576cebb6b944de820fd4d8e2412f39b72c5d257512d7edbd941613f23b76a5a04b9f66b0119_640.jpg",
"webformatWidth": 640,
"webformatHeight": 426,
"largeImageURL": "https://pixabay.com/get/g586cb46b4630145727cbd4029c1e1e5cd7cf85e20b52a1f32c14d99b5cfce0dc25db57b8c0306141c4d7a14acb1c422c1f1e908d7f02271bcf820692bd4c1fb0_1280.jpg",
"imageWidth": 5184,
"imageHeight": 3456,
"imageSize": 2735519,
"views": 539942,
"downloads": 396647,
"collections": 7357,
"likes": 895,
"comments": 243,
"user_id": 2286921,
"user": "Pexels",
"userImageURL": "https://cdn.pixabay.com/user/2016/03/26/22-06-36-459_250x250.jpg"
}];