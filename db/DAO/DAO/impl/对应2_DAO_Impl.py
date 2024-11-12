from DAO.DAO import Base_DAO
from DAO.对应2_DAO import 对应2_DAO

class 对应2_DAO_Impl(Base_DAO, 对应2_DAO):
    def __init__(self):
        self.connection = self.get_conn()

    def get_cursor(self):
        return self.connection.cursor()

    def insert_对应2(self, 考生ID, 用户ID):
        cursor = self.get_cursor()
        query = "INSERT INTO 对应2 (考生ID, 用户ID) VALUES (%s, %s)"
        cursor.execute(query, (考生ID, 用户ID))
        self.connection.commit()
        cursor.close()

    def delete_对应2(self, 考生ID):
        cursor = self.get_cursor()
        query = "DELETE FROM 对应2 WHERE 考生ID = %s"
        cursor.execute(query, (考生ID,))
        self.connection.commit()
        cursor.close()

    def select_对应2_by_id(self, 考生ID):
        cursor = self.get_cursor()
        query = "SELECT * FROM 对应2 WHERE 考生ID = %s"
        cursor.execute(query, (考生ID,))
        result = cursor.fetchone()
        cursor.close()
        return result

    def select_all_对应2(self):
        cursor = self.get_cursor()
        query = "SELECT * FROM 对应2"
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        return results
