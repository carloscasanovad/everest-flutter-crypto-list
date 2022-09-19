import 'package:flutter/material.dart';

import '../../shared/model/crypto_list_model.dart';
import '../../shared/repositories/crypto_list_repository.dart';
import 'crypto_list_tile.dart';

class CryptoListView extends StatefulWidget {
  const CryptoListView({Key? key}) : super(key: key);

  @override
  State<CryptoListView> createState() => _CryptoListViewState();
}

class _CryptoListViewState extends State<CryptoListView> {
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
    return Expanded(
      child: FutureBuilder(
        future: cryptos,
        builder: (BuildContext context,
            AsyncSnapshot<List<CryptoListModel>> snapshot) {
          if (snapshot.hasData) {
            return RefreshIndicator(
              onRefresh: () {
                return getCryptosData();
              },
              child: ListView.builder(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(
                  parent: ScrollPhysics(),
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  CryptoListModel crypto = snapshot.data![index];
                  return Card(
                    child: CryptoListTile(
                      model: crypto,
                    ),
                  );
                },
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
