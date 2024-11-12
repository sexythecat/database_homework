import abc

class 对应1_DAO(metaclass=abc.ABCMeta):
    # 增加对应1记录
    @abc.abstractmethod
    def insert_对应1(self, 导师ID, 用户ID):
        pass

    # 删除对应1记录
    @abc.abstractmethod
    def delete_对应1(self, 导师ID):
        pass

    # 按照导师ID查找对应1记录
    @abc.abstractmethod
    def select_对应1_by_id(self, 导师ID):
        pass

    # 查找所有对应1记录
    @abc.abstractmethod
    def select_all_对应1(self):
        pass
