import abc

class 属于_DAO(metaclass=abc.ABCMeta):
    # 增加属于记录
    @abc.abstractmethod
    def insert_属于(self, 导师ID, 学院ID):
        pass

    # 删除属于记录
    @abc.abstractmethod
    def delete_属于(self, 导师ID, 学院ID):
        pass

    # 按照导师ID和学院ID查找属于记录
    @abc.abstractmethod
    def select_属于_by_id(self, 导师ID, 学院ID):
        pass

    # 查找所有属于记录
    @abc.abstractmethod
    def select_all_属于(self):
        pass
