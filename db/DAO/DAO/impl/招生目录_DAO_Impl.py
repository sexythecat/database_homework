from DAO.DAO import Base_DAO
from DAO.招生目录_DAO import 招生目录_DAO

class 招生目录_DAO_Impl(Base_DAO, 招生目录_DAO):
    def __init__(self):
        self.connection = self.get_conn()

    def get_cursor(self):
        return self.connection.cursor()

    def insert_招生目录(self, 招生目录):
        cursor = self.get_cursor()
        query = """
        INSERT INTO 招生目录 (招生目录ID, 招生年度, 是否通过学校审核)
        VALUES (%s, %s, %s)
        """
        cursor.execute(query, (招生目录.招生目录ID, 招生目录.招生年度, 招生目录.是否通过学校审核))
        self.connection.commit()
        cursor.close()

    def delete_招生目录(self, 招生目录ID):
        cursor = self.get_cursor()
        query = "DELETE FROM 招生目录 WHERE 招生目录ID = %s"
        cursor.execute(query, (招生目录ID,))
        self.connection.commit()
        cursor.close()

    def update_招生目录(self, 招生目录, 招生目录ID):
        cursor = self.get_cursor()
        query = """
        UPDATE 招生目录
        SET 招生年度 = %s, 是否通过学校审核 = %s
        WHERE 招生目录ID = %s
        """
        cursor.execute(query, (招生目录.招生年度, 招生目录.是否通过学校审核, 招生目录ID))
        self.connection.commit()
        cursor.close()

    def select_招生目录_by_id(self, 招生目录ID):
        cursor = self.get_cursor()
        query = "SELECT * FROM 招生目录 WHERE 招生目录ID = %s"
        cursor.execute(query, (招生目录ID,))
        result = cursor.fetchone()
        cursor.close()
        return result

    def select_all_招生目录(self):
        cursor = self.get_cursor()
        query = "SELECT * FROM 招生目录"
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        return results
