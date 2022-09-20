import 'package:everest_flutter_crypto_list/shared/api/viewData/crypto_data_view_data.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/model/crypto_list_model.dart';
import '../../shared/providers/providers.dart';
import '../../shared/repositories/crypto_list_repository.dart';
import 'crypto_list_tile.dart';

class CryptoListView extends ConsumerStatefulWidget {
  const CryptoListView({Key? key}) : super(key: key);

  @override
  ConsumerState<CryptoListView> createState() => _CryptoListViewState();
}

class _CryptoListViewState extends ConsumerState<CryptoListView> {
  CryptoListRepository repository = CryptoListRepository();
  late Future<List<CryptoListModel>> cryptos;

  @override
  void initState() {
    getCryptosData();
    super.initState();
  }

  Future<void> getCryptosData() {
    cryptos = repository.getAllCryptos();
    return cryptos;
  }

  @override
  Widget build(BuildContext context) {
    final cryptoData = ref.watch(cryptosDataProvider);
    return cryptoData.when(
      data: (data) {
        final cryptoData = data.cryptoListDataView;
        return Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(
              parent: ScrollPhysics(),
            ),
            itemCount: cryptoData.length,
            itemBuilder: (context, index) {
              CryptoDataViewData crypto = cryptoData[index];
              return Card(
                child: CryptoListTile(
                  crypto: crypto,
                ),
              );
            },
          ),
        );
      },
      error: (error, stackTrace) => Center(child: Text('$error')),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}


// Expanded(
//       child: FutureBuilder(
//         future: cryptos,
//         builder: (BuildContext context,
//             AsyncSnapshot<List<CryptoListModel>> snapshot) {
//           if (snapshot.hasData) {
//             return RefreshIndicator(
//               onRefresh: () {
//                 return getCryptosData();
//               },
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 physics: const AlwaysScrollableScrollPhysics(
//                   parent: ScrollPhysics(),
//                 ),
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context, index) {
//                   CryptoListModel crypto = snapshot.data![index];
//                   return Card(
//                     child: CryptoListTile(
//                       model: crypto,
//                     ),
//                   );
//                 },
//               ),
//             );
//           }
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       ),
//     );