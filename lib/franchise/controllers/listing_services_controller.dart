import 'package:caremint/franchise/models/listing_service_model.dart';
import 'package:get/get.dart';
class ListingServicesController extends GetxController{
    List<ListingServiceModel> listService = <ListingServiceModel>[
      ListingServiceModel(
        serviceProvided: "Exterior Services",
        servicePrice: '499',
        serviceDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut congue sem elit, ut condimentum ex interdum in. Aliquam tincidunt ante vitae lacus varius, a interdum est mattis."
      ), ListingServiceModel(
        serviceProvided: "Interior Services",
        servicePrice: '499',
        serviceDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut congue sem elit, ut condimentum ex interdum in. Aliquam tincidunt ante vitae lacus varius, a interdum est mattis."
      ), ListingServiceModel(
        serviceProvided: "Exterior + Interior Services",
        servicePrice: '499',
        serviceDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut congue sem elit, ut condimentum ex interdum in. Aliquam tincidunt ante vitae lacus varius, a interdum est mattis."
      ), ListingServiceModel(
        serviceProvided: "Deep Cleaning",
        servicePrice: '499',
        serviceDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut congue sem elit, ut condimentum ex interdum in. Aliquam tincidunt ante vitae lacus varius, a interdum est mattis."
      ), ListingServiceModel(
        serviceProvided: "Monthly Subscription",
        servicePrice: '499',
        serviceDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut congue sem elit, ut condimentum ex interdum in. Aliquam tincidunt ante vitae lacus varius, a interdum est mattis."
      ), ListingServiceModel(
        serviceProvided: "Cearamic Coating",
        servicePrice: '499',
        serviceDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut congue sem elit, ut condimentum ex interdum in. Aliquam tincidunt ante vitae lacus varius, a interdum est mattis."
      ),
    ];
}