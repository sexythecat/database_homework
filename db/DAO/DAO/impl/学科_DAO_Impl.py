from DAO.DAO import Base_DAO
from DAO.学科_DAO import 学科_DAO

class 学科_DAO_Impl(Base_DAO, 学科_DAO):
    def __init__(self):
        self.connection = self.get_conn()

    def get_cursor(self):
        return self.connection.cursor()

    def insert_学科(self, 学科):
        cursor = self.get_cursor()
        query = """
        INSERT INTO 学科 (学科ID, 学科名称, 学科等级, 学科概述, 学科类型, 学科研究方向, 上级学科, 更新时间, 创建时间, 年度总招生指标, 增补指标)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """
        cursor.execute(query, (学科.学科ID, 学科.学科名称, 学科.学科等级, 学科.学科概述, 学科.学科类型, 学科.学科研究方向, 学科.上级学科, 学科.更新时间, 学科.创建时间, 学科.年度总招生指标, 学科.增补指标))
        self.connection.commit()
        cursor.close()

    def delete_学科(self, 学科ID):
        cursor = self.get_cursor()
        query = "DELETE FROM 学科 WHERE 学科ID = %s"
        cursor.execute(query, (学科ID,))
        self.connection.commit()
        cursor.close()

    def update_学科(self, 学科, 学科ID):
        cursor = self.get_cursor()
        query = """
        UPDATE 学科
        SET 学科名称 = %s, 学科等级 = %s, 学科概述 = %s, 学科类型 = %s, 学科研究方向 = %s, 上级学科 = %s, 更新时间 = %s, 年度总招生指标 = %s, 增补指标 = %s
        WHERE 学科ID = %s
        """
        cursor.execute(query, (学科.学科名称, 学科.学科等级, 学科.学科概述, 学科.学科类型, 学科.学科研究方向, 学科.上级学科, 学科.更新时间, 学科.年度总招生指标, 学科.增补指标, 学科ID))
        self.connection.commit()
        cursor.close()




    def select_学科_by_id(self, 学科ID):
        cursor = self.get_cursor()
        query = "SELECT * FROM 学科 WHERE 学科ID = %s"
        cursor.execute(query, (学科ID,))
        result = cursor.fetchone()
        cursor.close()
        return result

    def select_all_学科(self):
        cursor = self.get_cursor()
        query = "SELECT * FROM 学科"
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        return results
