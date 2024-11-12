import abc

class 包含2_DAO(metaclass=abc.ABCMeta):
    # 增加包含2记录
    @abc.abstractmethod
    def insert_包含2(self, 考试科目ID, 招生目录条目ID):
        pass

    # 删除包含2记录
    @abc.abstractmethod
    def delete_包含2(self, 考试科目ID, 招生目录条目ID):
        pass

    # 按照考试科目ID和招生目录条目ID查找包含2记录
    @abc.abstractmethod
    def select_包含2_by_id(self, 考试科目ID, 招生目录条目ID):
        pass

    # 查找所有包含2记录
    @abc.abstractmethod
    def select_all_包含2(self):
        pass
