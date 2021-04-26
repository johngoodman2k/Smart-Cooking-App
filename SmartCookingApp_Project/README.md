## Installation

### B1: Phần mềm chạy code: IntelliJ IDEA Ultimate.

### B2: Mở Project([ở Folder](https://github.com/johngoodman2k/Smart-Cooking-App/tree/main/SmartCookingApp_Project/scWebApp)).

### B3: Add sever Tomcat ([Folder Tomcat](https://github.com/johngoodman2k/Smart-Cooking-App/tree/main/SmartCookingApp_Project/tool-sever)
)
-Lưu ý:
 - Nếu bạn chưa cài đặt JDK 16 phần mềm sẽ nhắc bạn cài đặt nó.
 - Nếu chương trình đã add sẵn sever Tomcat thì có thể bỏ qua bước này. Nếu chưa add sever Tomcat đọc hướng dẫn [ở đây](https://github.com/johngoodman2k/Smart-Cooking-App/tree/main/SmartCookingApp_Project/tool-sever)

B4: Chạy thử web với những url bên dưới
	- http://localhost:8080/scWeb/Home
	- http://localhost:8080/scWeb/Account/Login
	- http://localhost:8080/scWeb/Account/Register


## Library ([file pom.xml](https://github.com/johngoodman2k/Smart-Cooking-App/blob/main/SmartCookingApp_Project/scWebApp/pom.xml))
- Dưới đây là những thư viện được thêm vào project
<!-- taglibs -->
	<dependency>
            <groupId>org.apache.taglibs</groupId>
            <artifactId>taglibs-standard-spec</artifactId>
            <version>1.2.5</version>
        </dependency>

        <dependency>
            <groupId>org.apache.taglibs</groupId>
            <artifactId>taglibs-standard-impl</artifactId>
            <version>1.2.5</version>
        </dependency>
<!-- https://mvnrepository.com/artifact/org.sql2o/sql2o -->
        <dependency>
            <groupId>org.sql2o</groupId>
            <artifactId>sql2o</artifactId>
            <version>1.5.4</version>
        </dependency>

        <!-- https://mvnrepository.com/artifact/mysql/mysql-connector-java -->
        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
            <version>8.0.22</version>
            <scope>provided</scope>
        </dependency>

<!-- bcrypt  -->
        <dependency>
            <groupId>at.favre.lib</groupId>
            <artifactId>bcrypt</artifactId>
            <version>0.9.0</version>
        </dependency>



