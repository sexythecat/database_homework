import abc

class 从属_DAO(metaclass=abc.ABCMeta):
    # 增加从属记录
    @abc.abstractmethod
    def insert_从属(self, 导师ID, 学科ID):
        pass

    # 删除从属记录
    @abc.abstractmethod
    def delete_从属(self, 导师ID, 学科ID):
        pass

    # 按照导师ID和学科ID查找从属记录
    @abc.abstractmethod
    def select_从属_by_id(self, 导师ID, 学科ID):
        pass

    # 查找所有从属记录
    @abc.abstractmethod
    def select_all_从属(self):
        pass
