# Flutter ToDo App

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
### Bước 1: Khởi tạo ứng dụng ban đầu

* Mở "Visual Studio Code". Trên thanh công cụ, chọn "View" -> "Command Palette"
* Chọn "Flutter: New Project" -> Tiếp theo, chọn "Application"
* Lựa chọn địa chỉ thư mục muốn lưu trữ project
* Đặt tên project (ví dụ: flutter_todo_app)
* Chạy thử máy ảo với ứng dụng mặc định bằng cách trên thanh công cụ chọn "Run" -> "Start Debugging" (F5)

### Bước 2: Khởi tạo model của questions
* Từ thư mực lib, nhấp chuột phải -> Chọn New Folder -> Đặt tên là models
* Tiếp theo đó, từ thư mực models vừa tạo, nhấp chuột phải -> Chọn New File -> Đặt tên todo.dart

### Bước 3: Khởi tạo biến cố định
* Tạo file biến cố định với tên constants.dart ở vị trí cùng cấp với file main.dart
* Tạo tệp colors.dart và thêm một số màu cần thiết cho ứng dụng 

### Bước 4: Tạo trang chính
* Xóa tất cả các dòng code mặc định
* Tạo myApp widget, loại bỏ debug banner, khởi tạo HomeScreen
* Tạo thư mục screens trong lib -> Tiếp theo, tạo file home.dart -> Trong đó, tạo Home widget -> Gắn đường dẫn của file home.dart vào trong file main.dart

### Bước 5: Thiết kế giao diện người dùng
* tạo thanh menu và avt Thay đổi màu sắc của background và appBar -> Gắn đường dẫn của constants.dart vào trong home.dart
* Tạo thanh tìm kiếm 
* Chế độ xem danh sách và một vài danh sách con 
* Tạo mục việc cần làm : Tạo thêm thư mục widgets trong lib -> Tạo mới file question widget với tên là todo_item.dart trong thư mục widgets -> Gắn đường dẫn của nó vào trong home.dart

### Tạo mục việc cần làm 
* Ở file todo_item.dart , sử dụng kiểu danh sách ListTile , với hình dạng cung cấp là hình chữ nhật và bo góc tròn với bán kính 20px, và set màu của nó.
* Tiếp theo tiến hành làm chi tiết trong ô việc làm 
    + Cung cấp biểu tượng 
    + Đoạn text
    + Biểu tượng xóa 
* Sau khi dựng được khung việc cần làm , bước tiếp theo tiếp tục nhân bản và sửa chữa nội dung 
    + Tạo todo.dart trong models , trong đó sẽ tạo mô hình danh mục cần làm 
    + Tạo biến todoList(sẽ là danh sách việc cần làm từ mô hình việc cần làm) trong home.dart và import file todo.dart vào home.dart
    + Tiếp tục tiến hành thực hiện thao tác đã hoàn thành việc cần làm sẽ bị gạch ngang doạn text 
* Mục cuối cùng sẽ là thêm việc cần làm 
    + Đoạn text
    + Search box
    
### Bước 6: Chức năng của ứng dụng
* Click vào mục việc cần làm sẽ tích vào ô và gạch ngang chữ
* Xóa
* Thêm mục việc cần làm
* Search theo tên

