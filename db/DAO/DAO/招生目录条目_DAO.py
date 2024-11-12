import abc

class 招生目录条目_DAO(metaclass=abc.ABCMeta):
    # 增加招生目录条目
    @abc.abstractmethod
    def insert_招生目录条目(self, 招生目录条目):
        pass

    # 删除招生目录条目
    @abc.abstractmethod
    def delete_招生目录条目(self, 招生目录条目ID):
        pass

    # 更新招生目录条目信息
    @abc.abstractmethod
    def update_招生目录条目(self, 招生目录条目, 招生目录条目ID):
        pass

    # 按照ID查找招生目录条目
    @abc.abstractmethod
    def select_招生目录条目_by_id(self, 招生目录条目ID):
        pass

    # 查找所有招生目录条目
    @abc.abstractmethod
    def select_all_招生目录条目(self):
        pass
