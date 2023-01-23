import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MainMenu extends StatelessWidget {
  MainMenu({super.key});
  final RefreshController _refreshController = RefreshController();

  void _onLoading() {
    _refreshController.loadComplete();
  }

  void _onRefresh() {
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      body: Expanded(
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return SmartRefresher(
                  controller: RefreshController(),
                  enablePullUp: true,
                  onRefresh: _onRefresh,
                  onLoading: _onLoading,
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: ((context, index) {
                      return Card();
                    }),
                  ),
                );
              }
            }

            return const Center();
          },
        ),
      ),
    );
  }
}
