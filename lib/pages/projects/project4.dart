// packages
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// pages
import '../../main.dart';

// widgets
import '../../models/projects.dart';
import '../../widgets/header.dart';
import '../../widgets/scroll_indicator.dart';

class Project4 extends StatefulWidget {
  const Project4({super.key});

  @override
  State<Project4> createState() => _Project4State();
}

class _Project4State extends State<Project4> {
  final ScrollController _scrollController = ScrollController();
  // project data
  final _project = Projects(
    // title
    'Strocoge',
    // description
    'Strocoge is a project that started out with the Auslan Glove project, where the University of Newcastle and I were designing a glove that can translate Auslan to a verbal form of communication. Strocoge uses the skills and knowledge from the Auslan glove project but with a different goal, the aim is to create a glove that can aid stroke recovery patients, by allowing a better form of communication between the user and others. It does this via multiple sensors in the glove.',
    // mentors
    [
      'Dr Jacqueline Bailey - Associate Professor UON',
      'Dr Alexandre Mendes - Senior Lecturer UON',
      '',
      '',
    ],
    // resources
    [
      Resources(
        'changes documentation',
        'https://1drv.ms/w/c/f6929fc1ab5f8e55/EWfcislCz9dPv_-Aw0zqIQwBIr0RZadkHSWK1J_hXy8kGQ?e=D20naJ',
      ),
      Resources(
        '',
        'link',
      ),
      Resources(
        '',
        'link',
      ),
      Resources(
        '',
        'link',
      ),
    ],
  );

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
          isProject: true,
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
                                    itemExtent: MediaQuery.of(context)
                                                .size
                                                .width >
                                            1000
                                        ? MediaQuery.of(context).size.width *
                                            0.05
                                        : MediaQuery.of(context).size.width *
                                            0.07,
                                    itemBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            _project.mentors[index].toString(),
                                            style: TextStyle(
                                                color: secondaryColour3,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.02),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
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
                                    itemExtent: MediaQuery.of(context)
                                                .size
                                                .width >
                                            1000
                                        ? MediaQuery.of(context).size.width *
                                            0.05
                                        : MediaQuery.of(context).size.width *
                                            0.07,
                                    itemBuilder: (context, index) => Visibility(
                                      visible: _project
                                          .resources[index].text.isNotEmpty,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: TextButton.icon(
                                          onPressed: () => {
                                            launchUrl(
                                              Uri.parse(_project
                                                  .resources[index].link),
                                            ),
                                          },
                                          // icon
                                          icon: Icon(
                                            Icons.north_west_rounded,
                                            color: secondaryColour3,
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.03,
                                          ),
                                          // text
                                          label: Text(
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
                                    itemCount: 5,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Image.asset(
                                        'lib/assets/images/project4/${index + 1}.png',
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
