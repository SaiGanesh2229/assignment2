class InvalidCourseDataException(Exception):
    def __init__(self, message="Invalid course data."):
        self.message = message
        super().__init__(self.message)
