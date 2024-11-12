from DAO.DAO import Base_DAO
from DAO.具有_DAO import 具有_DAO

class 具有_DAO_Impl(Base_DAO, 具有_DAO):
    def __init__(self):
        self.connection = self.get_conn()

    def get_cursor(self):
        return self.connection.cursor()

    def insert_具有(self, 具有):
        cursor = self.get_cursor()
        query = """
        INSERT INTO 具有 (学科ID, 招生目录ID)
        VALUES (%s, %s)
        """
        cursor.execute(query, (具有.学科ID, 具有.招生目录ID))
        self.connection.commit()
        cursor.close()

    def delete_具有(self, 学科ID, 招生目录ID):
        cursor = self.get_cursor()
        query = "DELETE FROM 具有 WHERE 学科ID = %s AND 招生目录ID = %s"
        cursor.execute(query, (学科ID, 招生目录ID))
        self.connection.commit()
        cursor.close()

    def select_具有_by_id(self, 学科ID, 招生目录ID):
        cursor = self.get_cursor()
        query = "SELECT * FROM 具有 WHERE 学科ID = %s AND 招生目录ID = %s"
        cursor.execute(query, (学科ID, 招生目录ID))
        result = cursor.fetchone()
        cursor.close()
        return result

    def select_all_具有(self):
        cursor = self.get_cursor()
        query = "SELECT * FROM 具有"
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        return results
