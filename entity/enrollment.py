class Enrollment:
    def __init__(self, enrollment_id, student, course, enrollment_date):
        self.enrollment_id = enrollment_id
        self.student = student
        self.course = course
        self.enrollment_date = enrollment_date

    def get_student(self):
        return self.student

    def get_course(self):
        return self.course

    def __str__(self):
        return f"Enrollment({self.enrollment_id}, {self.student.student_id}, {self.course.course_id}, {self.enrollment_date})"
