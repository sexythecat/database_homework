import abc

class 选择_DAO(metaclass=abc.ABCMeta):
    # 增加选择
    @abc.abstractmethod
    def insert_选择(self, 志愿ID, 导师ID):
        pass

    # 删除选择
    @abc.abstractmethod
    def delete_选择(self, 志愿ID):
        pass

    # 按照志愿ID查找选择
    @abc.abstractmethod
    def select_选择_by_id(self, 志愿ID):
        pass

    # 查找所有选择
    @abc.abstractmethod
    def select_all_选择(self):
        pass
