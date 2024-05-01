import 'package:flutter/material.dart';

class WhatsAppsUIDesign extends StatefulWidget {
  static const String routeName = 'whatsapp';
  const WhatsAppsUIDesign({super.key});

  @override
  State<WhatsAppsUIDesign> createState() => _WhatsAppsUIDesignState();
}

class _WhatsAppsUIDesignState extends State<WhatsAppsUIDesign> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          centerTitle: false,
          title: const Text('WhatsApp '),
          bottom: const TabBar(tabs: [
            Tab(
              child: Icon(Icons.camera_alt),
            ),
            Tab(
              child: Text('Chats'),
            ),
            Tab(
              child: Text('Status'),
            ),
            Tab(
              child: Text('Calls'),
            ),
            //Text('ok')

           
          ]),
          actions:   [
            const Icon(Icons.search),
            const SizedBox(
              height: 10,
            ),
            PopupMenuButton(
              icon: const Icon(Icons.more_vert),
                itemBuilder: (context) =>[
                  const PopupMenuItem(
                    value: 1,
                    child: Text('New Group'),
                  ),
                  const PopupMenuItem(
                    value: 1,
                    child: Text('Settings'),
                  ),
                  const PopupMenuItem(
                    value: 1,
                    child: Text('LogOut'),
                  ),
                ]


            ),
            //Icon(Icons.more_vert),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
        body:  TabBarView(
            children: [
              const Text('Camera'),
              ListView.builder(
                itemCount: 5,
                  itemBuilder: (context, index){
                return const ListTile(
                  leading: CircleAvatar(child: Image(image: AssetImage('assets/images/sharif1.png'))),
                  title: Text('MD Robayet Bin Rahat'),
                  subtitle: Text('How are You?'),
                  trailing: Text('10:54 PM'),
                );

              }),
              //Text('Chat'),
              //Text('Status'),
              ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index){
                    if(index ==0){
                      return  Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('New Update'),
                            ListTile(
                              leading: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.green,
                                        width: 3,
                                      )

                                  ),
                                  child: const CircleAvatar(child: Image(image: AssetImage('assets/images/sharif1.png')))),
                              contentPadding: EdgeInsets.zero,
                              title: const Text('MD Robayet Bin Rahat'),
                              subtitle: Text('35 Minutes ago'),
                              //trailing: Icon(index /2 ==0? Icons.phone : Icons.video_call ),
                            ),
                          ],
                        ),
                      );
                    } else{
                      return  ListTile(
                        leading: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.green,
                                  width: 3,
                                )

                            ),
                            child: const CircleAvatar(child: Image(image: AssetImage('assets/images/sharif1.png')))),
                        contentPadding: EdgeInsets.zero,
                        title: const Text('MD Robayet Bin Rahat'),
                        subtitle: Text('35 Minutes ago'),
                        //trailing: Icon(index /2 ==0? Icons.phone : Icons.video_call ),
                      );
                    }

                  }),
              ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index){
                    return  ListTile(
                      leading: CircleAvatar(child: Image(image: AssetImage('assets/images/sharif1.png'))),
                      contentPadding: EdgeInsets.zero,
                      title: const Text('MD Robayet Bin Rahat'),
                      subtitle: Text(index/2 ==0 ? 'you missed a audio call': 'Call Time 10:54 PM'),
                      trailing: Icon(index /2 ==0? Icons.phone : Icons.video_call ),
                    );

                  }),
              //Text('Calls'),
            ]
        ),

      ),
    );
  }
}
