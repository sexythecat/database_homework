import unittest
from DAO.impl.包含1_DAO_Impl import 包含1_DAO_Impl
from sql import 包含1

class Test包含1DAO(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.dao = 包含1_DAO_Impl()
        cls.test_包含1 = 包含1(志愿ID=31, 学科ID='070503-01')

    def test_insert_包含1(self):
        self.dao.insert_包含1(self.test_包含1)
        result = self.dao.select_包含1_by_id(31, '070503-01')
        self.assertIsNotNone(result)
        self.assertEqual(result[0], 31)
        self.assertEqual(result[1], '070503-01')


    def test_select_包含1_by_id(self):
        result = self.dao.select_包含1_by_id(30, '070503-01')
        self.assertIsNotNone(result)
        self.assertEqual(result[0], 30)
        self.assertEqual(result[1], '070503-01')

    def test_select_all_包含1(self):
        results = self.dao.select_all_包含1()
        self.assertTrue(len(results) > 0)

    def test_delete_包含1(self):
        self.dao.delete_包含1(31, '070503-01')
        result = self.dao.select_包含1_by_id(31, '070503-01')
        self.assertIsNone(result)

    @classmethod
    def tearDownClass(cls):
        cls.dao.delete_包含1(31, '070503-01')

if __name__ == "__main__":
    unittest.main()
