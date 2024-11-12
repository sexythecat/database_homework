from DAO.DAO import Base_DAO
from DAO.成绩_DAO import 成绩_DAO

class 成绩_DAO_Impl(Base_DAO, 成绩_DAO):
    def __init__(self):
        self.connection = self.get_conn()

    def get_cursor(self):
        return self.connection.cursor()

    def insert_成绩(self, 数值, 考生ID, 考试科目ID):
        cursor = self.get_cursor()
        query = "INSERT INTO 成绩 (数值, 考生ID, 考试科目ID) VALUES (%s, %s, %s)"
        cursor.execute(query, (数值, 考生ID, 考试科目ID))
        self.connection.commit()
        cursor.close()

    def delete_成绩(self, 考生ID, 考试科目ID):
        cursor = self.get_cursor()
        query = "DELETE FROM 成绩 WHERE 考生ID = %s AND 考试科目ID = %s"
        cursor.execute(query, (考生ID, 考试科目ID))
        self.connection.commit()
        cursor.close()

    def select_成绩_by_id(self, 考生ID, 考试科目ID):
        cursor = self.get_cursor()
        query = "SELECT * FROM 成绩 WHERE 考生ID = %s AND 考试科目ID = %s"
        cursor.execute(query, (考生ID, 考试科目ID))
        result = cursor.fetchone()
        cursor.close()
        return result

    def select_all_成绩(self):
        cursor = self.get_cursor()
        query = "SELECT * FROM 成绩"
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        return results
