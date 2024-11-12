import unittest
from DAO.impl.属于_DAO_Impl import 属于_DAO_Impl

class Test属于DAO(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.dao = 属于_DAO_Impl()
        # 插入测试数据
        cls.dao.insert_属于(导师ID=101, 学院ID=201)

    def test_insert_属于(self):
        self.dao.insert_属于(导师ID=102, 学院ID=202)
        result = self.dao.select_属于_by_id(102, 202)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], 202)  # 确认学院ID正确
        self.dao.delete_属于(102, 202)  # 清理测试数据

    def test_select_属于_by_id(self):
        result = self.dao.select_属于_by_id(101, 201)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], 201)  # 检查学院ID

    def test_select_all_属于(self):
        results = self.dao.select_all_属于()
        self.assertTrue(len(results) > 0)

    def test_delete_属于(self):
        self.dao.insert_属于(导师ID=103, 学院ID=203)
        self.dao.delete_属于(103, 203)
        result = self.dao.select_属于_by_id(103, 203)
        self.assertIsNone(result)

    @classmethod
    def tearDownClass(cls):
        cls.dao.delete_属于(101, 201)  # 清理初始数据

if __name__ == "__main__":
    unittest.main()
