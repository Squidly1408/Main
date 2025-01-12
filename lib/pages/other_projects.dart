// packages
import 'package:flutter/material.dart';

// pages
import '../../main.dart';

// models
import '../data/page_list.dart';
import '../models/other_projects.dart';

// widgets
import '../../widgets/header.dart';
import '../widgets/scroll_indicator.dart';

class OtherProjectsPage extends StatefulWidget {
  const OtherProjectsPage({
    super.key,
  });

  @override
  State<OtherProjectsPage> createState() => _OtherProjectsPageState();
}

class _OtherProjectsPageState extends State<OtherProjectsPage> {
  final ScrollController _scrollController = ScrollController();
  // project data
  final _project = OtherProjects(
      // title
      'Other projects',
      // description
      'Where I keep a full catalog of each of my projects',
      // projects
      [
        OtherProject(
          // Text
          'Strocoge',
          // Description
          'Strocoge is a glove that is aimed to help provide communication to stroke recovery Patients.',
          // link
          'strocoge',
        ),
        OtherProject(
          // text
          'Comnu',
          // Description
          'Comnu is a AAC or Augmentative and Alternative Communication app is an app to help build or replace communication everyday.',
          // link
          'comnu',
        ),
        OtherProject(
          // text
          'Luvium',
          // Description
          'A database website that lets students and teachers collaborate together.',
          // link
          'luvium',
        ),
        OtherProject(
          // Text
          'Auslan Glove',
          // Description
          'A glove that can understand Australian Sign-language and convert it to a verbal form of communication.',
          // link
          'auslan-glove',
        ),
        OtherProject(
          // Text
          'Portfolio',
          // Description
          'Yes! I designed, developed, tested, improved, and coded this portfolio that you are currently on.',
          // link
          'portfolio',
        ),
      ]);

  // scaffold
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColour, // black
      floatingActionButton:
          ScrollIndicator(scrollController: _scrollController),

      // added header which acts as a links / navigation to home / logo
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Header(
          isProject: false,
          requireHome: true,
        ),
      ),

      // Body paragraph
      // need to insert links to pages / sources and all
      body: SizedBox(
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  // banner / title / description
                  Stack(
                    children: [
                      // background image
                      Image.asset(
                        'lib/assets/images/other_projects/projects_banner.png',
                        fit: BoxFit.fitWidth,
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.65,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // title
                                  Text(
                                    _project.title,
                                    style: TextStyle(
                                        color: mainColour,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                  ),
                                  // description
                                  Text(
                                    _project.description,
                                    style: TextStyle(
                                        color: secondaryColour3,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.02),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  // Resources section
                  ListView.builder(
                    itemCount: _project.projects.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          // background image
                          Image.asset(
                            index != _project.projects.length - 1
                                ? index.isOdd
                                    ? 'lib/assets/images/other_projects/left_middle.png'
                                    : 'lib/assets/images/other_projects/right_middle.png'
                                : index.isOdd
                                    ? 'lib/assets/images/other_projects/left_bottom.png'
                                    : 'lib/assets/images/other_projects/right_bottom.png',
                            fit: BoxFit.fitWidth,
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: index.isEven
                                  ? Alignment.centerLeft
                                  : Alignment.centerRight,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.65,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    child: TextButton(
                                      onPressed: () => {
                                        addPage(context,
                                            '/projects/${_project.projects[index].key}')
                                      },

                                      // text
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.north_west_rounded,
                                                color: secondaryColour3,
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.03,
                                              ),
                                              Text(
                                                _project.projects[index].title
                                                    .toString(),
                                                style: TextStyle(
                                                    color: secondaryColour3,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.02),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            _project.projects[index].description
                                                .toString(),
                                            style: TextStyle(
                                                color: secondaryColour3,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.015),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
