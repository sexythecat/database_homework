import unittest
from DAO.impl.填报_DAO_Impl import 填报_DAO_Impl

class Test填报DAO(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.dao = 填报_DAO_Impl()
        # 插入测试数据
        cls.dao.insert_填报(考生ID=1001, 志愿ID=2001)

    def test_insert_填报(self):
        self.dao.insert_填报(考生ID=1002, 志愿ID=2002)
        result = self.dao.select_填报_by_id(1002, 2002)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], 2002)  # 确认志愿ID正确
        self.dao.delete_填报(1002, 2002)  # 清理测试数据

    def test_select_填报_by_id(self):
        result = self.dao.select_填报_by_id(1001, 2001)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], 2001)  # 检查志愿ID

    def test_select_all_填报(self):
        results = self.dao.select_all_填报()
        self.assertTrue(len(results) > 0)

    def test_delete_填报(self):
        self.dao.insert_填报(考生ID=1003, 志愿ID=2003)
        self.dao.delete_填报(1003, 2003)
        result = self.dao.select_填报_by_id(1003, 2003)
        self.assertIsNone(result)

    @classmethod
    def tearDownClass(cls):
        cls.dao.delete_填报(1001, 2001)  # 清理初始数据

if __name__ == "__main__":
    unittest.main()
