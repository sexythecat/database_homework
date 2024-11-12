import abc

class 成绩_DAO(metaclass=abc.ABCMeta):
    # 增加成绩记录
    @abc.abstractmethod
    def insert_成绩(self, 数值, 考生ID, 考试科目ID):
        pass

    # 删除成绩记录
    @abc.abstractmethod
    def delete_成绩(self, 考生ID, 考试科目ID):
        pass

    # 按照考生ID和考试科目ID查找成绩记录
    @abc.abstractmethod
    def select_成绩_by_id(self, 考生ID, 考试科目ID):
        pass

    # 查找所有成绩记录
    @abc.abstractmethod
    def select_all_成绩(self):
        pass
