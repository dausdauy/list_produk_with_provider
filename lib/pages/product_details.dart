import 'package:cached_network_image/cached_network_image.dart';
import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/material.dart';
import 'package:learn/controllers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as int;
    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    debugPrint(id.toString());
    context.read<ProductProvider>().getOne(id);
    return Consumer<ProductProvider>(
      builder: (context, value, child) {
        if (value.detailProduct != null) {
          return WillPopScope(
            onWillPop: () {
              value.detailProduct = null;

              return Future.value(true);
            },
            child: Scaffold(
              backgroundColor: Colors.grey.shade100,
              appBar: AppBar(
                title: Text(value.detailProduct!.name ?? 'no data'),
                actions: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.more_vert))
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.black,
                      height: screenSize.height * 0.35,
                      alignment: Alignment.center,
                      child: CachedNetworkImage(
                        imageUrl: value.detailProduct!.defaultImage!,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            value.detailProduct!.name ?? 'no data',
                            style: textTheme.bodyLarge,
                            textScaleFactor: 1.3,
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            width: 150,
                            height: 50,
                            child: CouponCard(
                              firstChild: Center(
                                child: Text(
                                  'Diskon',
                                  style: textTheme.labelLarge,
                                  textScaleFactor: 1.5,
                                ),
                              ),
                              secondChild: Center(
                                  child: Text(
                                      '${value.detailProduct!.discount}%')),
                              backgroundColor:
                                  const Color.fromARGB(255, 0, 183, 164),
                              curveAxis: Axis.vertical,
                              clockwise: true,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Rp. ' + value.detailProduct!.price.toString(),
                                style: textTheme.bodyLarge,
                                textScaleFactor: 1.5,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Rp. ' +
                                    value.detailProduct!.priceBeforeDiscount
                                        .toString(),
                                style: const TextStyle(
                                  fontSize: 19,
                                  decoration: TextDecoration.lineThrough,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                'Merek : ',
                                style: textTheme.bodyMedium,
                                // textScaleFactor: 1.3,
                              ),
                              Text(
                                '${value.detailProduct!.brandName == '' ? 'Tidak ada brand' : value.detailProduct!.brandName}',
                                style: textTheme.bodyLarge,
                                // textScaleFactor: 1.3,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Satuan Unit Aset: ',
                                style: textTheme.bodyMedium,
                                // textScaleFactor: 1.3,
                              ),
                              Text(
                                '${value.detailProduct!.uomName}',
                                style: textTheme.bodyLarge,
                                // textScaleFactor: 1.3,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Kondisi: ',
                                style: textTheme.bodyMedium,
                                // textScaleFactor: 1.3,
                              ),
                              Text(
                                '${value.detailProduct!.condition}',
                                style: textTheme.bodyLarge,
                                // textScaleFactor: 1.3,
                              ),
                            ],
                          ),
                          Text(value.detailProduct!.description ?? 'no data',
                              style: textTheme.caption, textScaleFactor: 1.2),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
