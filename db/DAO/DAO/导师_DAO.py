import abc

class 导师_DAO(metaclass=abc.ABCMeta):
    # 增加导师
    @abc.abstractmethod
    def insert_导师(self, 导师):
        pass

    # 删除导师
    @abc.abstractmethod
    def delete_导师(self, 导师ID):
        pass

    # 更新导师信息
    @abc.abstractmethod
    def update_导师(self, 导师, 导师ID):
        pass

    # 按照ID查找导师
    @abc.abstractmethod
    def select_导师_by_id(self, 导师ID):
        pass

    # 查找所有导师
    @abc.abstractmethod
    def select_all_导师(self):
        pass
