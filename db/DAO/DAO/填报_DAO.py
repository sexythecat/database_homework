import abc

class 填报_DAO(metaclass=abc.ABCMeta):
    # 增加填报记录
    @abc.abstractmethod
    def insert_填报(self, 考生ID, 志愿ID):
        pass

    # 删除填报记录
    @abc.abstractmethod
    def delete_填报(self, 考生ID, 志愿ID):
        pass

    # 按照考生ID和志愿ID查找填报记录
    @abc.abstractmethod
    def select_填报_by_id(self, 考生ID, 志愿ID):
        pass

    # 查找所有填报记录
    @abc.abstractmethod
    def select_all_填报(self):
        pass
