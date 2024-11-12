from DAO.DAO import Base_DAO
from DAO.作为_DAO import 作为_DAO
from sql import 作为


class 作为_DAO_Impl(Base_DAO, 作为_DAO):
    def __init__(self):
        self.connection = self.get_conn()

    def get_cursor(self):
        return self.connection.cursor()

    def insert_作为(self, 用户ID, 角色ID):
        cursor = self.get_cursor()
        query = "INSERT INTO 作为 (用户ID, 角色ID) VALUES (%s, %s)"
        cursor.execute(query, (用户ID, 角色ID))
        self.connection.commit()
        cursor.close()

    def delete_作为(self, 用户ID):
        cursor = self.get_cursor()
        query = "DELETE FROM 作为 WHERE 用户ID = %s"
        cursor.execute(query, (用户ID,))
        self.connection.commit()
        cursor.close()

    def select_作为_by_id(self, 用户ID)->作为:
        cursor = self.get_cursor()
        query = "SELECT * FROM 作为 WHERE 用户ID = %s"
        cursor.execute(query, (用户ID,))
        result = cursor.fetchone()
        cursor.close()
        return result

    def select_all_作为(self):
        cursor = self.get_cursor()
        query = "SELECT * FROM 作为"
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        return results
