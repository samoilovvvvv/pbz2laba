CREATE TABLE company
(
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(25),
    telephone VARCHAR(25),
    email VARCHAR(25),
    address VARCHAR(25)
);

INSERT INTO company(name,telephone,email,address
)
VALUES 
( 'Company', '567567567567', 'С@gmail.com', 'Неманская 57'),
( 'Samoilov & CO', '444444444', 'sama@gmail.com', 'Гикало 9'),
( 'BSUIR Corparation', '43434343', 'bsuir', 'Немига 24');

CREATE TABLE price
(
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    price INTEGER,
    date VARCHAR(15)
);

INSERT INTO price(price,date)
VALUES 
( '500', '10.10.2020'),
( '1000', '05.08.2019'),
( '700', '10.05.2020');

CREATE TABLE course
(
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(25),
    type VARCHAR(25),
    count_of_days INTEGER,
    count_of_trainees INTEGER,
    id_price INTEGER,
    FOREIGN KEY (id_price) REFERENCES price(id)
);

INSERT INTO course(name,type,count_of_days,count_of_trainees,
id_price)
VALUES 
( 'Java', 'ИТ', '20', '10', '1'),
( 'Управление бизнесом', 'Менеджмент', '10', '40', '3'),
( 'Молния', 'Вождение автомобиля', '30', '10', '4');


CREATE TABLE organization
(
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_course INTEGER,
    name VARCHAR(25),
    address VARCHAR(25),
    telephone VARCHAR(25),
    email VARCHAR(25),
    FOREIGN KEY (id_course) REFERENCES course(id)
);

INSERT INTO organization(id_course,name,address,telephone,
email)
VALUES 
( '4', 'Training center', 'Мельникайте 2', '234235', 'tcenter@gmail.com'),
( '5', 'Gods of business', 'Янки Купалы 13', '3534534', 'godsofB@mail.ru'),
( '6', 'Автошкола Стрела', 'Независимости 44', '457563', 'arrow123@gmail.com');


CREATE TABLE teacher
(
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(25),
    birthday VARCHAR(15),
    gender VARCHAR(15),
    education VARCHAR(25),
    category VARCHAR(25)
);

INSERT INTO teacher(name,birthday,gender,education,
category)
VALUES 
( 'Фролов', '24.08.1967', 'мужской', 'высшее', 'высшая'),
( 'Аристотель', '19.11.1900', 'мужской', 'высшее', 'высшая'),
( 'Павлов', '26.09.1849', 'мужской', 'высшее', 'высшая');

CREATE TABLE teacher_course
(
    id_teacher INTEGER,
    id_course INTEGER,
    start_date VARCHAR(15),
    end_date VARCHAR(15),
    FOREIGN KEY (id_teacher) REFERENCES teacher(id) ON DELETE CASCADE,
    FOREIGN KEY (id_course) REFERENCES course(id) ON DELETE CASCADE  
);

INSERT INTO teacher_course(id_teacher,id_course,start_date,end_date)
VALUES 
( '1', '7','10.07.2020','30.07.2020'),
( '2', '8','20.07.2020','10.08.2020'),
( '3', '10','15.10.2020','15.11.2020'),
( '4', '9','10.09.2020','10.10.2020');

CREATE TABLE collaborator
(
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(25),
    position VARCHAR(25),
    id_course INTEGER,
    FOREIGN KEY (id_course) REFERENCES course(id) 
);

INSERT INTO collaborator(name,position,id_course
)
VALUES 
( 'Алексей', 'Директор', '8'),
( 'Павел', 'Заместитель', '9'),
( 'Матвей', 'Инженер', '7');


CREATE TABLE company_collaborator
(
    id_collaborator INTEGER,
    id_company INTEGER,
    FOREIGN KEY (id_collaborator) REFERENCES collaborator(id) ,
    FOREIGN KEY (id_company) REFERENCES company(id) 
);

INSERT INTO company_collaborator(id_collaborator,id_company)
VALUES 
( '10', '1'),
( '11', '3'),
( '12', '2'),
( '13', '5'),
( '14', '2'),
( '15', '1');


CREATE TABLE bid
(
    id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_company INTEGER,
    id_course INTEGER,
    term INTEGER,
    count_of_trainees INTEGER,
    FOREIGN KEY (id_company) REFERENCES company(id),
    FOREIGN KEY (id_course) REFERENCES course(id)
);

INSERT INTO bid(id_company,id_course,term,count_of_trainees)
VALUES 
( '1', '7', '10', '5'),
( '2', '8', '20', '20'),
( '3', '9', '30', '10');
