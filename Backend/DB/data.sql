CREATE TABLE admin_cordinator (
                                  Admin_Cordinater_ID SERIAL PRIMARY KEY,
                                  Staff_ID INT NOT NULL
);

-- Table structure for table ar
CREATE TABLE ar (
                    AR_ID SERIAL PRIMARY KEY,
                    Staff_ID INT NOT NULL
);

-- Table structure for table attempt
CREATE TABLE attempt (
                         Student_ID INT NOT NULL,
                         Exam_ID INT NOT NULL,
                         Marks INT NOT NULL,
                         Grade VARCHAR(2) NOT NULL, -- Assuming Grade could be "A", "B+", etc.
                         PRIMARY KEY (Student_ID, Exam_ID)
);

-- Table structure for table course
CREATE TABLE course (
                        Course_ID SERIAL PRIMARY KEY,
                        Course_Name VARCHAR(255) NOT NULL,
                        Course_Code VARCHAR(50) NOT NULL,
                        Credits INT NOT NULL,
                        Department_ID INT NOT NULL
);

-- Table structure for table course_offering
CREATE TABLE course_offering (
                                 Offering_ID SERIAL PRIMARY KEY,
                                 Semester VARCHAR(10) NOT NULL,
                                 Start_Date DATE NOT NULL,
                                 End_Date DATE NOT NULL,
                                 Course_ID INT NOT NULL,
                                 Admin_Cordinator_ID INT NOT NULL,
                                 Course_Cordinator INT NOT NULL
);

-- Table structure for table course_register
CREATE TABLE course_register (
                                 Registration_ID SERIAL PRIMARY KEY,
                                 Offering_ID INT NOT NULL
);

-- Table structure for table department
CREATE TABLE department (
                            Department_ID SERIAL PRIMARY KEY,
                            Name VARCHAR(255) NOT NULL,
                            HoD INT NOT NULL
);

-- Table structure for table exam
CREATE TABLE exam (
                      Exam_ID SERIAL PRIMARY KEY,
                      Start_DateTime TIMESTAMP NOT NULL,
                      Duration INTERVAL NOT NULL, -- Assuming duration is stored as "2 hours", "30 minutes", etc.
                      Passing_Criteria INT NOT NULL,
                      Type VARCHAR(50) NOT NULL,
                      Total_Marks INT NOT NULL,
                      Offering_ID INT NOT NULL
);

-- Table structure for table lecture
CREATE TABLE lecture (
                         Lecture_ID SERIAL PRIMARY KEY,
                         Staff_ID INT NOT NULL
);

-- Table structure for table prerequirest
CREATE TABLE prerequirest (
                              Course_ID INT NOT NULL,
                              Req_Course_ID INT NOT NULL,
                              PRIMARY KEY (Course_ID, Req_Course_ID)
);

-- Table structure for table question
CREATE TABLE question (
                          Q_ID SERIAL PRIMARY KEY,
                          Question TEXT NOT NULL,
                          Marks INT NOT NULL,
                          Answer TEXT NOT NULL,
                          Exam_ID INT NOT NULL
);

-- Table structure for table registration
CREATE TABLE registration (
                              Registration_ID SERIAL PRIMARY KEY,
                              Registration_Date DATE NOT NULL,
                              Semester VARCHAR(10) NOT NULL,
                              Time_Stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                              Status VARCHAR(20) NOT NULL, -- Assuming "Pending", "Approved", etc.
                              AR_ID INT NOT NULL,
                              Student_ID INT NOT NULL
);

-- Table structure for table staff
CREATE TABLE staff (
                       Staff_ID SERIAL PRIMARY KEY,
                       Email VARCHAR(255) UNIQUE NOT NULL,
                       NIC VARCHAR(15) UNIQUE NOT NULL, -- Assuming National Identity Card format
                       FullName VARCHAR(255) NOT NULL,
                       Phone_Number VARCHAR(20) NOT NULL,
                       Password TEXT NOT NULL, -- Assuming hashed passwords
                       Department_ID INT NOT NULL
);

-- Table structure for table stored_question
CREATE TABLE stored_question (
                                 Q_ID SERIAL PRIMARY KEY,
                                 Question TEXT NOT NULL,
                                 Answer TEXT NOT NULL,
                                 Marks INT NOT NULL,
                                 Type VARCHAR(50) NOT NULL,
                                 Lecture_ID INT NOT NULL
);

-- Table structure for table student
CREATE TABLE student (
                         Student_ID SERIAL PRIMARY KEY,
                         Email VARCHAR(255) UNIQUE NOT NULL,
                         Full_Name VARCHAR(255) NOT NULL,
                         NIC VARCHAR(15) UNIQUE NOT NULL,
                         Nationality VARCHAR(50) NOT NULL,
                         Photo_Link TEXT, -- Assuming this is a URL or file path
                         Address TEXT NOT NULL,
                         Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female', 'Other')),
                         Phone_No VARCHAR(20) NOT NULL,
                         Department_ID INT NOT NULL,
                         Lecture_ID INT NOT NULL
);

-- Table structure for table teach
CREATE TABLE teach (
                       Lecture_ID INT NOT NULL,
                       Offering_ID INT NOT NULL,
                       PRIMARY KEY (Lecture_ID, Offering_ID)
);