from DAO.DAO import Base_DAO
from DAO.复试结果_DAO import 复试结果_DAO
from sql import 复试结果


class 复试结果_DAO_Impl(Base_DAO, 复试结果_DAO):
    def __init__(self):
        self.connection = self.get_conn()

    def get_cursor(self):
        return self.connection.cursor()

    def insert_复试结果(self, 复试结果):
        cursor = self.get_cursor()
        query = """
        INSERT INTO 复试结果 (复试结果ID, 考生ID, 更新时间, 创建时间, 最终导师ID, 录取状态, 综合评价)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
        """
        cursor.execute(query, (复试结果.复试结果ID, 复试结果.考生ID, 复试结果.更新时间, 复试结果.创建时间,
                               复试结果.最终导师ID, 复试结果.录取状态, 复试结果.综合评价))
        self.connection.commit()
        cursor.close()

    def delete_复试结果(self, 复试结果ID):
        cursor = self.get_cursor()
        query = "DELETE FROM 复试结果 WHERE 复试结果ID = %s"
        cursor.execute(query, (复试结果ID,))
        self.connection.commit()
        cursor.close()

    def update_复试结果(self, 复试结果, 复试结果ID):
        cursor = self.get_cursor()
        query = """
        UPDATE 复试结果
        SET 考生ID = %s, 更新时间 = %s, 创建时间 = %s, 最终导师ID = %s, 录取状态 = %s, 综合评价 = %s
        WHERE 复试结果ID = %s
        """
        cursor.execute(query, (复试结果.考生ID, 复试结果.更新时间, 复试结果.创建时间,
                               复试结果.最终导师ID, 复试结果.录取状态, 复试结果.综合评价, 复试结果ID))
        self.connection.commit()
        cursor.close()

    def select_复试结果_by_id(self, 复试结果ID):
        cursor = self.get_cursor()
        query = "SELECT * FROM 复试结果 WHERE 复试结果ID = %s"
        cursor.execute(query, (复试结果ID,))
        result = cursor.fetchone()
        cursor.close()
        return result

    def select_all_复试结果(self):
        cursor = self.get_cursor()
        query = "SELECT * FROM 复试结果"
        cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        return results
