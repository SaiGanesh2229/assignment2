from abc import ABC, abstractmethod


class ServiceProvider(ABC):
    @abstractmethod
    def insert_data(self):
        pass

    @abstractmethod
    def update_data(self):
        pass

    @abstractmethod
    def delete_data(self):
        pass

    @abstractmethod
    def retrieve_data(self):
        pass
