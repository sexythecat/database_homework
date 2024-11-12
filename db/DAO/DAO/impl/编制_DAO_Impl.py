from DAO.DAO import Base_DAO
from DAO.编制_DAO import 编制_DAO

class 编制_DAO_Impl(Base_DAO, 编制_DAO):
    def __init__(self):
        self.connection = self.get_conn()

    def get_cursor(self):
        return self.connection.cursor()

    def insert_编制(self, 学院ID, 招生目录条目ID):
        cursor = self.get_cursor()
        query = "INSERT INTO 编制 (学院ID, 招生目录条目ID) VALUES (%s, %s)"
        cursor.execute(query, (学院ID, 招生目录条目ID))
        self.connection.commit()
        cursor.close()

    def delete_编制(self, 学院ID):
        cursor = self.get_cursor()
        query = "DELETE FROM 编制 WHERE 学院ID = %s"
        cursor.execute(query, (学院ID,))
        self.connection.commit()
        cursor.close()

    def select_编制_by_id(self, 学院ID):
        cursor = self.get_cursor()
        query = "SELECT * FROM 编制 WHERE 学院ID = %s"
        cursor.execute(query, (学院ID,))
        result = cursor.fetchone()
        cursor.close()
        return result

    def select_all_编制(self):
        cursor = self.get_cursor()
        query = "SELECT * FROM 编制"
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        return results
