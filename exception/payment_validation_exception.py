class PaymentValidationException(Exception):
    def __init__(self, message="Invalid payment data."):
        self.message = message
        super().__init__(self.message)
