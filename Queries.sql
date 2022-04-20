PROMPT cq2039
/*
Replace zk1 with your NetID

Refer to Database.architect. A version is also given as Database.pdf.

As you can see, there are three tables. Professor lists professors. Student lists students. Instructs lists which professors instruct which students.

Write your SELECT queries below to solve the problems. You are not supposed to run them anywhere, just to write them below.

Use only the operations that were introduced in Unit 4, the conditions pertaining to NULLs, and the CREATE TABLE  ... AS ..., used in the homework.

Base your queries on the operations of selection, projection, cartesian product, minus, union, and intersection, with renaming and creation of new tables. Do not use other operations.

You may use temporary tables, naming them Temp1, Temp2, and so on.

Of course, no need to have operations to DROP tables.

No need to put DISTINCT or ORDER BY as you did in the homework, but you may do that if you like.

Your syntax does not have to be perfect but should be clear, reasonably close to the standard, and unambigous.

*/

-- Problem 1

-- Produce table Answer1(N_P) listing all the N_P that belong to the professors who do not instruct any students.

-- Write your answer below


CREATE TABLE ANSWER1
AS SELECT DISTINCT N_P
FROM Professor
MINUS
SELECT DISTINCT N_P
FROM Instructs;


-- Problem 2

-- Produce table ANSWER2(N_S) listing all the N_S that belong to the students whose names are not known.

-- Write your answer below

CREATE TABLE ANSWER2
AS SELECT DISTINCT N_S
FROM Student
WHERE Name IS NULL;


-- Problem 3

-- Produce table ANSWER3(N_S_1, N_S_2) listing all the pairs (N_S_1, N_S_2)
where N_S_1 and N_S_2 are two different students who got the same grade among the grades they got.

-- To clarify for an example of three students, if student A got grades 1 and 2, student B got grades 2 and 3, and student C got grades 4 and 5; then the pairs (A,B) and (B,A) satisfy the condition as both A and B got the grade 2, but the pair (A,C) does not.


-- Write your answer below

CREATE TABLE ANSWER3
AS SELECT Instructs1.N_S AS N_S_1, Instructs2.N_S AS N_S_2
FROM Instructs Instructs1, Instructs Instructs2
WHERE Instructs1.N_S <> Instructs2.N_S AND Instructs1.Grade=Instructs2.Grade;
