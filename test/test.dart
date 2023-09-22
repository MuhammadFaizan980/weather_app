// import 'package:flutter_test/flutter_test.dart';
// import 'package:it_zone_task/app/controllers/home_screen_controller.dart';
// import 'package:mockito/mockito.dart';
//
// class MockNavigator extends Mock implements INavigator {}
//
// class MockGetCityNameFromNameUseCase extends Mock implements GetCityNameFromNameUseCase {}
//
// class MockGetWeatherDetailsFromLatLngUseCase extends Mock implements GetWeatherDetailsFromLatLngUseCase {}
//
// void main() {
//   late HomeScreenController controller;
//   late MockNavigator mockNavigator;
//   late MockGetCityNameFromNameUseCase mockGetCityNameFromNameUseCase;
//   late MockGetWeatherDetailsFromLatLngUseCase mockGetWeatherDetailsFromLatLngUseCase;
//
//   setUp(() {
//     mockNavigator = MockNavigator();
//     mockGetCityNameFromNameUseCase = MockGetCityNameFromNameUseCase();
//     mockGetWeatherDetailsFromLatLngUseCase = MockGetWeatherDetailsFromLatLngUseCase();
//
//     controller = HomeScreenController(
//       iNavigator: mockNavigator,
//       getCityNameFromNameUseCase: mockGetCityNameFromNameUseCase,
//       getWeatherDetailsFromLatLngUseCase: mockGetWeatherDetailsFromLatLngUseCase,
//     );
//   });
//
//   test('getCityDetailsFromName should set cityDetailsModel on success', () async {
//     // Arrange
//     when(mockGetCityNameFromNameUseCase(any)).thenAnswer((_) async => Right(CityDetailsModel(/* mock data here */)));
//
//     // Act
//     await controller.getCityDetailsFromName(cityName: 'SomeCityName');
//
//     // Assert
//     expect(controller.cityDetailsModel.value, isNotNull);
//   });
//
//   test('getCityDetailsFromName should show error dialog on failure', () async {
//     // Arrange
//     when(mockGetCityNameFromNameUseCase(any)).thenAnswer((_) async => Left(ErrorModel(/* mock error data here */)));
//
//     // Act
//     await controller.getCityDetailsFromName(cityName: 'SomeCityName');
//
//     // Assert
//     verify(mockNavigator.pop()).called(1); // Verify that pop() is called
//     expect(controller.cityDetailsModel.value, isNull);
//     // You can add more assertions related to the error dialog if needed
//   });
//
//   test('getWeatherDetailsFromLatLng should set weatherDetailsModel on success', () async {
//     // Arrange
//     when(mockGetWeatherDetailsFromLatLngUseCase(any)).thenAnswer((_) async => Right(WeatherDetailsModel(/* mock data here */)));
//
//     // Act
//     await controller.getWeatherDetailsFromLatLng();
//
//     // Assert
//     expect(controller.weatherDetailsModel.value, isNotNull);
//   });
//
//   test('getWeatherDetailsFromLatLng should show error dialog on failure', () async {
//     // Arrange
//     when(mockGetWeatherDetailsFromLatLngUseCase(any)).thenAnswer((_) async => Left(ErrorModel(/* mock error data here */)));
//
//     // Act
//     await controller.getWeatherDetailsFromLatLng();
//
//     // Assert
//     verify(mockNavigator.pop()).called(1); // Verify that pop() is called
//     expect(controller.weatherDetailsModel.value, isNull);
//     // You can add more assertions related to the error dialog if needed
//   });
// }
