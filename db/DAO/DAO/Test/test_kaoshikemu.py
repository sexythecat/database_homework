import unittest
from DAO.impl.考试科目_DAO_Impl import 考试科目_DAO_Impl
from sql import 考试科目

class Test考试科目DAO(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.dao = 考试科目_DAO_Impl()
        cls.test_考试科目 = 考试科目(考试科目ID=41, 类别="初试", 名称="数学", 考试时间="2024-12-01", 考试地点="教学楼101")

    def test_insert_考试科目(self):
        self.dao.insert_考试科目(self.test_考试科目)
        result = self.dao.select_考试科目_by_id(41)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], "初试")
        self.assertEqual(result[2], "数学")

    def test_select_考试科目_by_id(self):
        result = self.dao.select_考试科目_by_id(3001)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], "初试")

    def test_update_考试科目(self):
        updated_考试科目 = 考试科目(考试科目ID=41, 类别="复试", 名称="英语", 考试时间="2024-12-10", 考试地点="教学楼202")
        self.dao.update_考试科目(updated_考试科目, 41)
        result = self.dao.select_考试科目_by_id(3001)
        self.assertEqual(result[1], "复试")
        self.assertEqual(result[2], "英语")

    def test_select_all_考试科目(self):
        results = self.dao.select_all_考试科目()
        self.assertTrue(len(results) > 0)

    def test_delete_考试科目(self):
        self.dao.delete_考试科目(41)
        result = self.dao.select_考试科目_by_id(41)
        self.assertIsNone(result)

    @classmethod
    def tearDownClass(cls):
        cls.dao.delete_考试科目(3001)

if __name__ == "__main__":
    unittest.main()
