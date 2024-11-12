from DAO.DAO import Base_DAO
from DAO.对应1_DAO import 对应1_DAO

class 对应1_DAO_Impl(Base_DAO, 对应1_DAO):
    def __init__(self):
        self.connection = self.get_conn()

    def get_cursor(self):
        return self.connection.cursor()

    def insert_对应1(self, 导师ID, 用户ID):
        cursor = self.get_cursor()
        query = "INSERT INTO 对应1 (导师ID, 用户ID) VALUES (%s, %s)"
        cursor.execute(query, (导师ID, 用户ID))
        self.connection.commit()
        cursor.close()

    def delete_对应1(self, 导师ID):
        cursor = self.get_cursor()
        query = "DELETE FROM 对应1 WHERE 导师ID = %s"
        cursor.execute(query, (导师ID,))
        self.connection.commit()
        cursor.close()

    def select_对应1_by_id(self, 导师ID):
        cursor = self.get_cursor()
        query = "SELECT * FROM 对应1 WHERE 导师ID = %s"
        cursor.execute(query, (导师ID,))
        result = cursor.fetchone()
        cursor.close()
        return result

    def select_all_对应1(self):
        cursor = self.get_cursor()
        query = "SELECT * FROM 对应1"
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        return results
