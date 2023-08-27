import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HideAppbarView extends StatefulWidget {
  const HideAppbarView({super.key});

  @override
  State<HideAppbarView> createState() => _HideAppbarViewState();
}

class _HideAppbarViewState extends State<HideAppbarView> with TickerProviderStateMixin {

  late TabController tabController;
 int selectedIndex=0;


  @override
  void initState() {
    // TODO: implement initState

    tabController=TabController(length: 4, vsync: this);

    super.initState();
  }

  setIndex(int index){
    setState(() {
      selectedIndex=index;

      // tabController.animateTo(selectedIndex);
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(

            pinned: true,
            snap: true,
            floating: true,

            backgroundColor: Colors.pink,
            expandedHeight: selectedIndex==0?120:0,
            centerTitle: true,
            title: Text('Appbar'),
            bottom: TabBar(
              unselectedLabelColor: Colors.white,
                labelColor: Colors.black,

                controller: tabController,
                indicatorColor: Colors.white,
                indicatorWeight: 5,
                onTap:setIndex,
                tabs: [
                  Tab(icon:Icon(Icons.home),text: 'Home',),
                  Tab(icon:Icon(Icons.list_alt),text: 'Feed',),
                  Tab(icon:Icon(Icons.person),text: 'Profile',),
                  Tab(icon:Icon(Icons.settings),text: 'Settings',)
                ]),
          )
          // SliverSafeArea(
          //   top: false,
          //
          //   sliver: ,
          //
          // ),
          // SliverOverlapAbsorber(
          //     handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          //   sliver:
          // )


        ],
        body: TabBarView(
          controller: tabController,

            children: [
              buildHomePage('Home Page'),
          buildFeedPage('Feed Page'),
          buildProfilePage('Profile Page'),
          buildSettingsPage('Settings Page')
        ]),
      ),
    );
  }

  Widget buildHomePage(String? text)=>ListView.builder(
    shrinkWrap: true,
    itemCount: 50,
    itemBuilder: (context, index) {
    return Text('$text $index');
  },);

  Widget buildFeedPage(String? text)=>ListView.builder(
    shrinkWrap: true,
    itemCount: 50,
    itemBuilder: (context, index) {
      return Text('$text $index');
    },);


  Widget buildProfilePage(String? text)=>PageView.builder(
    itemCount: 50,
      scrollDirection: Axis.vertical,



      itemBuilder:  (context, index) {
        return AspectRatio(
          aspectRatio: 9/16,

            child: Container(
              color: Colors.white,
              margin: EdgeInsets.only(bottom: 10),
              child: Center(

                  child: Text('$text $index')),
            ));
      },);
  Widget buildSettingsPage(String? text)=>ListView.builder(
    shrinkWrap: true,
    itemCount: 50,
    itemBuilder: (context, index) {
      return Text('$text $index');
    },);




}
