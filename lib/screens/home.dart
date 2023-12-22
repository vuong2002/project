import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../constants/colors.dart';
import '../widgets/todo_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),//tách thanh ứng dụng bằng phương pháp buildAppBar
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              children: [
                searchBox(),
                //Dưới Thanh Search 
                Expanded(//là một widget giúp mở rộng không gian cho một widget con của Row hoặc Column theo trục chính (main axis)
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only( //đệm trên dưới listview
                          top: 50,
                          bottom: 20,
                        ),
                        child: const Text(
                          'Tất cả việc cần làm',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      for (ToDo todoo in _foundToDo.reversed)
                        ToDoItem(
                          todo: todoo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _todoController,
                    decoration: const InputDecoration(
                        hintText: 'Add a new todo item',
                        border: InputBorder.none),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                ),
                child: ElevatedButton(
                  child: const Text(
                    '+',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  onPressed: () {
                    _addToDoItem(_todoController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: tdBlue,
                    minimumSize: const Size(60, 60),
                    elevation: 10,
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: toDo,
      ));
    });
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }
//thanh tìm kếm 
  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),//đệm giữa icon search và search
      decoration: BoxDecoration( //tạo vùng chứa
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField( //tùy chỉnh trường văn bản
        onChanged: (value) => _runFilter(value),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),// đệm nội dung = 0
          prefixIcon: Icon( //icon search
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(//xét Width Height thanh tìm kiếm
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,//loại bỏ đường viền 
          hintText: 'Tìm Kiếm',
          hintStyle: TextStyle(color: tdGrey),
        ),
      ),
    );
  }
// thanh menu
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 0,//cung cấp độ cao bằng 0 để bóng đổ biến mất
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, //ảnh người dùng sang bên phải
        children: [
        const Icon(
          Icons.menu,//biểu tượng menu
          color: tdBlack,
          size: 30,
        ),
        Container(
          height: 40,
          width: 40,
          child: ClipRRect(//cắt lớp con của nó bằng một hình chữ nhật bo tròn
            borderRadius: BorderRadius.circular(20),// bo góc hình tròn với bán kính 20
            child: Image.asset('assets/images/avatar_user.jpg'),
          ),
        ),
      ]),
    );
  }
}
