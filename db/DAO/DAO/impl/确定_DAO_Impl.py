from DAO.DAO import Base_DAO
from DAO.确定_DAO import 确定_DAO

class 确定_DAO_Impl(Base_DAO, 确定_DAO):
    def __init__(self):
        self.connection = self.get_conn()

    def get_cursor(self):
        return self.connection.cursor()

    def insert_确定(self, 复试结果ID, 导师ID):
        cursor = self.get_cursor()
        query = "INSERT INTO 确定 (复试结果ID, 导师ID) VALUES (%s, %s)"
        cursor.execute(query, (复试结果ID, 导师ID))
        self.connection.commit()
        cursor.close()

    def delete_确定(self, 复试结果ID):
        cursor = self.get_cursor()
        query = "DELETE FROM 确定 WHERE 复试结果ID = %s"
        cursor.execute(query, (复试结果ID,))
        self.connection.commit()
        cursor.close()

    def select_确定_by_id(self, 复试结果ID):
        cursor = self.get_cursor()
        query = "SELECT * FROM 确定 WHERE 复试结果ID = %s"
        cursor.execute(query, (复试结果ID,))
        result = cursor.fetchone()
        cursor.close()
        return result

    def select_all_确定(self):
        cursor = self.get_cursor()
        query = "SELECT * FROM 确定"
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        return results
