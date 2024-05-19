from dao.implementation import DAOImplementation
from entity.payment import Payment
from entity.teacher import Teacher
from util.db_conn_util import DBConnUtil
from util.db_property_util import DBPropertyUtil
from entity.student import Student
from entity.course import Course
from entity.enrollment import Enrollment
from sis import SIS


def main():
    # Establish database connection
    connection_string = DBPropertyUtil.get_connection_string()
    conn = DBConnUtil.get_connection(connection_string)

    if conn:
        # Initialize DAO implementation
        dao = DAOImplementation(conn)

        # Initialize SIS system with DAO
        sis = SIS(dao)

        # Create a new student object for John Doe
        john_doe = Student(
            first_name="John",
            last_name="Doe",
            date_of_birth="1995-08-15",
            email="john.doe@example.com",
            phone_number="123-456-7890",
        )

        # Insert John Doe's information into the database and retrieve his student ID
        john_doe_id = dao.insert_student(john_doe)

        if john_doe_id:
            # Retrieve course IDs for "Introduction to Programming" and "Mathematics 101" from the database
            course1_id = dao.get_course_id_by_name("Introduction to Programming")
            course2_id = dao.get_course_id_by_name("Mathematics 101")

            # Enroll John Doe in the specified courses
            enrollment1 = Enrollment(student_id=john_doe_id, course_id=course1_id)
            enrollment2 = Enrollment(student_id=john_doe_id, course_id=course2_id)

            # Insert enrollment records into the database
            dao.insert_enrollment(enrollment1)
            dao.insert_enrollment(enrollment2)

            print("John Doe has been successfully enrolled in the specified courses.")
        else:
            print("Failed to create a new student record for John Doe.")

        course_code = "CS302"
        course = dao.get_course_by_code(course_code)

        if course:
            # Create a new teacher object for Sarah Smith
            sarah_smith = Teacher(
                first_name="Sarah",
                last_name="Smith",
                email="sarah.smith@example.com",
                expertise="Computer Science",
            )

            # Assign Sarah Smith as the instructor for the course
            course.assign_teacher(sarah_smith)

            # Update the course record in the database with the new instructor information
            dao.update_course(course)

            print(
                "Sarah Smith has been successfully assigned as the instructor for the course."
            )
        else:
            print(f"Course with code {course_code} not found.")

        student_id = 101
        jane_johnson = dao.get_student_by_id(student_id)

        if jane_johnson:
            # Create a new payment object for Jane Johnson
            payment_amount = 500.00
            payment_date = "2023-04-10"
            payment = Payment(
                student_id=student_id, amount=payment_amount, payment_date=payment_date
            )

            # Record the payment information in the database
            dao.record_payment(payment)

            # Update Jane's outstanding balance in the database based on the payment amount
            jane_johnson.update_balance(payment_amount)

            print("Payment recorded successfully for Jane Johnson.")
        else:
            print(f"Student with ID {student_id} not found.")

        course = dao.get_course_by_name(course_name)


def get_enrollments(course_name):
    # Establish database connection
    connection_string = DBPropertyUtil.get_connection_string()
    conn = DBConnUtil.get_connection(connection_string)

    if conn:
        # Initialize DAO implementation
        dao = DAOImplementation(conn)

        # Retrieve course record from the database based on the course name
        course = dao.get_course_by_name(course_name)
        if course:
            # Retrieve enrollment records from the database for the specified course
            enrollments = dao.get_enrollments_by_course(course)

            if enrollments:
                # Generate the enrollment report
                print(f"Enrollment Report for Course: {course_name}")
                print("===================================")
                print("Student ID | Student Name")
                print("-----------------------------------")
                for enrollment in enrollments:
                    student_name = f"{enrollment.student.first_name} {enrollment.student.last_name}"
                    print(f"{enrollment.student.student_id} | {student_name}")
                print("-----------------------------------")
                print(f"Total Enrollments: {len(enrollments)}")
            else:
                print(f"No enrollments found for course: {course_name}")
        else:
            print(f"Course with name {course_name} not found.")
        # Close connection
        conn.close()
    else:
        print("Connection to database failed.")


if __name__ == "__main__":
    course_name = "Computer Science 101"
    get_enrollments(course_name)
