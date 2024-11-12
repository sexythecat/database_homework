from DAO.DAO import Base_DAO
from DAO.Role_DAO import Role_DAO


class Role_DAO_Impl(Base_DAO, Role_DAO):
    def __init__(self):
        self.connection=self.get_conn()

    def get_cursor(self):
        # 实现 get_cursor 方法，返回一个数据库游标
        return self.connection.cursor()

    def insert_role(self,role):
       cursor=self.connection.cursor()
       query = "INSERT INTO 角色 (角色ID, 角色名称, 角色描述, 角色权限) VALUES (%s, %s, %s, %s)"
       cursor.execute(query, (role.角色ID, role.角色名称, role.角色描述, role.角色权限))
       self.connection.commit()
       cursor.close()

    def delete_role(self, role_id):
        cursor = self.connection.cursor()
        query = "DELETE FROM 角色 WHERE 角色ID = %s"
        cursor.execute(query, (role_id,))  # 传入role_id参数，防止SQL注入
        self.connection.commit()  # 提交事务，确认删除操作
        cursor.close()

    def select_role_by_id(self, role_id):
        cursor = self.connection.cursor()
        query = "SELECT * FROM 角色 WHERE 角色ID = %s"
        cursor.execute(query, (role_id,))  # 使用参数化查询防止SQL注入
        result = cursor.fetchone()  # 获取单条记录
        cursor.close()
        return result  # 返回查询结果

    def update_role(self, role, role_id):
        cursor = self.connection.cursor()
        query = """
        UPDATE 角色 
        SET 角色名称 = %s, 角色描述 = %s, 角色权限 = %s 
        WHERE 角色ID = %s
        """
        # 使用 role 对象的属性来填充查询参数
        cursor.execute(query, (role.角色名称, role.角色描述, role.角色权限, role_id))
        self.connection.commit()  # 提交事务
        cursor.close()

    def select_all(self, sql): #传入的是一个SQL语句内容
        cursor = self.connection.cursor()
        cursor.execute(sql)  # 使用传入的 SQL 查询语句
        results = cursor.fetchall()  # 获取所有查询结果
        cursor.close()  # 关闭游标
        return results  # 返回查询结果



