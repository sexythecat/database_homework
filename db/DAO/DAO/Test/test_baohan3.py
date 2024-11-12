import unittest
from DAO.impl.包含3_DAO_Impl import 包含3_DAO_Impl

class Test包含3DAO(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.dao = 包含3_DAO_Impl()
        # 插入测试数据
        cls.dao.insert_包含3(招生目录ID=101, 招生目录条目ID=201)

    def test_insert_包含3(self):
        self.dao.insert_包含3(招生目录ID=102, 招生目录条目ID=202)
        result = self.dao.select_包含3_by_id(202)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], 102)  # 确认招生目录ID正确
        self.dao.delete_包含3(202)  # 清理测试数据

    def test_select_包含3_by_id(self):
        result = self.dao.select_包含3_by_id(201)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], 101)  # 检查招生目录ID

    def test_select_all_包含3(self):
        results = self.dao.select_all_包含3()
        self.assertTrue(len(results) > 0)

    def test_delete_包含3(self):
        self.dao.insert_包含3(招生目录ID=103, 招生目录条目ID=203)
        self.dao.delete_包含3(203)
        result = self.dao.select_包含3_by_id(203)
        self.assertIsNone(result)

    @classmethod
    def tearDownClass(cls):
        cls.dao.delete_包含3(201)  # 清理初始数据

if __name__ == "__main__":
    unittest.main()
