class InsufficientFundsException(Exception):
    def __init__(self, message="Insufficient funds for enrollment."):
        self.message = message
        super().__init__(self.message)
