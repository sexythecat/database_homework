from DAO.DAO import Base_DAO
from DAO.属于_DAO import 属于_DAO

class 属于_DAO_Impl(Base_DAO, 属于_DAO):
    def __init__(self):
        self.connection = self.get_conn()

    def get_cursor(self):
        return self.connection.cursor()

    def insert_属于(self, 导师ID, 学院ID):
        cursor = self.get_cursor()
        query = "INSERT INTO 属于 (导师ID, 学院ID) VALUES (%s, %s)"
        cursor.execute(query, (导师ID, 学院ID))
        self.connection.commit()
        cursor.close()

    def delete_属于(self, 导师ID, 学院ID):
        cursor = self.get_cursor()
        query = "DELETE FROM 属于 WHERE 导师ID = %s AND 学院ID = %s"
        cursor.execute(query, (导师ID, 学院ID))
        self.connection.commit()
        cursor.close()

    def select_属于_by_id(self, 导师ID, 学院ID):
        cursor = self.get_cursor()
        query = "SELECT * FROM 属于 WHERE 导师ID = %s AND 学院ID = %s"
        cursor.execute(query, (导师ID, 学院ID))
        result = cursor.fetchone()
        cursor.close()
        return result

    def select_all_属于(self):
        cursor = self.get_cursor()
        query = "SELECT * FROM 属于"
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        return results
