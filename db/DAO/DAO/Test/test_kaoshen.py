import unittest
from DAO.impl.考生_DAO_Impl import 考生_DAO_Impl
from sql import 考生

class Test考生DAO(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.dao = 考生_DAO_Impl()
        cls.test_考生 = 考生(考生ID=13, 考生类别="往届生", 性别="女", 生源地="北京", 个人简历="简历内容", 更新时间=None, 创建时间=None,
                          用户ID=122, 身份证号="159753", 毕业时间="2023-06-01", 出生日期="2000-01-01", 本科毕业学校名称="北京大学", 本科专业="计算机", 本科毕业学校类型="普通本科大学")

    def test_insert_考生(self):
        self.dao.insert_考生(self.test_考生)
        result = self.dao.select_考生_by_id(13)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], "往届生")

    def test_select_考生_by_id(self):
        result = self.dao.select_考生_by_id(100)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], "应届生")

    def test_update_考生(self):
        updated_考生 = 考生(考生ID=100, 考生类别="往届生", 性别="男", 生源地="上海", 个人简历="更新后的简历", 更新时间=None, 创建时间=None,
                         用户ID=123, 身份证号="123456789012345678", 毕业时间="2022-06-01", 出生日期="2000-01-01", 本科毕业学校名称="复旦大学", 本科专业="机械", 本科毕业学校类型="普通本科大学")
        self.dao.update_考生(updated_考生, 100)
        result = self.dao.select_考生_by_id(100)
        self.assertEqual(result[1], "往届生")

    def test_select_all_考生(self):
        results = self.dao.select_all_考生()
        self.assertTrue(len(results) > 0)

    def test_delete_考生(self):
        self.dao.delete_考生(100)
        result = self.dao.select_考生_by_id(100)
        self.assertIsNone(result)

    @classmethod
    def tearDownClass(cls):
        cls.dao.delete_考生(1001)

if __name__ == "__main__":
    unittest.main()
