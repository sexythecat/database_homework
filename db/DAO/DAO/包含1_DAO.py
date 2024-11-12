import abc

class 包含1_DAO(metaclass=abc.ABCMeta):
    # 增加包含1条目
    @abc.abstractmethod
    def insert_包含1(self, 包含1):
        pass

    # 删除包含1条目
    @abc.abstractmethod
    def delete_包含1(self, 志愿ID, 学科ID):
        pass

    # 查询某个包含1条目
    @abc.abstractmethod
    def select_包含1_by_id(self, 志愿ID, 学科ID):
        pass

    # 查询所有包含1条目
    @abc.abstractmethod
    def select_all_包含1(self):
        pass
