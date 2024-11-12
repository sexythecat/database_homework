import abc

class 复试志愿_DAO(metaclass=abc.ABCMeta):
    # 增加复试志愿
    @abc.abstractmethod
    def insert_复试志愿(self, 复试志愿):
        pass

    # 删除复试志愿
    @abc.abstractmethod
    def delete_复试志愿(self, 志愿ID):
        pass

    # 更新复试志愿信息
    @abc.abstractmethod
    def update_复试志愿(self, 复试志愿, 志愿ID):
        pass

    # 按照ID查找复试志愿
    @abc.abstractmethod
    def select_复试志愿_by_id(self, 志愿ID):
        pass

    # 查找所有复试志愿
    @abc.abstractmethod
    def select_all_复试志愿(self):
        pass
