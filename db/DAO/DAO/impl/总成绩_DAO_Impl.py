from DAO.DAO import Base_DAO
from DAO.总成绩_DAO import 总成绩_DAO

class 总成绩_DAO_Impl(Base_DAO, 总成绩_DAO):
    def __init__(self):
        self.connection = self.get_conn()

    def get_cursor(self):
        return self.connection.cursor()

    def insert_总成绩(self, 总成绩):
        cursor = self.connection.cursor()
        query = """
        INSERT INTO 总成绩 (总成绩ID, 类别, 总分数值, 更新时间, 创建时间, 考生ID)
        VALUES (%s, %s, %s, %s, %s, %s)
        """
        cursor.execute(query, (总成绩.总成绩ID, 总成绩.类别, 总成绩.总分数值, 总成绩.更新时间, 总成绩.创建时间, 总成绩.考生ID))
        self.connection.commit()
        cursor.close()

    def delete_总成绩(self, 总成绩ID):
        cursor = self.connection.cursor()
        query = "DELETE FROM 总成绩 WHERE 总成绩ID = %s"
        cursor.execute(query, (总成绩ID,))
        self.connection.commit()
        cursor.close()

    def update_总成绩(self, 总成绩, 总成绩ID):
        cursor = self.connection.cursor()
        query = """
        UPDATE 总成绩
        SET 类别 = %s, 总分数值 = %s, 更新时间 = %s, 考生ID = %s
        WHERE 总成绩ID = %s
        """
        cursor.execute(query, (总成绩.类别, 总成绩.总分数值, 总成绩.更新时间, 总成绩.考生ID, 总成绩ID))
        self.connection.commit()
        cursor.close()

    def select_总成绩_by_id(self, 总成绩ID):
        cursor = self.connection.cursor()
        query = "SELECT * FROM 总成绩 WHERE 总成绩ID = %s"
        cursor.execute(query, (总成绩ID,))
        result = cursor.fetchone()
        cursor.close()
        return result

    def select_all_总成绩(self):
        cursor = self.connection.cursor()
        query = "SELECT * FROM 总成绩"
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        return results
