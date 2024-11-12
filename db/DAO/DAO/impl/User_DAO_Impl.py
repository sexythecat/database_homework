from DAO.DAO import Base_DAO
from DAO.User_DAO import User_DAO

class User_DAO_Impl(Base_DAO, User_DAO):
    def __init__(self):
        self.connection = self.get_conn()

    def get_cursor(self):
        return self.connection.cursor()

    def insert_user(self, user):
        cursor = self.connection.cursor()
        query = "INSERT INTO 用户 (用户ID, 用户名, 更新时间, 角色ID, 邮箱, 手机号, 姓名, 密码) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
        cursor.execute(query, (user.用户ID, user.用户名, user.更新时间, user.角色ID, user.邮箱, user.手机号, user.姓名, user.密码))
        self.connection.commit()
        cursor.close()

    def delete_user(self, user_id):
        cursor = self.connection.cursor()
        query = "DELETE FROM 用户 WHERE 用户ID = %s"
        cursor.execute(query, (user_id,))
        self.connection.commit()
        cursor.close()

    def update_user(self, user, user_id):
        cursor = self.connection.cursor()
        query = """
        UPDATE 用户
        SET 用户名 = %s, 更新时间 = %s, 角色ID = %s, 邮箱 = %s, 手机号 = %s, 姓名 = %s, 密码 = %s
        WHERE 用户ID = %s
        """
        cursor.execute(query, (user.用户名, user.更新时间, user.角色ID, user.邮箱, user.手机号, user.姓名, user.密码, user_id))
        self.connection.commit()
        cursor.close()

    def select_user_by_id(self, user_id):
        cursor = self.connection.cursor()
        query = "SELECT * FROM 用户 WHERE 用户ID = %s"
        cursor.execute(query, (user_id,))
        result = cursor.fetchone()
        cursor.close()
        return result

    def select_all_users(self):
        cursor = self.connection.cursor()
        query = "SELECT * FROM 用户"
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        return results
