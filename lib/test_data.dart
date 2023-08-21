import 'package:task_management_app/project_model.dart';

List<String> sampleTasks = [
  "Create menu in dashboard and make user flow",
"Create button to add new task",
"Create button to add new project",
"Create button to add new task",

];

List<ProjectModel> projects = [
  ProjectModel(title: "Game Design", description: "Design the new game and make avatars move", image: "assets/icons/video-game.png", isActive: true),
  ProjectModel(title: "Team Decision", description: "Edit icons for team task and assign team members", image: "assets/icons/pie-chart.png", isActive: false),
  ProjectModel(title: "Web Design", description: "Design the new website and make it responsive", image: "assets/icons/pie-chart.png", isActive: false),
];