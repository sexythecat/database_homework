from DAO.DAO import Base_DAO
from DAO.导师_DAO import 导师_DAO

class 导师_DAO_Impl(Base_DAO, 导师_DAO):
    def __init__(self):
        self.connection = self.get_conn()

    def get_cursor(self):
        return self.connection.cursor()

    def insert_导师(self, 导师):
        cursor = self.get_cursor()
        query = """
        INSERT INTO 导师 (导师ID, 照片路径, 用户ID, 更新时间, 创建时间, 是否具有招生资格, 简介, 职称, 学院ID, 导师类别, 审核状态)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """
        cursor.execute(query, (导师.导师ID, 导师.照片路径, 导师.用户ID, 导师.更新时间, 导师.创建时间, 导师.是否具有招生资格, 导师.简介, 导师.职称, 导师.学院ID, 导师.导师类别, 导师.审核状态))
        self.connection.commit()
        cursor.close()

    def delete_导师(self, 导师ID):
        cursor = self.get_cursor()
        query = "DELETE FROM 导师 WHERE 导师ID = %s"
        cursor.execute(query, (导师ID,))
        self.connection.commit()
        cursor.close()

    def update_导师(self, 导师, 导师ID):
        cursor = self.get_cursor()
        query = """
        UPDATE 导师
        SET 照片路径 = %s, 用户ID = %s, 更新时间 = %s, 创建时间 = %s, 是否具有招生资格 = %s, 简介 = %s, 职称 = %s, 学院ID = %s, 导师类别 = %s, 审核状态 = %s
        WHERE 导师ID = %s
        """
        cursor.execute(query, (导师.照片路径, 导师.用户ID, 导师.更新时间, 导师.创建时间, 导师.是否具有招生资格, 导师.简介, 导师.职称, 导师.学院ID, 导师.导师类别, 导师.审核状态, 导师ID))
        self.connection.commit()
        cursor.close()

    def select_导师_by_id(self, 导师ID):
        cursor = self.get_cursor()
        query = "SELECT * FROM 导师 WHERE 导师ID = %s"
        cursor.execute(query, (导师ID,))
        result = cursor.fetchone()
        cursor.close()
        return result

    def select_all_导师(self):
        cursor = self.get_cursor()
        query = "SELECT * FROM 导师"
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        return results
