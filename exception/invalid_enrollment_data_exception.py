class InvalidEnrollmentDataException(Exception):
    def __init__(self, message="Invalid enrollment data."):
        self.message = message
        super().__init__(self.message)
