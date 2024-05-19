class DuplicateEnrollmentException(Exception):
    def __init__(self, message="Student is already enrolled in the course."):
        self.message = message
        super().__init__(self.message)
