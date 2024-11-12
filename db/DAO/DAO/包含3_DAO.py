import abc

class 包含3_DAO(metaclass=abc.ABCMeta):
    # 增加包含3记录
    @abc.abstractmethod
    def insert_包含3(self, 招生目录ID, 招生目录条目ID):
        pass

    # 删除包含3记录
    @abc.abstractmethod
    def delete_包含3(self, 招生目录条目ID):
        pass

    # 按照招生目录条目ID查找包含3记录
    @abc.abstractmethod
    def select_包含3_by_id(self, 招生目录条目ID):
        pass

    # 查找所有包含3记录
    @abc.abstractmethod
    def select_all_包含3(self):
        pass
