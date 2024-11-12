import unittest
from DAO.impl.选择_DAO_Impl import 选择_DAO_Impl

class Test选择DAO(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.dao = 选择_DAO_Impl()
        # 插入测试数据
        cls.dao.insert_选择(志愿ID=31, 导师ID=10)

    def test_insert_选择(self):
        self.dao.insert_选择(志愿ID=31, 导师ID=10)
        result = self.dao.select_选择_by_id(31)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], 10)  # 确认导师ID正确


    def test_select_选择_by_id(self):
        result = self.dao.select_选择_by_id(30)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], 3)  # 检查导师ID

    def test_select_all_选择(self):
        results = self.dao.select_all_选择()
        self.assertTrue(len(results) > 0)

    def test_delete_选择(self):
        self.dao.insert_选择(志愿ID=30, 导师ID=3)
        self.dao.delete_选择(30)
        result = self.dao.select_选择_by_id(30)
        self.assertIsNone(result)

    @classmethod
    def tearDownClass(cls):
        cls.dao.delete_选择(30)  # 清理初始数据

if __name__ == "__main__":
    unittest.main()
