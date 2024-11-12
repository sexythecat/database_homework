import unittest
from DAO.impl.总成绩_DAO_Impl import 总成绩_DAO_Impl
from sql import 总成绩

class Test总成绩DAO(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.dao = 总成绩_DAO_Impl()
        cls.test_总成绩 = 总成绩(总成绩ID=21, 类别="复试", 总分数值=95.5, 更新时间=None, 创建时间=None, 考生ID=13)

    def test_insert_总成绩(self):
        self.dao.insert_总成绩(self.test_总成绩)
        result = self.dao.select_总成绩_by_id(13)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], "复试")
        self.assertEqual(result[2], 95.5)

    def test_select_总成绩_by_id(self):
        result = self.dao.select_总成绩_by_id(100)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], "期末")

    def test_update_总成绩(self):
        updated_总成绩 = 总成绩(总成绩ID=2001, 类别="期中", 总分数值=89.0, 更新时间=None, 创建时间=None, 考生ID=1001)
        self.dao.update_总成绩(updated_总成绩, 100)
        result = self.dao.select_总成绩_by_id(100)
        self.assertEqual(result[1], "期中")
        self.assertEqual(result[2], 89.0)

    def test_select_all_总成绩(self):
        results = self.dao.select_all_总成绩()
        self.assertTrue(len(results) > 0)

    def test_delete_总成绩(self):
        self.dao.delete_总成绩(21)
        result = self.dao.select_总成绩_by_id(21)
        self.assertIsNone(result)

    @classmethod
    def tearDownClass(cls):
        cls.dao.delete_总成绩(2001)

if __name__ == "__main__":
    unittest.main()
