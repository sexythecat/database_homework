import abc

class 作为_DAO(metaclass=abc.ABCMeta):
    # 增加作为记录
    @abc.abstractmethod
    def insert_作为(self, 用户ID, 角色ID):
        pass

    # 删除作为记录
    @abc.abstractmethod
    def delete_作为(self, 用户ID):
        pass

    # 按照用户ID查找作为记录
    @abc.abstractmethod
    def select_作为_by_id(self, 用户ID):
        pass

    # 查找所有作为记录
    @abc.abstractmethod
    def select_all_作为(self):
        pass
