--CREATE INDEX "enrollments_student_course" ON "enrollments" ("student_id", "course_id");
CREATE INDEX "enrollments_student" ON "enrollments" ("student_id");
CREATE INDEX "enrollments_course" ON "enrollments" ("course_id");
CREATE INDEX "course_index" ON "courses" ("id", "department", "semester", "title");
CREATE INDEX "student_name" ON "students" ("department","semester","title");
