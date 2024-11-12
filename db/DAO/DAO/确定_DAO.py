import abc

class 确定_DAO(metaclass=abc.ABCMeta):
    # 增加确定记录
    @abc.abstractmethod
    def insert_确定(self, 复试结果ID, 导师ID):
        pass

    # 删除确定记录
    @abc.abstractmethod
    def delete_确定(self, 复试结果ID):
        pass

    # 按照复试结果ID查找确定记录
    @abc.abstractmethod
    def select_确定_by_id(self, 复试结果ID):
        pass

    # 查找所有确定记录
    @abc.abstractmethod
    def select_all_确定(self):
        pass
