import unittest
from DAO.impl.复试结果_DAO_Impl import 复试结果_DAO_Impl
from sql import 复试结果

class Test复试结果DAO(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.dao = 复试结果_DAO_Impl()
        cls.test_复试结果 = 复试结果(复试结果ID=12, 考生ID=7, 更新时间=None, 创建时间=None,
                                   最终导师ID=3, 录取状态="已录取", 综合评价="良好")

    def test_insert_复试结果(self):
        self.dao.insert_复试结果(self.test_复试结果)
        result = self.dao.select_复试结果_by_id(12)
        self.assertIsNotNone(result)
        self.assertEqual(result[5], "已录取")

    def test_select_复试结果_by_id(self):
        result = self.dao.select_复试结果_by_id(3)
        print(result)
        self.assertIsNotNone(result)
        self.assertEqual(result[5], "待审核")

    def test_update_复试结果(self):
        updated_复试结果 = 复试结果(复试结果ID=1, 考生ID=302, 更新时间=None, 创建时间=None,
                                 最终导师ID=102, 录取状态="已录取", 综合评价="优秀")
        self.dao.update_复试结果(updated_复试结果, 1)
        result = self.dao.select_复试结果_by_id(1)
        self.assertEqual(result[1], 302)
        self.assertEqual(result[4], 102)
        self.assertEqual(result[5], "已录取")

    def test_select_all_复试结果(self):
        results = self.dao.select_all_复试结果()
        self.assertTrue(len(results) > 0)

    def test_delete_复试结果(self):
        self.dao.delete_复试结果(11)
        result = self.dao.select_复试结果_by_id(11)
        self.assertIsNone(result)

    @classmethod
    def tearDownClass(cls):
        cls.dao.delete_复试结果(1)

if __name__ == "__main__":
    unittest.main()
