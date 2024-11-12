import abc


class Role_DAO(metaclass=abc.ABCMeta):
    #增加
    @abc.abstractmethod
    def insert_role(self,role):
        pass

    #删除
    @abc.abstractmethod
    def delete_role(self,role):
        pass

    # 更新,利用ID
    @abc.abstractmethod
    def update_role(self, role, role_id):
        pass
    #查找全部
    @abc.abstractmethod
    def select_all(self,sql):
        pass

    #按照ID查找
    @abc.abstractmethod
    def select_role_by_id(self,role_id):
        pass