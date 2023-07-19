import 'package:get/get.dart';

import '../models/order_model.dart';

class OrderController extends GetxController{
  List<OrderModel> orderList = <OrderModel>[
    OrderModel(
        orderNumber: 'AA001',
        orderDateTime: '15/05/2023',
        customerName: 'John Doe',
        orderType: 'Exterior Service',
        orderDueDate: '17/05/2023',
        orderValue: '499'
    )  ,
    OrderModel(
        orderNumber: 'AA002',
        orderDateTime: '15/05/2023',
        customerName: 'John Doe',
        orderType: 'Interior Service',
        orderDueDate: '17/05/2023',
        orderValue: '499'
    ),
    OrderModel(
        orderNumber: 'AA003',
        orderDateTime: '15/05/2023',
        customerName: 'John Doe',
        orderType: 'Deep Cleaning',
        orderDueDate: '17/05/2023',
        orderValue: '499'
    ) ,
    OrderModel(
        orderNumber: 'AA004',
        orderDateTime: '15/05/2023',
        customerName: 'John Doe',
        orderType: 'Exterior Service',
        orderDueDate: '17/05/2023',
        orderValue: '499'
    ) ,
    OrderModel(
        orderNumber: 'AA005',
        orderDateTime: '15/05/2023',
        customerName: 'John Doe',
        orderType: 'Interior Service',
        orderDueDate: '17/05/2023',
        orderValue: '499'
    )

  ];
}