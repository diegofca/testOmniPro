// ignore_for_file: prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:test_app_photos/modules/home/home.dart';

/// The current state view of the home page.
class HomePageContent extends StatelessWidget {

  HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    return NotificationListener<ScrollNotification>(onNotification: (not) {
        if (not is ScrollEndNotification && not.metrics.extentAfter == 0) {
          /// When the user reaches the end of the list, update the page.
          bloc.add(const HomeUpdatePageEvent());
        }
        return true;
      },
      child: ListView.builder(
        itemCount: bloc.state.currentPhotos.length + 1, // Add 1 for loading indicator
        itemBuilder: (context, index) {
          if (index < bloc.state.currentPhotos.length) {
            final photo = bloc.state.currentPhotos[index];
            return _photoCellView(photo);
          }
          /// If we have reached the end of the list, show the loading indicator
          return _loadingMoreIndicator();
        },
      )
    );
  }

    Widget _photoCellView(Photo photo) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CachedNetworkImage(
              imageUrl: photo.url ?? '',
              width: 100,
              height: 100,
              placeholder: (_, url) => const CircularProgressIndicator.adaptive(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    colorFilter: const ColorFilter.mode(
                      Colors.red,
                      BlendMode.colorBurn
                    )
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(photo.title ?? ''),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loadingMoreIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.lightGreen),
        ),
      )
    );
  }
}