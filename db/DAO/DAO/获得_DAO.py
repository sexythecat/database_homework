import abc

class 获得_DAO(metaclass=abc.ABCMeta):
    # 增加获得记录
    @abc.abstractmethod
    def insert_获得(self, 考生ID, 复试结果ID):
        pass

    # 删除获得记录
    @abc.abstractmethod
    def delete_获得(self, 考生ID):
        pass

    # 按照考生ID查找获得记录
    @abc.abstractmethod
    def select_获得_by_id(self, 考生ID):
        pass

    # 查找所有获得记录
    @abc.abstractmethod
    def select_all_获得(self):
        pass
