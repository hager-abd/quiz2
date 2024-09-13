import'dart:io';
void main(){
  int id=0;
  String? title;
  String?status;
  String?description;
  List<dynamic> tasks = [];
  addTask(){
    stdout.write('Enter title: ');
     title=stdin.readLineSync();
    stdout.write('Enter Status: ');
    status=stdin.readLineSync();
    stdout.write('Enter Description: ');
    description=stdin.readLineSync();

  }

  Map<String,dynamic> viewTasks(){
    Map<String,dynamic> view={'id':++id,'title':title,'Status':status,'Description':description} ;
    print(view);
    return view;
  }
  void deleteTask() {
    stdout.write('Enter task ID to delete: ');
    String? x=stdin.readLineSync();
    int? id = int.tryParse(x ?? '');

    if (id == null || !tasks.any((task) => task.id == id)) {
      print('Task with ID $id not found.');
      return;
    }
    tasks.removeWhere((task) => task.id == id);
    print('Task deleted successfully.');
  }
  void UpdateTask() {
    stdout.write('Enter task ID to update: ');
    String? x=stdin.readLineSync();
    int? id = int.tryParse(x ?? '');
    if (id == null || !tasks.any((task) => task.id == id)) {
      print('Task with ID $id not found.');
      return;
    }
    dynamic task = tasks.firstWhere((task) => task.id == id);

    stdout.write('Enter new title ${task.title}');
    String? newTitle = stdin.readLineSync();

    stdout.write('Enter new status ${task.status}');
    String? newStatus = stdin.readLineSync();

    stdout.write('Enter new description ${task.description} ');
    String? newDescription = stdin.readLineSync();

    if (newTitle != null && newTitle.isNotEmpty) task.title = newTitle;
    if (newStatus != null && newStatus.isNotEmpty) task.status = newStatus;
    if (newDescription != null && newDescription.isNotEmpty) task.description = newDescription;

    print('Task updated successfully.');
  }
  void exit(){
    print('exit the program');
  }
   while (true){print(' List Menu:');
    print('1. ViewTasks');
    print('2. AddTask');
    print('3. UpdateTask');
    print('4. DeleteTask');
    print('5. Exit');
    stdout.write('Select an option (1-5):');
  dynamic choice = stdin.readLineSync();
  switch (choice) {
    case '1':
      tasks.add(addTask());

      break;
    case '2':
      viewTasks();
      break;
    case '3':
      UpdateTask();
      break;
    case '4':
      deleteTask();
      break;
    case '5':
      print('Exiting the program.');
      return;
    default:
      print('Invalid option. Please try again.');
  }}


  addTask();
  viewTasks();
  //deleteTask();
  UpdateTask();
  exit();
}
