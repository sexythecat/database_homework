import unittest
from DAO.impl.确定_DAO_Impl import 确定_DAO_Impl

class Test确定DAO(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.dao = 确定_DAO_Impl()
        # 插入测试数据
        cls.dao.insert_确定(复试结果ID=12, 导师ID=3)

    def test_insert_确定(self):
        self.dao.insert_确定(复试结果ID=12, 导师ID=3)
        result = self.dao.select_确定_by_id(12)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], 3)  # 确认导师ID正确
        self.dao.delete_确定(12)  # 清理测试数据

    def test_select_确定_by_id(self):
        result = self.dao.select_确定_by_id(12)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], 3)  # 检查导师ID

    def test_select_all_确定(self):
        results = self.dao.select_all_确定()
        self.assertTrue(len(results) > 0)

    def test_delete_确定(self):
        self.dao.insert_确定(复试结果ID=12, 导师ID=3)
        self.dao.delete_确定(12)
        result = self.dao.select_确定_by_id(3)
        self.assertIsNone(result)

    @classmethod
    def tearDownClass(cls):
        cls.dao.delete_确定(12)  # 清理初始数据

if __name__ == "__main__":
    unittest.main()
