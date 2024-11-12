from DAO.DAO import Base_DAO
from DAO.选择_DAO import 选择_DAO

class 选择_DAO_Impl(Base_DAO, 选择_DAO):
    def __init__(self):
        self.connection = self.get_conn()

    def get_cursor(self):
        return self.connection.cursor()

    def insert_选择(self, 志愿ID, 导师ID):
        cursor = self.get_cursor()
        query = "INSERT INTO 选择 (志愿ID, 导师ID) VALUES (%s, %s)"
        cursor.execute(query, (志愿ID, 导师ID))
        self.connection.commit()
        cursor.close()

    def delete_选择(self, 志愿ID):
        cursor = self.get_cursor()
        query = "DELETE FROM 选择 WHERE 志愿ID = %s"
        cursor.execute(query, (志愿ID,))
        self.connection.commit()
        cursor.close()

    def select_选择_by_id(self, 志愿ID):
        cursor = self.get_cursor()
        query = "SELECT * FROM 选择 WHERE 志愿ID = %s"
        cursor.execute(query, (志愿ID,))
        result = cursor.fetchone()
        cursor.close()
        return result

    def select_all_选择(self):
        cursor = self.get_cursor()
        query = "SELECT * FROM 选择"
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        return results
