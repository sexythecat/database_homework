import unittest
from DAO.impl.拥有_DAO_Impl import 拥有_DAO_Impl
from sql import 拥有

class Test拥有DAO(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.dao = 拥有_DAO_Impl()
        cls.test_拥有 = 拥有(考生ID=13, 总成绩ID=21)

    def test_insert_拥有(self):
        self.dao.insert_拥有(self.test_拥有)
        result = self.dao.select_拥有_by_id(13, 21)
        self.assertIsNotNone(result)
        self.assertEqual(result[0], 13)
        self.assertEqual(result[1], 21)

    def test_select_拥有_by_id(self):
        result = self.dao.select_拥有_by_id(13, 21)
        self.assertIsNotNone(result)
        self.assertEqual(result[0], 13)
        self.assertEqual(result[1], 21)

    def test_select_all_拥有(self):
        results = self.dao.select_all_拥有()
        self.assertTrue(len(results) > 0)

    def test_delete_拥有(self):
        self.dao.delete_拥有(13, 21)
        result = self.dao.select_拥有_by_id(13, 21)
        self.assertIsNone(result)

    @classmethod
    def tearDownClass(cls):
        cls.dao.delete_拥有(13, 21)

if __name__ == "__main__":
    unittest.main()
