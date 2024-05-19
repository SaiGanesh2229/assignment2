class InvalidTeacherDataException(Exception):
    def __init__(self, message="Invalid teacher data."):
        self.message = message
        super().__init__(self.message)
