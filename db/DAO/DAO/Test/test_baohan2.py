import unittest
from DAO.impl.包含2_DAO_Impl import 包含2_DAO_Impl

class Test包含2DAO(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.dao = 包含2_DAO_Impl()
        # 插入测试数据
        cls.dao.insert_包含2(考试科目ID=301, 招生目录条目ID=401)

    def test_insert_包含2(self):
        self.dao.insert_包含2(考试科目ID=302, 招生目录条目ID=402)
        result = self.dao.select_包含2_by_id(302, 402)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], 402)  # 确认招生目录条目ID正确
        self.dao.delete_包含2(302, 402)  # 清理测试数据

    def test_select_包含2_by_id(self):
        result = self.dao.select_包含2_by_id(301, 401)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], 401)  # 检查招生目录条目ID

    def test_select_all_包含2(self):
        results = self.dao.select_all_包含2()
        self.assertTrue(len(results) > 0)

    def test_delete_包含2(self):
        self.dao.insert_包含2(考试科目ID=303, 招生目录条目ID=403)
        self.dao.delete_包含2(303, 403)
        result = self.dao.select_包含2_by_id(303, 403)
        self.assertIsNone(result)

    @classmethod
    def tearDownClass(cls):
        cls.dao.delete_包含2(301, 401)  # 清理初始数据

if __name__ == "__main__":
    unittest.main()
