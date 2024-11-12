import unittest
from DAO.impl.导师_DAO_Impl import 导师_DAO_Impl
from sql import 导师

class Test导师DAO(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.dao = 导师_DAO_Impl()
        cls.test_导师 = 导师(导师ID=41, 照片路径="path/to/photo.jpg", 用户ID=122, 更新时间=None, 创建时间=None, 是否具有招生资格=True, 简介="资深导师",
                             职称="教授", 学院ID=1, 导师类别="全职", 审核状态="已通过")

    def test_insert_导师(self):
        self.dao.insert_导师(self.test_导师)
        result = self.dao.select_导师_by_id(41)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], "path/to/photo.jpg")
        self.assertEqual(result[6], "教授")

    def test_select_导师_by_id(self):
        result = self.dao.select_导师_by_id(1)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], "path/to/photo.jpg")

    def test_update_导师(self):
        updated_导师 = 导师(导师ID=1, 照片路径="path/to/updated_photo.jpg", 用户ID=1001, 更新时间=None, 创建时间=None, 是否具有招生资格=False, 简介="更新后的导师简介",
                            职称="副教授", 学院ID=101, 导师类别="兼职", 审核状态="正在进行")
        self.dao.update_导师(updated_导师, 1)
        result = self.dao.select_导师_by_id(1)
        self.assertEqual(result[1], "path/to/updated_photo.jpg")
        self.assertEqual(result[6], "副教授")

    def test_select_all_导师(self):
        results = self.dao.select_all_导师()
        self.assertTrue(len(results) > 0)

    def test_delete_导师(self):
        self.dao.delete_导师(41)
        result = self.dao.select_导师_by_id(41)
        self.assertIsNone(result)

    @classmethod
    def tearDownClass(cls):
        cls.dao.delete_导师(1)

if __name__ == "__main__":
    unittest.main()
