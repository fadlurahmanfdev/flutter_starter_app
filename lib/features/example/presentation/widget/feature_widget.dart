import 'package:flutter/material.dart';
import 'package:flutter_starter_app/features/example/data/feature_model.dart';

class ItemFeatureWidget extends StatelessWidget {
  final FeatureModel feature;
  const ItemFeatureWidget({
    super.key,
    required this.feature,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.developer_mode),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(feature.title),
              Text(feature.desc),
            ],
          ),
        )
      ],
    );
  }
}


// Widget _itemFeature(FeatureModel feature) {
//   return Row(
//     children: [
//       Icon(Icons.developer_mode),
//       SizedBox(width: 10),
//       Expanded(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(feature.title),
//             Text(feature.desc),
//           ],
//         ),
//       )
//     ],
//   );
// }