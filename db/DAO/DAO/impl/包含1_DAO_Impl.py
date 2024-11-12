from DAO.DAO import Base_DAO
from DAO.包含1_DAO import 包含1_DAO

class 包含1_DAO_Impl(Base_DAO, 包含1_DAO):
    def __init__(self):
        self.connection = self.get_conn()

    def get_cursor(self):
        return self.connection.cursor()

    def insert_包含1(self, 包含1):
        cursor = self.get_cursor()
        query = """
        INSERT INTO 包含1 (志愿ID, 学科ID)
        VALUES (%s, %s)
        """
        cursor.execute(query, (包含1.志愿ID, 包含1.学科ID))
        self.connection.commit()
        cursor.close()

    def delete_包含1(self, 志愿ID, 学科ID):
        cursor = self.get_cursor()
        query = "DELETE FROM 包含1 WHERE 志愿ID = %s AND 学科ID = %s"
        cursor.execute(query, (志愿ID, 学科ID))
        self.connection.commit()
        cursor.close()

    def select_包含1_by_id(self, 志愿ID, 学科ID):
        cursor = self.get_cursor()
        query = "SELECT * FROM 包含1 WHERE 志愿ID = %s AND 学科ID = %s"
        cursor.execute(query, (志愿ID, 学科ID))
        result = cursor.fetchone()
        cursor.close()
        return result

    def select_all_包含1(self):
        cursor = self.get_cursor()
        query = "SELECT * FROM 包含1"
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        return results
