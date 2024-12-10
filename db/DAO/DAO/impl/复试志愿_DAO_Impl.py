from DAO.DAO import Base_DAO
from DAO.复试志愿_DAO import 复试志愿_DAO

class 复试志愿_DAO_Impl(Base_DAO, 复试志愿_DAO):
    def __init__(self):
        self.connection = self.get_conn()

    def get_cursor(self):
        return self.connection.cursor()

    def insert_复试志愿(self, 复试志愿):
        cursor = self.get_cursor()
        query = """
        INSERT INTO 复试志愿 (志愿ID, 导师ID, 考生ID, 学科ID, 志愿顺序, 是否接受方向调整, 更新时间, 创建时间)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
        """
        cursor.execute(query, (复试志愿.志愿ID, 复试志愿.导师ID, 复试志愿.考生ID, 复试志愿.学科ID, 复试志愿.志愿顺序,
                               复试志愿.是否接受方向调整, 复试志愿.更新时间, 复试志愿.创建时间))
        self.connection.commit()
        cursor.close()

    def delete_复试志愿(self, 志愿ID):
        cursor = self.get_cursor()
        query = "DELETE FROM 复试志愿 WHERE 志愿ID = %s"
        cursor.execute(query, (志愿ID,))
        self.connection.commit()
        cursor.close()

    def update_复试志愿(self, 复试志愿, 志愿ID):
        cursor = self.get_cursor()
        query = """
        UPDATE 复试志愿
        SET 导师ID = %s, 考生ID = %s, 学科ID = %s, 志愿顺序 = %s, 是否接受方向调整 = %s, 更新时间 = %s, 创建时间 = %s
        WHERE 志愿ID = %s
        """
        cursor.execute(query, (复试志愿.导师ID, 复试志愿.考生ID, 复试志愿.学科ID, 复试志愿.志愿顺序,
                               复试志愿.是否接受方向调整, 复试志愿.更新时间, 复试志愿.创建时间, 志愿ID))
        self.connection.commit()
        cursor.close()

    def select_复试志愿_by_id(self, 考生ID):
        cursor = self.get_cursor()
        query = "SELECT * FROM 复试志愿 WHERE 考生ID = %s"
        cursor.execute(query, (考生ID,))
        result = cursor.fetchone()
        cursor.close()
        return result

    def select_all_复试志愿(self):
        cursor = self.get_cursor()
        query = "SELECT * FROM 复试志愿"
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        return results
