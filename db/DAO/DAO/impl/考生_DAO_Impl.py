from DAO.DAO import Base_DAO
from DAO.考生_DAO import 考生_DAO
from sql import 考生


class 考生_DAO_Impl(Base_DAO, 考生_DAO):
    def __init__(self):
        self.connection = self.get_conn()

    def get_cursor(self):
        return self.connection.cursor()

    def insert_考生(self, 考生):
        cursor = self.connection.cursor()
        query = """
        INSERT INTO 考生 (考生ID, 考生类别, 性别, 生源地, 个人简历, 更新时间, 创建时间, 用户ID, 身份证号, 毕业时间, 出生日期, 本科毕业学校名称, 本科专业, 本科毕业学校类型)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """
        cursor.execute(query, (考生.考生ID, 考生.考生类别, 考生.性别, 考生.生源地, 考生.个人简历, 考生.更新时间, 考生.创建时间, 考生.用户ID, 考生.身份证号, 考生.毕业时间, 考生.出生日期, 考生.本科毕业学校名称, 考生.本科专业, 考生.本科毕业学校类型))
        self.connection.commit()
        cursor.close()

    def delete_考生(self, 考生ID):
        cursor = self.connection.cursor()
        query = "DELETE FROM 考生 WHERE 考生ID = %s"
        cursor.execute(query, (考生ID,))
        self.connection.commit()
        cursor.close()

    def update_考生(self, 考生, 考生ID):
        cursor = self.connection.cursor()
        query = """
        UPDATE 考生
        SET 考生类别 = %s, 性别 = %s, 生源地 = %s, 个人简历 = %s, 更新时间 = %s, 用户ID = %s, 身份证号 = %s, 毕业时间 = %s, 出生日期 = %s, 本科毕业学校名称 = %s, 本科专业 = %s, 本科毕业学校类型 = %s
        WHERE 考生ID = %s
        """
        cursor.execute(query, (考生.考生类别, 考生.性别, 考生.生源地, 考生.个人简历, 考生.更新时间, 考生.用户ID, 考生.身份证号, 考生.毕业时间, 考生.出生日期, 考生.本科毕业学校名称, 考生.本科专业, 考生.本科毕业学校类型, 考生ID))
        self.connection.commit()
        cursor.close()

    def select_考生_by_id(self, 考生ID)->考生:
        cursor = self.connection.cursor()
        query = "SELECT * FROM 考生 WHERE 考生ID = %s"
        cursor.execute(query, (考生ID,))
        result = cursor.fetchone()
        cursor.close()
        return result

    def select_all_考生(self):
        cursor = self.connection.cursor()
        query = "SELECT * FROM 考生"
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        return results
