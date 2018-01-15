DROP TABLE IF EXISTS students;

CREATE TABLE students (

  id SERIAL PRIMARY KEY,
  name TEXT,
  gender TEXT,
  age INT,
  best_subject TEXT,
  year INT

);

INSERT INTO students (name, gender, age, best_subject, year) VALUES ('Name 1' , 'Gender 1', '1', 'Best subject 1', '1');
INSERT INTO students (name, gender, age, best_subject, year) VALUES ('Name 2' , 'Gender 2', '2', 'Best subject 2', '2');
INSERT INTO students (name, gender, age, best_subject, year) VALUES ('Name 3' , 'Gender 3', '3', 'best subject 3', '3');
INSERT INTO students (name, gender, age, best_subject, year) VALUES ('Name 4' , 'Gender 4', '4', 'Best subject 4', '4');


UPDATE students SET name='Stanislav Ferapoont', gender='Male', age='15', best_subject='Physics', year='11' WHERE id = '1';
UPDATE students SET name='Mordred Lesley', gender='Male', age='15', best_subject='English', year='11' WHERE id = '2';
UPDATE students SET name='Elisabeth Eileen', gender='Female', age='14', best_subject='Biology', year='10' WHERE id = '3';
UPDATE students SET name='Harrieta Sofya', gender='Female', age='14', best_subject='Mathematics', year='10' WHERE id = '4';
