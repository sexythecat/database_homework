from DAO.DAO import Base_DAO
from DAO.填报_DAO import 填报_DAO

class 填报_DAO_Impl(Base_DAO, 填报_DAO):
    def __init__(self):
        self.connection = self.get_conn()

    def get_cursor(self):
        return self.connection.cursor()

    def insert_填报(self, 考生ID, 志愿ID):
        cursor = self.get_cursor()
        query = "INSERT INTO 填报 (考生ID, 志愿ID) VALUES (%s, %s)"
        cursor.execute(query, (考生ID, 志愿ID))
        self.connection.commit()
        cursor.close()

    def delete_填报(self, 考生ID, 志愿ID):
        cursor = self.get_cursor()
        query = "DELETE FROM 填报 WHERE 考生ID = %s AND 志愿ID = %s"
        cursor.execute(query, (考生ID, 志愿ID))
        self.connection.commit()
        cursor.close()

    def select_填报_by_id(self, 考生ID, 志愿ID):
        cursor = self.get_cursor()
        query = "SELECT * FROM 填报 WHERE 考生ID = %s AND 志愿ID = %s"
        cursor.execute(query, (考生ID, 志愿ID))
        result = cursor.fetchone()
        cursor.close()
        return result

    def select_all_填报(self):
        cursor = self.get_cursor()
        query = "SELECT * FROM 填报"
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        return results
