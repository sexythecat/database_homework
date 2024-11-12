import abc

class 考生_DAO(metaclass=abc.ABCMeta):
    # 增加考生
    @abc.abstractmethod
    def insert_考生(self, 考生):
        pass

    # 删除考生
    @abc.abstractmethod
    def delete_考生(self, 考生ID):
        pass

    # 更新考生信息
    @abc.abstractmethod
    def update_考生(self, 考生, 考生ID):
        pass

    # 按照ID查找考生
    @abc.abstractmethod
    def select_考生_by_id(self, 考生ID):
        pass

    # 查找所有考生
    @abc.abstractmethod
    def select_all_考生(self):
        pass
