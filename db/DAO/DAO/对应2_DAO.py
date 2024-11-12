import abc

class 对应2_DAO(metaclass=abc.ABCMeta):
    # 增加对应2记录
    @abc.abstractmethod
    def insert_对应2(self, 考生ID, 用户ID):
        pass

    # 删除对应2记录
    @abc.abstractmethod
    def delete_对应2(self, 考生ID):
        pass

    # 按照考生ID查找对应2记录
    @abc.abstractmethod
    def select_对应2_by_id(self, 考生ID):
        pass

    # 查找所有对应2记录
    @abc.abstractmethod
    def select_all_对应2(self):
        pass
