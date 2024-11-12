import unittest
from DAO.impl.成绩_DAO_Impl import 成绩_DAO_Impl

class Test成绩DAO(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.dao = 成绩_DAO_Impl()
        # 插入测试数据
        cls.dao.insert_成绩(数值=90.5, 考生ID=1001, 考试科目ID=2001)

    def test_insert_成绩(self):
        self.dao.insert_成绩(数值=85.0, 考生ID=1002, 考试科目ID=2002)
        result = self.dao.select_成绩_by_id(1002, 2002)
        self.assertIsNotNone(result)
        self.assertEqual(result[0], 85.0)  # 确认成绩数值正确
        self.dao.delete_成绩(1002, 2002)  # 清理测试数据

    def test_select_成绩_by_id(self):
        result = self.dao.select_成绩_by_id(1001, 2001)
        self.assertIsNotNone(result)
        self.assertEqual(result[0], 90.5)  # 检查成绩数值

    def test_select_all_成绩(self):
        results = self.dao.select_all_成绩()
        self.assertTrue(len(results) > 0)

    def test_delete_成绩(self):
        self.dao.insert_成绩(数值=88.0, 考生ID=1003, 考试科目ID=2003)
        self.dao.delete_成绩(1003, 2003)
        result = self.dao.select_成绩_by_id(1003, 2003)
        self.assertIsNone(result)

    @classmethod
    def tearDownClass(cls):
        cls.dao.delete_成绩(1001, 2001)  # 清理初始数据

if __name__ == "__main__":
    unittest.main()
