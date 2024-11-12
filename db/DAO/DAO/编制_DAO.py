import abc

class 编制_DAO(metaclass=abc.ABCMeta):
    # 增加编制记录
    @abc.abstractmethod
    def insert_编制(self, 学院ID, 招生目录条目ID):
        pass

    # 删除编制记录
    @abc.abstractmethod
    def delete_编制(self, 学院ID):
        pass

    # 按照学院ID查找编制记录
    @abc.abstractmethod
    def select_编制_by_id(self, 学院ID):
        pass

    # 查找所有编制记录
    @abc.abstractmethod
    def select_all_编制(self):
        pass
