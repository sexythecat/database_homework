from DAO.DAO import Base_DAO
from DAO.获得_DAO import 获得_DAO

class 获得_DAO_Impl(Base_DAO, 获得_DAO):
    def __init__(self):
        self.connection = self.get_conn()

    def get_cursor(self):
        return self.connection.cursor()

    def insert_获得(self, 考生ID, 复试结果ID):
        cursor = self.get_cursor()
        query = "INSERT INTO 获得 (考生ID, 复试结果ID) VALUES (%s, %s)"
        cursor.execute(query, (考生ID, 复试结果ID))
        self.connection.commit()
        cursor.close()

    def delete_获得(self, 考生ID):
        cursor = self.get_cursor()
        query = "DELETE FROM 获得 WHERE 考生ID = %s"
        cursor.execute(query, (考生ID,))
        self.connection.commit()
        cursor.close()

    def select_获得_by_id(self, 考生ID):
        cursor = self.get_cursor()
        query = "SELECT * FROM 获得 WHERE 考生ID = %s"
        cursor.execute(query, (考生ID,))
        result = cursor.fetchone()
        cursor.close()
        return result

    def select_all_获得(self):
        cursor = self.get_cursor()
        query = "SELECT * FROM 获得"
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        return results
