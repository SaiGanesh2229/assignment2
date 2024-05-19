class InvalidStudentDataException(Exception):
    def __init__(self, message="Invalid student data."):
        self.message = message
        super().__init__(self.message)
