Connect sever tommcat her:

B1: Thêm sever tomcat vào project.
Image: ..\SmartCookingApp_Project\tool-sever\Add_Sever_Tomcat.png

B2: Cài đặt sever tomcat
- Ở mục Application server, chọn Configure... để chọn gói phiên bản tomcat 9.045 trong thư mục
tool-sever đã để sẵn trong file project.

 (!) Lưu ý: không nên tải về gói khác ở trên mạng mà xài trược tiếp gói tomcat đã để sẵn trong thư mục tool-sever
vì đã có add thêm một vài thư viện.

- Ở mục Open browser bỏ chọn After lauch và fix warning. Khi bạn nhấn vào fix sẽ chuyển bạn sang mục Deployment
ở đây bạn chọn war exploded (không nén file war).
Image: ..\SmartCookingApp_Project\tool-sever\Default.png và 
..\SmartCookingApp_Project\tool-sever\Fix_Warning.png

- On 'Update' action: Có thể để mặc định.
- JRE: ở mục này nếu chưa phần mềm sẽ yêu cầu bạn tải jdk-16 và automatic thêm vào project cho bạn.

B3: Hoàn thành cài đặt sever tomcat
- Bạn cần nhớ url vì nó là url của web
Image : ..\SmartCookingApp_Project\tool-sever\connection_is_complete.png
