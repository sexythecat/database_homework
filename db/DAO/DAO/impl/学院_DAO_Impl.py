from DAO.DAO import Base_DAO
from DAO.学院_DAO import 学院_DAO

class 学院_DAO_Impl(Base_DAO, 学院_DAO):
    def __init__(self):
        self.connection = self.get_conn()

    def get_cursor(self):
        return self.connection.cursor()

    def insert_学院(self, 学院):
        cursor = self.get_cursor()
        query = """
        INSERT INTO 学院 (学院ID, 学院名称)
        VALUES (%s, %s)
        """
        cursor.execute(query, (学院.学院ID, 学院.学院名称))
        self.connection.commit()
        cursor.close()

    def delete_学院(self, 学院ID):
        cursor = self.get_cursor()
        query = "DELETE FROM 学院 WHERE 学院ID = %s"
        cursor.execute(query, (学院ID,))
        self.connection.commit()
        cursor.close()

    def update_学院(self, 学院, 学院ID):
        cursor = self.get_cursor()
        query = """
        UPDATE 学院
        SET 学院名称 = %s
        WHERE 学院ID = %s
        """
        cursor.execute(query, (学院.学院名称, 学院ID))
        self.connection.commit()
        cursor.close()

    def select_学院_by_id(self, 学院ID):
        cursor = self.get_cursor()
        query = "SELECT * FROM 学院 WHERE 学院ID = %s"
        cursor.execute(query, (学院ID,))
        result = cursor.fetchone()
        cursor.close()
        return result

    def select_all_学院(self):
        cursor = self.get_cursor()
        query = "SELECT * FROM 学院"
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        return results
