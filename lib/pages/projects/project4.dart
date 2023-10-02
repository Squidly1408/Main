// packages
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// pages
import '../../main.dart';

// widgets
import '../../models/projects.dart';
import '../../widgets/header.dart';

class Project4 extends StatefulWidget {
  const Project4({super.key});

  @override
  State<Project4> createState() => _Project4State();
}

class _Project4State extends State<Project4> {
  // project data
  final _project = Projects(
    // title
    'Enter title',
    // description
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque a tristique tellus. In dolor lorem, lobortis sed volutpat eget, placerat pulvinar elit. Vivamus ac vestibulum nunc, id ornare augue. Praesent porta nec neque non pretium. Pellentesque sit amet maximus mi. Duis accumsan non tortor maximus pretium. Cras nunc felis, fringilla et mi at, porttitor lobortis mauris. Aenean semper efficitur pretium. Proin neque ipsum, bibendum vel efficitur eget, accumsan non nulla.',
    // mentors
    [
      'enter mentors name',
      'enter mentors name',
      'enter mentors name',
      'enter mentors name',
    ],
    // resources
    [
      Resources(
        'title',
        'link',
      ),
      Resources(
        'title',
        'link',
      ),
      Resources(
        'title',
        'link',
      ),
      Resources(
        'title',
        'link',
      ),
    ],
  );

  // scaffold
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColour, // black

      // added header which acts as a links / navigation to home / logo
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Header(
          homePage: false,
        ),
      ),

      // Body paragraph
      // need to insert links to pages / sources and all
      body: SizedBox(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  // banner / title / description
                  Stack(
                    children: [
                      // background image
                      Image.asset(
                        'lib/assets/images/projects/project_banner.png',
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

                  // Mentors section
                  Stack(
                    children: [
                      // background image
                      Image.asset(
                        'lib/assets/images/projects/mentors_banner.png',
                        fit: BoxFit.fitWidth,
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // title
                                  Text(
                                    'Mentors:',
                                    style: TextStyle(
                                        color: mainColour,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                  ),
                                  // outlearning list
                                  ListView.builder(
                                    itemCount: _project.mentors.length,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => TextButton(
                                      onPressed: () => {},
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4.0),
                                              child: Icon(
                                                Icons.person_pin_rounded,
                                                color: secondaryColour3,
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02,
                                              ),
                                            ),
                                            Text(
                                              _project.mentors[index]
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
                                      ),
                                    ),
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
                  Stack(
                    children: [
                      // background image
                      Image.asset(
                        'lib/assets/images/projects/resources_banner.png',
                        fit: BoxFit.fitWidth,
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.65,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // title
                                  Text(
                                    'Resources:',
                                    style: TextStyle(
                                        color: mainColour,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                  ),
                                  // outlearning list
                                  ListView.builder(
                                    itemCount: _project.mentors.length,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => TextButton(
                                      onPressed: () => {
                                        launchUrl(
                                          Uri.parse(
                                              _project.resources[index].link),
                                        ),
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            _project.resources[index].text
                                                .toString(),
                                            style: TextStyle(
                                                color: secondaryColour3,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  // skills section
                  Stack(
                    children: [
                      // background image
                      Image.asset(
                        'lib/assets/images/projects/skills_banner.png',
                        fit: BoxFit.fitWidth,
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // title
                                Text(
                                  'Skills:',
                                  style: TextStyle(
                                      color: mainColour,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04),
                                ),
                                // skills grid
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width >
                                              1000
                                          ? MediaQuery.of(context).size.width *
                                              0.4
                                          : MediaQuery.of(context).size.width *
                                              0.2),
                                  child: GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount:
                                                MediaQuery.of(context)
                                                            .size
                                                            .width >
                                                        1000
                                                    ? 3
                                                    : 5,
                                            childAspectRatio:
                                                MediaQuery.of(context)
                                                            .size
                                                            .width >
                                                        1000
                                                    ? 0.05 / 0.05
                                                    : 0.00005 / 0.00005),
                                    itemCount: 0,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Image.asset(
                                        'lib/assets/images/project2/${index + 1}.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
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
