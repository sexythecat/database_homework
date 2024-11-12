import abc

class 总成绩_DAO(metaclass=abc.ABCMeta):
    # 增加总成绩
    @abc.abstractmethod
    def insert_总成绩(self, 总成绩):
        pass

    # 删除总成绩
    @abc.abstractmethod
    def delete_总成绩(self, 总成绩ID):
        pass

    # 更新总成绩信息
    @abc.abstractmethod
    def update_总成绩(self, 总成绩, 总成绩ID):
        pass

    # 按照ID查找总成绩
    @abc.abstractmethod
    def select_总成绩_by_id(self, 总成绩ID):
        pass

    # 查找所有总成绩
    @abc.abstractmethod
    def select_all_总成绩(self):
        pass
