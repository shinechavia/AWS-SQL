CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    DateOfBirth DATE,
    GradeLevel VARCHAR(30)
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(20),
    Credits FLOAT
);

CREATE TABLE Teacher (
    TeacherID INT PRIMARY KEY,
    TeacherName VARCHAR(50),
    DepartmentID INT
);

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    ChairID INT,
    ContactNumber BIGINT,
    Email VARCHAR(50)
);

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    AcademicYear VARCHAR(9),
    Semester VARCHAR(15),
    Date DATE,
    StudentID INT,
    CourseID INT
);

CREATE TABLE Section (
    SectionID INT PRIMARY KEY,
    CourseID INT,
    TeacherID INT,
    Room VARCHAR(10)
);

-- Student table
INSERT INTO Student (StudentID, Name, DateOfBirth, GradeLevel)
VALUES
    (1, 'ShinEchavia', '2023-12-18', '10'),
    (2, 'Eren Yeager', '2023-01-23', '09'),
    (3, 'Armin Arlert', '2023-01-23', '11');

-- Course table
INSERT INTO Course (CourseID, CourseName, Credits)
VALUES
    (101, 'Python', 3),
    (102, 'Networks', 6),
    (103, 'Security', 3);

-- Teacher table
INSERT INTO Teacher (TeacherID, TeacherName, DepartmentID)
VALUES
    (1, 'Mr. Smith', 1),
    (2, 'Ms. Braus', 2),
    (3, 'Mr. Kenny', 1);

-- Department table
INSERT INTO Department (DepartmentID, DepartmentName, ChairID, ContactNumber, Email)
VALUES
    (1, 'Computer Science Department', 1, 9283452851, 'cs@gmail.com'),
    (2, 'Math Department', 2, 9876849561, 'math@gmail.com');

-- Enrollment table
INSERT INTO Enrollment (EnrollmentID, AcademicYear, Semester, Date, StudentID, CourseID)
VALUES
    (1, '2022-2023', '2nd', '2022-09-01', 1, 101),
    (2, '2022-2023', '2nd', '2022-09-01', 2, 102),
    (3, '2022-2023', '2nd', '2022-09-01', 3, 103);

-- Section table
INSERT INTO Section (SectionID, CourseID, TeacherID, Room)
VALUES
    (1, 101, 1, 'Room 101'),
    (2, 102, 2, 'Room 102'),
    (3, 103, 3, 'Room 103');

SELECT s.StudentID, s.Name
FROM Student s
JOIN Enrollment e ON s.StudentID = e.StudentID
JOIN Course c ON e.CourseID = c.CourseID
WHERE c.CourseName = 'Python';

SELECT s.StudentID, s.Name, SUM(c.Credits) AS TotalCredits
FROM Student s
JOIN Enrollment e ON s.StudentID = e.StudentID
JOIN Course c ON e.CourseID = c.CourseID
GROUP BY s.StudentID, s.Name;

SELECT c.CourseID, c.CourseName, COUNT(e.StudentID) AS EnrolledStudents
FROM Course c
LEFT JOIN Enrollment e ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName;

