from entity.enrollment import Enrollment
from entity.payment import Payment
from exception.duplicate_enrollment_exception import DuplicateEnrollmentException
from exception.course_not_found_exception import CourseNotFoundException
from exception.student_not_found_exception import StudentNotFoundException
from exception.teacher_not_found_exception import TeacherNotFoundException
from exception.payment_validation_exception import PaymentValidationException


class SIS:
    def __init__(self):
        self.students = []
        self.courses = []
        self.enrollments = []
        self.teachers = []
        self.payments = []

    def enroll_student_in_course(self, student, course):
        if student not in self.students:
            raise StudentNotFoundException()
        if course not in self.courses:
            raise CourseNotFoundException()
        for enrollment in self.enrollments:
            if enrollment.student == student and enrollment.course == course:
                raise DuplicateEnrollmentException()
        enrollment = Enrollment(
            len(self.enrollments) + 1, student, course, "2023-01-01"
        )
        self.enrollments.append(enrollment)
        student.enroll_in_course(course)

    def assign_teacher_to_course(self, teacher, course):
        if teacher not in self.teachers:
            raise TeacherNotFoundException()
        if course not in self.courses:
            raise CourseNotFoundException()
        course.assign_teacher(teacher)
        teacher.assigned_courses.append(course)

    def record_payment(self, student, amount, payment_date):
        if student not in self.students:
            raise StudentNotFoundException()
        if amount <= 0:
            raise PaymentValidationException("Payment amount must be positive.")
        payment = Payment(len(self.payments) + 1, student, amount, payment_date)
        self.payments.append(payment)
        student.make_payment(amount, payment_date)

    def generate_enrollment_report(self, course):
        if course not in self.courses:
            raise CourseNotFoundException()
        enrollments = [
            enrollment for enrollment in self.enrollments if enrollment.course == course
        ]
        print(f"Enrollment Report for {course.course_name}:")
        for enrollment in enrollments:
            print(f" - {enrollment.student.first_name} {enrollment.student.last_name}")

    def generate_payment_report(self, student):
        if student not in self.students:
            raise StudentNotFoundException()
        payments = [payment for payment in self.payments if payment.student == student]
        print(f"Payment Report for {student.first_name} {student.last_name}:")
        for payment in payments:
            print(f" - Amount: {payment.amount} on {payment.payment_date}")

    def calculate_course_statistics(self, course):
        if course not in self.courses:
            raise CourseNotFoundException()
        enrollments = [
            enrollment for enrollment in self.enrollments if enrollment.course == course
        ]
        total_payments = sum(
            payment.amount
            for payment in self.payments
            if payment.student in [enrollment.student for enrollment in enrollments]
        )
        print(f"Course Statistics for {course.course_name}:")
        print(f" - Number of Enrollments: {len(enrollments)}")
        print(f" - Total Payments: {total_payments}")

    def __str__(self):
        return f"SIS with {len(self.students)} students, {len(self.courses)} courses, {len(self.enrollments)} enrollments, {len(self.teachers)} teachers, and {len(self.payments)} payments"
