from DAO.DAO import Base_DAO
from DAO.包含2_DAO import 包含2_DAO

class 包含2_DAO_Impl(Base_DAO, 包含2_DAO):
    def __init__(self):
        self.connection = self.get_conn()

    def get_cursor(self):
        return self.connection.cursor()

    def insert_包含2(self, 考试科目ID, 招生目录条目ID):
        cursor = self.get_cursor()
        query = "INSERT INTO 包含2 (考试科目ID, 招生目录条目ID) VALUES (%s, %s)"
        cursor.execute(query, (考试科目ID, 招生目录条目ID))
        self.connection.commit()
        cursor.close()

    def delete_包含2(self, 考试科目ID, 招生目录条目ID):
        cursor = self.get_cursor()
        query = "DELETE FROM 包含2 WHERE 考试科目ID = %s AND 招生目录条目ID = %s"
        cursor.execute(query, (考试科目ID, 招生目录条目ID))
        self.connection.commit()
        cursor.close()

    def select_包含2_by_id(self, 考试科目ID, 招生目录条目ID):
        cursor = self.get_cursor()
        query = "SELECT * FROM 包含2 WHERE 考试科目ID = %s AND 招生目录条目ID = %s"
        cursor.execute(query, (考试科目ID, 招生目录条目ID))
        result = cursor.fetchone()
        cursor.close()
        return result

    def select_all_包含2(self):
        cursor = self.get_cursor()
        query = "SELECT * FROM 包含2"
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        return results
