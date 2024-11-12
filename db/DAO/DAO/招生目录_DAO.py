import abc

class 招生目录_DAO(metaclass=abc.ABCMeta):
    # 增加招生目录
    @abc.abstractmethod
    def insert_招生目录(self, 招生目录):
        pass

    # 删除招生目录
    @abc.abstractmethod
    def delete_招生目录(self, 招生目录ID):
        pass

    # 更新招生目录信息
    @abc.abstractmethod
    def update_招生目录(self, 招生目录, 招生目录ID):
        pass

    # 按照ID查找招生目录
    @abc.abstractmethod
    def select_招生目录_by_id(self, 招生目录ID):
        pass

    # 查找所有招生目录
    @abc.abstractmethod
    def select_all_招生目录(self):
        pass
