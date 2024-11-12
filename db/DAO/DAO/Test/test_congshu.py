import unittest
from DAO.impl.从属_DAO_Impl import 从属_DAO_Impl

class Test从属DAO(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.dao = 从属_DAO_Impl()
        # 插入测试数据
        cls.dao.insert_从属(导师ID=1, 学科ID="A101")

    def test_insert_从属(self):
        self.dao.insert_从属(导师ID=2, 学科ID="A102")
        result = self.dao.select_从属_by_id(2, "A102")
        self.assertIsNotNone(result)
        self.assertEqual(result[1], "A102")  # 确认学科ID正确
        self.dao.delete_从属(2, "A102")  # 清理测试数据

    def test_select_从属_by_id(self):
        result = self.dao.select_从属_by_id(1, "A101")
        self.assertIsNotNone(result)
        self.assertEqual(result[1], "A101")  # 检查学科ID

    def test_select_all_从属(self):
        results = self.dao.select_all_从属()
        self.assertTrue(len(results) > 0)

    def test_delete_从属(self):
        self.dao.insert_从属(导师ID=3, 学科ID="A103")
        self.dao.delete_从属(3, "A103")
        result = self.dao.select_从属_by_id(3, "A103")
        self.assertIsNone(result)

    @classmethod
    def tearDownClass(cls):
        cls.dao.delete_从属(1, "A101")  # 清理初始数据

if __name__ == "__main__":
    unittest.main()
