# Практическая работа №6

### Тема: Работа с Conduit
### Цель работы: реализовать cоздание API при помощи пакета Conduit. Функции: регистрация, авторизация, RefreshToken, Вывод данных пользователя, редактирование данных пользователя, изменение пароля пользователя, CRUD действия по теме, поиск, фильтрация, логическое удаление и восстановление, история действий.

###
### Ход работы:
### Для начала работы необходимо создать новую базу данных в PgAdmin для того, чтобы в дальнейшем создать там таблицы.
![image](https://user-images.githubusercontent.com/99389490/216460416-d8e97b5c-e447-4682-8e43-cd1541f91553.png)
###
### После в папку проекта необходимо положить файл database.yaml с характеристиками базы данных, такие как: юзернейм, пароль, хост, порт, имя базы данных. 
![image](https://user-images.githubusercontent.com/99389490/216460512-8165eed9-8741-46b4-a492-7e8eda44f191.png)
### 
### 
!
### После создается новый терминал, где необходимо применить команды: "dart pub run conduit:conduit db generate", "dart pub run conduit:conduit db validate", "dart pub run conduit:conduit db upgrade" для инициализации БД в pgAdmin.
### 
!
###
### Далее необходимо перейти к созданию сущностей. Список готовых сущностей представлен ниже.
![image](https://user-images.githubusercontent.com/99389490/216460863-2d823533-f393-4d04-80b0-ccfce0ee5364.png)
###
### После необходимо перейти к реализации регистрации. Для этого понадобятся файлы "user.dart" и "app_auth_controller". В сущности пользователя хранятся элементы таблицы, такие как: имя пользователя, почта, пароль, accessToken, refreshToken, также salt и hashPassword. Для регистрации был использован метод PUT. После необходимо протестировать работоспособность регистрации в Thunder Client с помощью запроса "http://localhost:8888/token"
![image](https://user-images.githubusercontent.com/99389490/216460993-6bccd3a8-50b8-4c96-8cad-70d64c083959.png)
![image](https://user-images.githubusercontent.com/99389490/216461246-052b27e3-0480-4188-ae24-905605a87912.png)
![image](https://user-images.githubusercontent.com/99389490/216461288-dd066ecf-f0af-42aa-a15e-7ba818034dbf.png)
###
### Далее необходимо перейти к реализации авторизации. Для этого так же понадобятся файлы "user.dart" и "app_auth_controller". Для авторизации был использован метод POST. После необходимо протестировать работоспособность авторизации в Thunder Client с помощью запроса "http://localhost:8888/token"
![image](https://user-images.githubusercontent.com/99389490/216461490-f785c98e-8bb2-44b0-884d-ebcad03b729e.png)
![image](https://user-images.githubusercontent.com/99389490/216461565-a18b1003-ef85-4d0b-b1b2-71a338488dd7.png)
###
### Далее необходимо перейти к реализации получения и редактирования профиля. Для этого понадобятся файлы "user.dart" и "app_user_controller". Для получения и редактирования профиля были использованы методы GET и POST. После необходимо протестировать работоспособность авторизации в Thunder Client с помощью запроса "http://localhost:8888/user"
![image](https://user-images.githubusercontent.com/99389490/216461686-2fd3988f-d5f1-45e9-8caa-67a724f25387.png)
![image](https://user-images.githubusercontent.com/99389490/216461786-3cc662bd-e07f-48b5-a851-6c3b87dc5400.png)
![image](https://user-images.githubusercontent.com/99389490/216461828-2df223bc-6516-4e44-b72b-427ecf0319a3.png)
###
###
### Также необходимо реализовать обновление пароля. Для этого понадобятся файлы "user.dart" и "app_user_controller.dart". Для обновления пароля был использован метод POST. После необходимо протестировать работоспособность авторизации в Thunder Client с помощью запроса "http://localhost:8888/user" и указанием параметров query "oldPassword" и "newPassword".
![image](https://user-images.githubusercontent.com/99389490/216462270-9cb01bb5-49dc-4755-960c-09df2fbea39a.png)
![image](https://user-images.githubusercontent.com/99389490/216462161-f9f8d19d-fd49-41db-8a58-a98bf95a9855.png)
###
### На рисунке ниже продемонстрированы данные, которые хранятся в БД.
![image](https://user-images.githubusercontent.com/99389490/216462366-e0f95cf2-3f6e-4228-81bc-c379d85d06df.png)
###
### Далее необходимо перейти к реализации создания заметки. Для этого понадобятся файлы "note.dart" и "app_note_controller". В сущности заметки хранятся элементы таблицы, такие как: число, описание, имя, категория, дата создания, также дата редактирования и логическое удаление. Для создания заметки были использован метод POST. После необходимо протестировать работоспособность авторизации в Thunder Client с помощью запроса "http://localhost:8888/notes?search=/b/". На рисунке будет указано, что заметка не найдена, так как поиск осуществляется не по категории, а по имени, поэтому правильным запросом в данной ситуации будет "http://localhost:8888/notes?search=aboba". Также существует запрос для вывода всех заметок "http://localhost:8888/notes" с методом GET.
!
!
###
### Далее необходимо перейти к реализации поиска заметок. Для этого понадобятся файлы "note.dart" и "app_note_controller". Для поиска заметки были использован метод GET. После необходимо протестировать работоспособность авторизации в Thunder Client с помощью запроса "http://localhost:8888/notes?search=/b/". На рисунке будет указано, что заметка не найдена, так как поиск осуществляется не по категории, а по имени. 
!
! 
###
### Далее необходимо перейти к реализации удаления заметки. Для этого понадобятся файлы "note.dart" и "app_note_controller". Для удаления заметки были использован метод DELETE. После необходимо протестировать работоспособность авторизации в Thunder Client с помощью запроса "http://localhost:8888/notes/3".
!
! 
###
### Далее необходимо перейти к реализации восстановления заметки. Для этого понадобятся файлы "note.dart" и "app_note_controller". Для восстановления заметки понадобился метод GET. После необходимо протестировать работоспособность авторизации в Thunder Client с помощью запроса "http://localhost:8888/notes/5?restore" с использованием query-параметра "restore".
!
!
###
### После необходимо перейти к реализации фильтрации. Для этого понадобятся файлы "note.dart" и "app_note_controller". Для фильтрации используется метод GET. После необходимо протестировать работоспособность авторизации в Thunder Client с помощью запроса "http://localhost:8888/notes?deleted=0" с использованием query-параметра "deleted".
!
!
!
###
### В конце необходимо создать историю всех действий. В сущности истории хранятся элементы таблицы, такие как: id, действие, которое было произведено и дата редактирования. Для создания истории всех действий был использован метод GET. После необходимо протестировать работоспособность авторизации в Thunder Client с помощью запроса "http://localhost:8888/history".
!
!
###
### Вывод: В данной практической работе была произведена первичная работа с Conduit. Были реализованы функции: регистрация, авторизация, RefreshToken, Вывод данных пользователя, редактирование данных пользователя, изменение пароля пользователя, CRUD действия по теме, поиск, фильтрация, логическое удаление и восстановление, история действий.
