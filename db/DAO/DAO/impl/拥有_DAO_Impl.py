from DAO.DAO import Base_DAO
from DAO.拥有_DAO import 拥有_DAO

class 拥有_DAO_Impl(Base_DAO, 拥有_DAO):
    def __init__(self):
        self.connection = self.get_conn()

    def get_cursor(self):
        return self.connection.cursor()

    def insert_拥有(self, 拥有):
        cursor = self.get_cursor()
        query = """
        INSERT INTO 拥有 (考生ID, 总成绩ID)
        VALUES (%s, %s)
        """
        cursor.execute(query, (拥有.考生ID, 拥有.总成绩ID))
        self.connection.commit()
        cursor.close()

    def delete_拥有(self, 考生ID, 总成绩ID):
        cursor = self.get_cursor()
        query = "DELETE FROM 拥有 WHERE 考生ID = %s AND 总成绩ID = %s"
        cursor.execute(query, (考生ID, 总成绩ID))
        self.connection.commit()
        cursor.close()

    def select_拥有_by_id(self, 考生ID, 总成绩ID):
        cursor = self.get_cursor()
        query = "SELECT * FROM 拥有 WHERE 考生ID = %s AND 总成绩ID = %s"
        cursor.execute(query, (考生ID, 总成绩ID))
        result = cursor.fetchone()
        cursor.close()
        return result

    def select_all_拥有(self):
        cursor = self.get_cursor()
        query = "SELECT * FROM 拥有"
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        return results
