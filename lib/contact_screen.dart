import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key, required bool showAppBar});

  @override
  // ignore: library_private_types_in_public_api
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open the link!')),
      );
    }
  }

  void _goBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // ✅ يضمن توسيط العنوان
        title: const Text(
          "Contact",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: _goBack,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Divider(),
            const Text("About Us",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text(
              "We are a trusted industry leader, delivering exceptional digital solutions tailored to your needs. Our expertise spans app development, innovative web design, and cutting-edge AI-driven services, ensuring reliability, innovation, and measurable success for every project.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),

            const SizedBox(height: 20),
            const Divider(),
            const Text("Our Services",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Column(
              children: [
                ListTile(
                  leading: Icon(Icons.web, color: Colors.blueAccent),
                  title: Text("Web Development"),
                ),
                ListTile(
                  leading: Icon(Icons.phone_android, color: Colors.blueAccent),
                  title: Text("Mobile App Development"),
                ),
                ListTile(
                  leading: Icon(Icons.computer, color: Colors.blueAccent),
                  title: Text("Software Solutions"),
                ),
                // ListTile(
                //   leading: Icon(Icons.analytics, color: Colors.blueAccent),
                //   title: Text("AI & Data Analytics"),
                // ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(),
            const Text("Contact Us",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => _launchURL("mailto:algolab8@gmail.com"),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.email, color: Colors.blueAccent),
                  SizedBox(width: 10),
                  Text("algolab8@gmail.com",
                      style: TextStyle(fontSize: 16, color: Colors.blueAccent)),
                ],
              ),
            ),
            // const SizedBox(height: 10),
            // GestureDetector(
            //   onTap: () => _launchURL("https://yourwebsite.com"),
            //   child: const Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Icon(Icons.language, color: Colors.blueAccent),
            //       SizedBox(width: 10),
            //       Text("www.yourwebsite.com",
            //           style: TextStyle(fontSize: 16, color: Colors.blueAccent)),
            //     ],
            //   ),
            // ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
