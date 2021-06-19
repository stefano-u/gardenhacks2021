import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterinit/components/add_button.dart';
import 'package:flutterinit/components/empty_home_page.dart';
import 'package:flutterinit/pages/camera_page.dart';
import 'package:flutterinit/pages/plant_search_page.dart';
import 'package:flutterinit/pages/web_view_page.dart';
import 'package:flutterinit/components/custom_square_button.dart';
import '../constants.dart';

class MainPageWidget extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MainPageWidget> {
  void openWebViewPage() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebViewPageWidget(),
      ),
    );
  }

  void onAddPressed(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchPageWidget(),
      ),
    );
  }

  // Open the camera page
  void openCamera() async {
    List<CameraDescription> cameras = await availableCameras();
    CameraDescription firstCamera = cameras.first;

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraPage(camera: firstCamera),
      ),
    );
  }

  //UI of the Main Page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(85),
        child: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'My Plants',
                style: const TextStyle(
                  fontSize: 34.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                height: 11,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 120.0,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: CustomColorScheme.primaryColor,
                ),
                child: Text(
                  'Encyclopedia',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              title: CustomSquareButton(
                onPressed: openWebViewPage,
                label: 'Insects',
                image: ImageFiles.insect,
                url: 1,
              ),
            ),
            ListTile(
              title: CustomSquareButton(
                onPressed: openWebViewPage,
                label: 'Fungus',
                image: ImageFiles.leaf,
                url: 2,
              ),
            )
          ],
        ),
      ),
      body: EmptyHomePage(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_rounded),
        onPressed: () => this.onAddPressed(context),
        backgroundColor: CustomColorScheme.primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        notchMargin: 10,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          selectedItemColor: CustomColorScheme.primaryColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.camera_alt,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
