from DAO.DAO import Base_DAO
from DAO.考试科目_DAO import 考试科目_DAO

class 考试科目_DAO_Impl(Base_DAO, 考试科目_DAO):
    def __init__(self):
        self.connection = self.get_conn()

    def get_cursor(self):
        # 返回数据库连接的游标
        return self.connection.cursor()

    def insert_考试科目(self, 考试科目):
        cursor = self.get_cursor()
        query = """
        INSERT INTO 考试科目 (考试科目ID, 类别, 名称, 考试时间, 考试地点)
        VALUES (%s, %s, %s, %s, %s)
        """
        cursor.execute(query, (考试科目.考试科目ID, 考试科目.类别, 考试科目.名称, 考试科目.考试时间, 考试科目.考试地点))
        self.connection.commit()
        cursor.close()

    def delete_考试科目(self, 考试科目ID):
        cursor = self.get_cursor()
        query = "DELETE FROM 考试科目 WHERE 考试科目ID = %s"
        cursor.execute(query, (考试科目ID,))
        self.connection.commit()
        cursor.close()

    def update_考试科目(self, 考试科目, 考试科目ID):
        cursor = self.get_cursor()
        query = """
        UPDATE 考试科目
        SET 类别 = %s, 名称 = %s, 考试时间 = %s, 考试地点 = %s
        WHERE 考试科目ID = %s
        """
        cursor.execute(query, (考试科目.类别, 考试科目.名称, 考试科目.考试时间, 考试科目.考试地点, 考试科目ID))
        self.connection.commit()
        cursor.close()

    def select_考试科目_by_id(self, 考试科目ID):
        cursor = self.get_cursor()
        query = "SELECT * FROM 考试科目 WHERE 考试科目ID = %s"
        cursor.execute(query, (考试科目ID,))
        result = cursor.fetchone()
        cursor.close()
        return result

    def select_all_考试科目(self):
        cursor = self.get_cursor()
        query = "SELECT * FROM 考试科目"
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        return results
