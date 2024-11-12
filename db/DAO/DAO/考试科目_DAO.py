import abc

class 考试科目_DAO(metaclass=abc.ABCMeta):
    # 增加考试科目
    @abc.abstractmethod
    def insert_考试科目(self, 考试科目):
        pass

    # 删除考试科目
    @abc.abstractmethod
    def delete_考试科目(self, 考试科目ID):
        pass

    # 更新考试科目信息
    @abc.abstractmethod
    def update_考试科目(self, 考试科目, 考试科目ID):
        pass

    # 按照ID查找考试科目
    @abc.abstractmethod
    def select_考试科目_by_id(self, 考试科目ID):
        pass

    # 查找所有考试科目
    @abc.abstractmethod
    def select_all_考试科目(self):
        pass
