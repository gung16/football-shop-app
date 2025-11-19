import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:football_shop/screens/menu.dart';
import 'package:football_shop/screens/productlist_form.dart';
import 'package:football_shop/screens/product_entry_list.dart';
import 'package:football_shop/screens/login.dart';


class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            child: Column(
              children: [
                Text(
                  'Gung\'s Padel Shop',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "All the latest football products here!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          // Bagian routing
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.home_outlined),
                  title: const Text('Home'),
                  // Bagian redirection ke MyHomePage
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyHomePage(),
                        ));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.post_add),
                  title: const Text('Create Product'),
                  // Bagian redirection ke ShopFormPage
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                      builder: (context) => ProductFormPage(),
                      ));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.add_reaction_rounded),
                  title: const Text('Product List'),
                  onTap: () {
                      // Route to product list page
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ProductEntryListPage()),
                      );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('My Products'),
                  onTap: () {
                      // Route to filtered product list page
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProductEntryListPage(showMyProductsOnly: true)),
                      );
                  },
                ),
              ],
            ),
          ),
          // User profile and logout at the bottom
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // User info section
                FutureBuilder(
                  future: request.get('http://localhost:8000/auth/user/'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError || !snapshot.hasData) {
                      return const Text('Not logged in');
                    } else {
                      final userData = snapshot.data as Map<String, dynamic>;
                      final username = userData['username'] ?? 'Unknown User';
                      return Column(
                        children: [
                          const Icon(Icons.account_circle, size: 40, color: Colors.indigo),
                          const SizedBox(height: 8),
                          Text(
                            'Logged in as: $username',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    }
                  },
                ),
                const Divider(),
                // Logout button
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: const Text('Logout', style: TextStyle(color: Colors.red)),
                  onTap: () async {
                    final response = await request.logout("http://localhost:8000/auth/logout/");
                    String message = response["message"];
                    if (context.mounted) {
                      if (response['status']) {
                        String uname = response["username"];
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("$message See you again, $uname."),
                        ));
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(message),
                          ),
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
