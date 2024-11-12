import unittest
from DAO.impl.招生目录条目_DAO_Impl import 招生目录条目_DAO_Impl
from sql import 招生目录条目

class Test招生目录条目DAO(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.dao = 招生目录条目_DAO_Impl()
        cls.test_招生目录条目 = 招生目录条目(招生目录条目ID=31, 年份=2024, 学院ID=10, 创建时间=None, 更新时间=None, 是否招收同等学力=True, 学科ID="095401")

    def test_insert_招生目录条目(self):
        self.dao.insert_招生目录条目(self.test_招生目录条目)
        result = self.dao.select_招生目录条目_by_id(31)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], 2024)
        self.assertEqual(result[6], "095401")

    def test_select_招生目录条目_by_id(self):
        result = self.dao.select_招生目录条目_by_id(1)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], 2024)

    def test_update_招生目录条目(self):
        updated_招生目录条目 = 招生目录条目(招生目录条目ID=1, 年份=2025, 学院ID=101, 创建时间=None, 更新时间=None, 是否招收同等学力=False, 学科ID="095401")
        self.dao.update_招生目录条目(updated_招生目录条目, 1)
        result = self.dao.select_招生目录条目_by_id(1)
        self.assertEqual(result[1], 2025)
        self.assertEqual(result[6], "科目002")

    def test_select_all_招生目录条目(self):
        results = self.dao.select_all_招生目录条目()
        self.assertTrue(len(results) > 0)

    def test_delete_招生目录条目(self):
        self.dao.delete_招生目录条目(31)
        result = self.dao.select_招生目录条目_by_id(31)
        self.assertIsNone(result)

    @classmethod
    def tearDownClass(cls):
        cls.dao.delete_招生目录条目(1)

if __name__ == "__main__":
    unittest.main()
