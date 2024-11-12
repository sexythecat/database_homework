import abc

class 拥有_DAO(metaclass=abc.ABCMeta):
    # 增加拥有条目
    @abc.abstractmethod
    def insert_拥有(self, 拥有):
        pass

    # 删除拥有条目
    @abc.abstractmethod
    def delete_拥有(self, 考生ID, 总成绩ID):
        pass

    # 查询某个拥有条目
    @abc.abstractmethod
    def select_拥有_by_id(self, 考生ID, 总成绩ID):
        pass

    # 查询所有拥有条目
    @abc.abstractmethod
    def select_all_拥有(self):
        pass
