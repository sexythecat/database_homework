import abc

class 具有_DAO(metaclass=abc.ABCMeta):
    # 增加具有条目
    @abc.abstractmethod
    def insert_具有(self, 具有):
        pass

    # 删除具有条目
    @abc.abstractmethod
    def delete_具有(self, 学科ID, 招生目录ID):
        pass

    # 查询某个具有条目
    @abc.abstractmethod
    def select_具有_by_id(self, 学科ID, 招生目录ID):
        pass

    # 查询所有具有条目
    @abc.abstractmethod
    def select_all_具有(self):
        pass
