import unittest
from DAO.impl.获得_DAO_Impl import 获得_DAO_Impl
class Test获得DAO(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.dao = 获得_DAO_Impl()
        # 插入测试数据，确保考生ID唯一
        cls.dao.insert_获得(考生ID=13, 复试结果ID=11)

    def test_insert_获得(self):
        # 再次插入，检查插入是否成功
        self.dao.insert_获得(考生ID=13, 复试结果ID=11)
        result = self.dao.select_获得_by_id(13)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], 11)  # 确认复试结果ID正确
        # 清理数据
        self.dao.delete_获得(13)

    def test_select_获得_by_id(self):
        # 查询已存在的数据
        result = self.dao.select_获得_by_id(13)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], 11)  # 检查复试结果ID

    def test_select_all_获得(self):
        # 检查是否能获取所有记录
        results = self.dao.select_all_获得()
        self.assertTrue(len(results) > 0)

    def test_delete_获得(self):
        # 测试删除记录的功能
        self.dao.insert_获得(考生ID=13, 复试结果ID=11)
        self.dao.delete_获得(13)
        result = self.dao.select_获得_by_id(13)
        self.assertIsNone(result)

    @classmethod
    def tearDownClass(cls):
        # 清理初始数据
        cls.dao.delete_获得(13)

if __name__ == '__main__':
    unittest.main()
