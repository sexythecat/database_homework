import abc

class User_DAO(metaclass=abc.ABCMeta):
    # 增加用户
    @abc.abstractmethod
    def insert_user(self, user):
        pass

    # 删除用户
    @abc.abstractmethod
    def delete_user(self, user_id):
        pass

    # 更新用户信息
    @abc.abstractmethod
    def update_user(self, user, user_id):
        pass

    # 按照ID查找用户
    @abc.abstractmethod
    def select_user_by_id(self, user_id):
        pass

    # 查找所有用户
    @abc.abstractmethod
    def select_all_users(self):
        pass
