import unittest
from DAO.impl.招生目录_DAO_Impl import 招生目录_DAO_Impl
from sql import 招生目录

class Test招生目录DAO(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.dao = 招生目录_DAO_Impl()
        cls.test_招生目录 = 招生目录(招生目录ID=23, 招生年度=2024, 是否通过学校审核=1)

    def test_insert_招生目录(self):
        self.dao.insert_招生目录(self.test_招生目录)
        result = self.dao.select_招生目录_by_id(23)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], 2024)
        self.assertEqual(result[2], 1)

    def test_select_招生目录_by_id(self):
        result = self.dao.select_招生目录_by_id(3001)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], 2024)

    def test_update_招生目录(self):
        updated_招生目录 = 招生目录(招生目录ID=3001, 招生年度=2023, 是否通过学校审核=0)
        self.dao.update_招生目录(updated_招生目录, 3001)
        result = self.dao.select_招生目录_by_id(3001)
        self.assertEqual(result[1], 2023)
        self.assertEqual(result[2], 0)

    def test_select_all_招生目录(self):
        results = self.dao.select_all_招生目录()
        self.assertTrue(len(results) > 0)

    def test_delete_招生目录(self):
        self.dao.delete_招生目录(23)
        result = self.dao.select_招生目录_by_id(23)
        self.assertIsNone(result)

    @classmethod
    def tearDownClass(cls):
        cls.dao.delete_招生目录(3001)

if __name__ == "__main__":
    unittest.main()
