import unittest
from DAO.impl.学科_DAO_Impl import 学科_DAO_Impl
from sql import 学科

class Test学科DAO(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.dao = 学科_DAO_Impl()
        cls.test_学科 = 学科(学科ID="095401", 学科名称="计算机科学", 学科等级="一级学科", 学科概述="计算机科学及其应用领域的研究", 学科类型="学术型学科",
                             学科研究方向="人工智能、数据科学", 上级学科=None, 更新时间=None, 创建时间=None, 年度总招生指标="1000", 增补指标="200")

    def test_insert_学科(self):
        self.dao.insert_学科(self.test_学科)
        result = self.dao.select_学科_by_id("095401")
        self.assertIsNotNone(result)
        self.assertEqual(result[1], "计算机科学")
        self.assertEqual(result[2], "一级学科")

    def test_select_学科_by_id(self):
        result = self.dao.select_学科_by_id("CS001")
        self.assertIsNotNone(result)
        self.assertEqual(result[1], "计算机科学")

    def test_update_学科(self):
        updated_学科 = 学科(学科ID="CS001", 学科名称="信息科学", 学科等级="二级学科", 学科概述="信息科学及其应用", 学科类型="专业学位型学科",
                            学科研究方向="网络工程、数据库系统", 上级学科="CS", 更新时间=None, 创建时间=None, 年度总招生指标="1200", 增补指标="300")
        self.dao.update_学科(updated_学科, "CS001")
        result = self.dao.select_学科_by_id("CS001")
        self.assertEqual(result[1], "信息科学")
        self.assertEqual(result[2], "二级学科")

    def test_select_all_学科(self):
        results = self.dao.select_all_学科()
        self.assertTrue(len(results) > 0)

    def test_delete_学科(self):
        self.dao.delete_学科("095401")
        result = self.dao.select_学科_by_id("095401")
        self.assertIsNone(result)

    @classmethod
    def tearDownClass(cls):
        cls.dao.delete_学科("CS001")

if __name__ == "__main__":
    unittest.main()
