import abc

class 学科_DAO(metaclass=abc.ABCMeta):
    # 增加学科
    @abc.abstractmethod
    def insert_学科(self, 学科):
        pass

    # 删除学科
    @abc.abstractmethod
    def delete_学科(self, 学科ID):
        pass

    # 更新学科信息
    @abc.abstractmethod
    def update_学科(self, 学科, 学科ID):
        pass

    # 按照ID查找学科
    @abc.abstractmethod
    def select_学科_by_id(self, 学科ID):
        pass

    # 查找所有学科
    @abc.abstractmethod
    def select_all_学科(self):
        pass
