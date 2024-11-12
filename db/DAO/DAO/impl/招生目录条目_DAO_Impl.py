from DAO.DAO import Base_DAO
from DAO.招生目录条目_DAO import 招生目录条目_DAO

class 招生目录条目_DAO_Impl(Base_DAO, 招生目录条目_DAO):
    def __init__(self):
        self.connection = self.get_conn()

    def get_cursor(self):
        return self.connection.cursor()

    def insert_招生目录条目(self, 招生目录条目):
        cursor = self.get_cursor()
        query = """
        INSERT INTO 招生目录条目 (招生目录条目ID, 年份, 学院ID, 创建时间, 更新时间, 是否招收同等学力, 学科ID)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
        """
        cursor.execute(query, (招生目录条目.招生目录条目ID, 招生目录条目.年份, 招生目录条目.学院ID, 招生目录条目.创建时间, 招生目录条目.更新时间,
                               招生目录条目.是否招收同等学力, 招生目录条目.学科ID))
        self.connection.commit()
        cursor.close()

    def delete_招生目录条目(self, 招生目录条目ID):
        cursor = self.get_cursor()
        query = "DELETE FROM 招生目录条目 WHERE 招生目录条目ID = %s"
        cursor.execute(query, (招生目录条目ID,))
        self.connection.commit()
        cursor.close()

    def update_招生目录条目(self, 招生目录条目, 招生目录条目ID):
        cursor = self.get_cursor()
        query = """
        UPDATE 招生目录条目
        SET 年份 = %s, 学院ID = %s, 创建时间 = %s, 更新时间 = %s, 是否招收同等学力 = %s, 学科ID = %s
        WHERE 招生目录条目ID = %s
        """
        cursor.execute(query, (招生目录条目.年份, 招生目录条目.学院ID, 招生目录条目.创建时间, 招生目录条目.更新时间,
                               招生目录条目.是否招收同等学力, 招生目录条目.学科ID, 招生目录条目ID))
        self.connection.commit()
        cursor.close()

    def select_招生目录条目_by_id(self, 招生目录条目ID):
        cursor = self.get_cursor()
        query = "SELECT * FROM 招生目录条目 WHERE 招生目录条目ID = %s"
        cursor.execute(query, (招生目录条目ID,))
        result = cursor.fetchone()
        cursor.close()
        return result

    def select_all_招生目录条目(self):
        cursor = self.get_cursor()
        query = "SELECT * FROM 招生目录条目"
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        return results
