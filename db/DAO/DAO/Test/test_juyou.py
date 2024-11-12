import unittest
from DAO.impl.具有_DAO_Impl import 具有_DAO_Impl
from sql import 具有

class Test具有DAO(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.dao = 具有_DAO_Impl()
        cls.test_具有 = 具有(学科ID="CS01", 招生目录ID=2024)

    def test_insert_具有(self):
        self.dao.insert_具有(self.test_具有)
        result = self.dao.select_具有_by_id("CS01", 2024)
        self.assertIsNotNone(result)
        self.assertEqual(result[0], "CS01")
        self.assertEqual(result[1], 2024)

    def test_select_具有_by_id(self):
        result = self.dao.select_具有_by_id("CS01", 2024)
        self.assertIsNotNone(result)
        self.assertEqual(result[0], "CS01")
        self.assertEqual(result[1], 2024)

    def test_select_all_具有(self):
        results = self.dao.select_all_具有()
        self.assertTrue(len(results) > 0)

    def test_delete_具有(self):
        self.dao.delete_具有("CS01", 2024)
        result = self.dao.select_具有_by_id("CS01", 2024)
        self.assertIsNone(result)

    @classmethod
    def tearDownClass(cls):
        cls.dao.delete_具有("CS01", 2024)

if __name__ == "__main__":
    unittest.main()
