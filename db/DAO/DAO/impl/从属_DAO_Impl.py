from DAO.DAO import Base_DAO
from DAO.从属_DAO import 从属_DAO

class 从属_DAO_Impl(Base_DAO, 从属_DAO):
    def __init__(self):
        self.connection = self.get_conn()

    def get_cursor(self):
        return self.connection.cursor()

    def insert_从属(self, 导师ID, 学科ID):
        cursor = self.get_cursor()
        query = "INSERT INTO 从属 (导师ID, 学科ID) VALUES (%s, %s)"
        cursor.execute(query, (导师ID, 学科ID))
        self.connection.commit()
        cursor.close()

    def delete_从属(self, 导师ID, 学科ID):
        cursor = self.get_cursor()
        query = "DELETE FROM 从属 WHERE 导师ID = %s AND 学科ID = %s"
        cursor.execute(query, (导师ID, 学科ID))
        self.connection.commit()
        cursor.close()

    def select_从属_by_id(self, 导师ID, 学科ID):
        cursor = self.get_cursor()
        query = "SELECT * FROM 从属 WHERE 导师ID = %s AND 学科ID = %s"
        cursor.execute(query, (导师ID, 学科ID))
        result = cursor.fetchone()
        cursor.close()
        return result

    def select_all_从属(self):
        cursor = self.get_cursor()
        query = "SELECT * FROM 从属"
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        return results
