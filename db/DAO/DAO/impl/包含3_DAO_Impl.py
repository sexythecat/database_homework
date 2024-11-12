from DAO.DAO import Base_DAO
from DAO.包含3_DAO import 包含3_DAO

class 包含3_DAO_Impl(Base_DAO, 包含3_DAO):
    def __init__(self):
        self.connection = self.get_conn()

    def get_cursor(self):
        return self.connection.cursor()

    def insert_包含3(self, 招生目录ID, 招生目录条目ID):
        cursor = self.get_cursor()
        query = "INSERT INTO 包含3 (招生目录ID, 招生目录条目ID) VALUES (%s, %s)"
        cursor.execute(query, (招生目录ID, 招生目录条目ID))
        self.connection.commit()
        cursor.close()

    def delete_包含3(self, 招生目录条目ID):
        cursor = self.get_cursor()
        query = "DELETE FROM 包含3 WHERE 招生目录条目ID = %s"
        cursor.execute(query, (招生目录条目ID,))
        self.connection.commit()
        cursor.close()

    def select_包含3_by_id(self, 招生目录条目ID):
        cursor = self.get_cursor()
        query = "SELECT * FROM 包含3 WHERE 招生目录条目ID = %s"
        cursor.execute(query, (招生目录条目ID,))
        result = cursor.fetchone()
        cursor.close()
        return result

    def select_all_包含3(self):
        cursor = self.get_cursor()
        query = "SELECT * FROM 包含3"
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        return results
