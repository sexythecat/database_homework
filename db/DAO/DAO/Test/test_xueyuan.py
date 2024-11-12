import unittest
from DAO.impl.学院_DAO_Impl import 学院_DAO_Impl
from sql import 学院

class Test学院DAO(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.dao = 学院_DAO_Impl()
        cls.test_学院 = 学院(学院ID=17, 学院名称="南阳理工学院")

    def test_insert_学院(self):
        self.dao.insert_学院(self.test_学院)
        result = self.dao.select_学院_by_id(17)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], "南阳理工学院")

    def test_select_学院_by_id(self):
        result = self.dao.select_学院_by_id(4001)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], "计算机科学与技术学院")

    def test_update_学院(self):
        updated_学院 = 学院(学院ID=4001, 学院名称="信息管理学院")
        self.dao.update_学院(updated_学院, 4001)
        result = self.dao.select_学院_by_id(4001)
        self.assertEqual(result[1], "信息管理学院")

    def test_select_all_学院(self):
        results = self.dao.select_all_学院()
        self.assertTrue(len(results) > 0)

    def test_delete_学院(self):
        self.dao.delete_学院(17)
        result = self.dao.select_学院_by_id(17)
        self.assertIsNone(result)

    @classmethod
    def tearDownClass(cls):
        cls.dao.delete_学院(4001)

if __name__ == "__main__":
    unittest.main()
