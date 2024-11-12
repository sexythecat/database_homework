import unittest
from DAO.impl.作为_DAO_Impl import 作为_DAO_Impl

class Test作为DAO(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.dao = 作为_DAO_Impl()
        # 插入测试数据
        cls.dao.insert_作为(用户ID=1001, 角色ID=2001)

    def test_insert_作为(self):
        self.dao.insert_作为(用户ID=1002, 角色ID=2002)
        result = self.dao.select_作为_by_id(1002)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], 2002)  # 确认角色ID正确
        self.dao.delete_作为(1002)  # 清理测试数据

    def test_select_作为_by_id(self):
        result = self.dao.select_作为_by_id(1001)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], 2001)  # 检查角色ID

    def test_select_all_作为(self):
        results = self.dao.select_all_作为()
        self.assertTrue(len(results) > 0)

    def test_delete_作为(self):
        self.dao.insert_作为(用户ID=1003, 角色ID=2003)
        self.dao.delete_作为(1003)
        result = self.dao.select_作为_by_id(1003)
        self.assertIsNone(result)

    @classmethod
    def tearDownClass(cls):
        cls.dao.delete_作为(1001)  # 清理初始数据

if __name__ == "__main__":
    unittest.main()
