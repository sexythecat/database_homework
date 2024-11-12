import unittest
from DAO.impl.编制_DAO_Impl import 编制_DAO_Impl

class Test编制DAO(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.dao = 编制_DAO_Impl()
        # 插入测试数据
        cls.dao.insert_编制(学院ID=101, 招生目录条目ID=201)

    def test_insert_编制(self):
        self.dao.insert_编制(学院ID=102, 招生目录条目ID=202)
        result = self.dao.select_编制_by_id(102)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], 202)  # 确认招生目录条目ID正确
        self.dao.delete_编制(102)  # 清理测试数据

    def test_select_编制_by_id(self):
        result = self.dao.select_编制_by_id(101)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], 201)  # 检查招生目录条目ID

    def test_select_all_编制(self):
        results = self.dao.select_all_编制()
        self.assertTrue(len(results) > 0)

    def test_delete_编制(self):
        self.dao.insert_编制(学院ID=103, 招生目录条目ID=203)
        self.dao.delete_编制(103)
        result = self.dao.select_编制_by_id(103)
        self.assertIsNone(result)

    @classmethod
    def tearDownClass(cls):
        cls.dao.delete_编制(101)  # 清理初始数据

if __name__ == "__main__":
    unittest.main()
