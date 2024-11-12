import unittest
from DAO.impl.对应1_DAO_Impl import 对应1_DAO_Impl

class Test对应1DAO(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.dao = 对应1_DAO_Impl()
        # 插入测试数据
        cls.dao.insert_对应1(导师ID=41, 用户ID=122)

    def test_insert_对应1(self):
        self.dao.insert_对应1(导师ID=41, 用户ID=122)
        result = self.dao.select_对应1_by_id(41)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], 122)  # 确认用户ID正确
        self.dao.delete_对应1(41)  # 清理测试数据

    def test_select_对应1_by_id(self):
        result = self.dao.select_对应1_by_id(501)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], 601)  # 检查用户ID

    def test_select_all_对应1(self):
        results = self.dao.select_all_对应1()
        self.assertTrue(len(results) > 0)

    def test_delete_对应1(self):
        self.dao.insert_对应1(导师ID=41, 用户ID=122)
        self.dao.delete_对应1(41)
        result = self.dao.select_对应1_by_id(41)
        self.assertIsNone(result)

    @classmethod
    def tearDownClass(cls):
        cls.dao.delete_对应1(501)  # 清理初始数据

if __name__ == "__main__":
    unittest.main()
