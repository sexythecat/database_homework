import unittest
from DAO.impl.复试志愿_DAO_Impl import 复试志愿_DAO_Impl
from sql import 复试志愿

class Test复试志愿DAO(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.dao = 复试志愿_DAO_Impl()
        cls.test_复试志愿 = 复试志愿(志愿ID=31, 导师ID=10, 考生ID=13, 学科ID="070503-01", 志愿顺序=3, 是否接受方向调整=True, 更新时间=None, 创建时间=None)

    def test_insert_复试志愿(self):
        self.dao.insert_复试志愿(self.test_复试志愿)
        result = self.dao.select_复试志愿_by_id(31)
        self.assertIsNotNone(result)
        self.assertEqual(result[4], 31)
        self.assertEqual(result[3], "070503-01")

    def test_select_复试志愿_by_id(self):
        result = self.dao.select_复试志愿_by_id(1)
        self.assertIsNotNone(result)
        self.assertEqual(result[4], 1)

    def test_update_复试志愿(self):
        updated_复试志愿 = 复试志愿(志愿ID=1, 导师ID=102, 考生ID=203, 学科ID="科目002", 志愿顺序=2, 是否接受方向调整=False, 更新时间=None, 创建时间=None)
        self.dao.update_复试志愿(updated_复试志愿, 1)
        result = self.dao.select_复试志愿_by_id(1)
        self.assertEqual(result[1], 102)
        self.assertEqual(result[2], 203)
        self.assertEqual(result[3], "科目002")
        self.assertEqual(result[4], 2)

    def test_select_all_复试志愿(self):
        results = self.dao.select_all_复试志愿()
        self.assertTrue(len(results) > 0)

    def test_delete_复试志愿(self):
        self.dao.delete_复试志愿(30)
        result = self.dao.select_复试志愿_by_id(30)
        self.assertIsNone(result)

    @classmethod
    def tearDownClass(cls):
        cls.dao.delete_复试志愿(1)

if __name__ == "__main__":
    unittest.main()
