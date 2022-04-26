

import 'package:json_vazifa/model/todos.dart';

void main() async {
  String body=await Todos.GET(Todos.apiTodo,Todos.headers);
  List<Todos?>todos=Todos.parseTodoList(body);
  print(todos);
  Todos todos = Todos(userId: 12, id: 7, title: 'name', completed: false);
  String response=await TodosService.POST(TodosService.apiTodo, TodosService.headers, todos.toJson());
  print("post:$response");

  String response =await TodosService.GET(TodosService.apiTodo+todos.id.toString(), TodosService.headers);
  print("get:$response");

  String response=await TodosService.PUT(TodosService.apiTodo+todos.id.toString(), TodosService.headers, todos.toJson());
  print("put:$response");

  String  response=await TodosService.PATCH(TodosService.apiTodo+todos.toString(), TodosService.headers,
      {'title':"Assalomu alaykum"});
  print("patch:$response");


  String response=await TodosService.DELETE(TodosService.apiTodo+todos.id.toString(), TodosService.headers);
  print("delete:$response");
}
