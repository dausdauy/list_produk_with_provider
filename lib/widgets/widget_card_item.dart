import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learn/utils/route_name.dart';

import '../models/product_model.dart';
import '../utils/func.dart';

class CardItem extends StatelessWidget {
  const CardItem({Key? key, required this.data}) : super(key: key);

  final ProductModel data;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenSize = MediaQuery.of(context).size;
    final f = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 6.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => Navigator.pushNamed(
              context,
              RouteName.PRODUCT_DETAIL,
              arguments: data.id,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: screenSize.height * .2,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      CachedNetworkImage(
                        imageUrl: data.defaultImage!,
                        fit: BoxFit.contain,
                      ),
                      Align(
                        alignment: const Alignment(1, -1),
                        child: PopupMenuButton(
                          icon: const Icon(Icons.more_vert_rounded),
                          itemBuilder: (BuildContext context) {
                            return [
                              PopupMenuItem(
                                child: ListTile(
                                  visualDensity: VisualDensity.compact,
                                  contentPadding: EdgeInsets.zero,
                                  dense: true,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  leading: const Icon(Icons.delete_forever),
                                  title: const Text('Hapus produk'),
                                  onTap: () {
                                    debugPrint(data.id.toString());
                                  },
                                ),
                              ),
                            ];
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${data.name}',
                        style: textTheme.caption,
                        textScaleFactor: 1.2,
                      ),
                      const SizedBox(height: 5),
                      Text(f.format(data.price), style: textTheme.headline6),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              icon: const Icon(Icons.add),
                              label: const Text('Beli Langsung'),
                              style: ElevatedButton.styleFrom(
                                primary: const Color.fromARGB(255, 52, 183, 56),
                              ),
                              onPressed: () {
                                // debugPrint(data.id.toString());
                                Func.showToast(msg: data.name!);
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {},
                            child: const Icon(Icons.shopping_cart_rounded),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
