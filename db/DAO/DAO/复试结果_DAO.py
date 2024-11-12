import abc

class 复试结果_DAO(metaclass=abc.ABCMeta):
    # 增加复试结果
    @abc.abstractmethod
    def insert_复试结果(self, 复试结果):
        pass

    # 删除复试结果
    @abc.abstractmethod
    def delete_复试结果(self, 复试结果ID):
        pass

    # 更新复试结果信息
    @abc.abstractmethod
    def update_复试结果(self, 复试结果, 复试结果ID):
        pass

    # 按照ID查找复试结果
    @abc.abstractmethod
    def select_复试结果_by_id(self, 复试结果ID):
        pass

    # 查找所有复试结果
    @abc.abstractmethod
    def select_all_复试结果(self):
        pass
