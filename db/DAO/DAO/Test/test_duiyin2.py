import unittest
from DAO.impl.对应2_DAO_Impl import 对应2_DAO_Impl

class Test对应2DAO(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.dao = 对应2_DAO_Impl()
        # 插入测试数据
        cls.dao.insert_对应2(考生ID=13, 用户ID=122)

    def test_insert_对应2(self):
        self.dao.insert_对应2(考生ID=13, 用户ID=122)
        result = self.dao.select_对应2_by_id(13)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], 122)  # 确认用户ID正确
        self.dao.delete_对应2(13)  # 清理测试数据

    def test_select_对应2_by_id(self):
        result = self.dao.select_对应2_by_id(701)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], 801)  # 检查用户ID

    def test_select_all_对应2(self):
        results = self.dao.select_all_对应2()
        self.assertTrue(len(results) > 0)

    def test_delete_对应2(self):
        self.dao.insert_对应2(考生ID=703, 用户ID=803)
        self.dao.delete_对应2(703)
        result = self.dao.select_对应2_by_id(703)
        self.assertIsNone(result)

    @classmethod
    def tearDownClass(cls):
        cls.dao.delete_对应2(701)  # 清理初始数据

if __name__ == "__main__":
    unittest.main()
