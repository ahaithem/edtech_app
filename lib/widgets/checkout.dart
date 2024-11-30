import 'package:edtech_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../courses/video_list_screen.dart';
import '../courses/api_key_google_console.dart';

class Checkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBarWidget(title: 'Your Courses'),
        ),
        body: Consumer<Cart>(
          builder: (context, cart, child) {
            final items = cart.basketItems; // List of courses in the cart
            return items.isEmpty
                ? const Center(
                    child: Text(
                      'Your cart is empty!',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  )
                : ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, i) {
                      final course = items[i];
                      return Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VideoListScreen(
                                  playlistId: course.coursePlaylistId,
                                  apiKey: API_KEY,
                                ),
                              ),
                            );
                          },
                          leading: Image.asset(
                            course.courseImageUrl,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            course.courseTitle,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          subtitle: Text('Price: \$${course.coursePrice}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              // Remove the course from the cart
                              Provider.of<Cart>(context, listen: false)
                                  .remove(course);
                            },
                          ),
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
