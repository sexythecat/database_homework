import abc

class 学院_DAO(metaclass=abc.ABCMeta):
    # 增加学院
    @abc.abstractmethod
    def insert_学院(self, 学院):
        pass

    # 删除学院
    @abc.abstractmethod
    def delete_学院(self, 学院ID):
        pass

    # 更新学院信息
    @abc.abstractmethod
    def update_学院(self, 学院, 学院ID):
        pass

    # 按照ID查找学院
    @abc.abstractmethod
    def select_学院_by_id(self, 学院ID):
        pass

    # 查找所有学院
    @abc.abstractmethod
    def select_all_学院(self):
        pass
