import unittest

from DAO.impl.Role_DAO_Impl import Role_DAO_Impl
from sql import 角色


class TestRoleDAO(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.dao = Role_DAO_Impl()
        # 创建一个测试用的角色对象，确保角色ID和角色权限是整数
        cls.test_role = 角色(角色ID=1478, 角色名称="曹源", 角色描述="测试", 角色权限=10)

    def test_insert_role(self):
        # 测试插入
        self.dao.insert_role(self.test_role)
        result = self.dao.select_role_by_id(1478)  # 传入整数类型的角色ID
        self.assertIsNotNone(result)
        self.assertEqual(result[1], "曹源")  # 假设角色名称在第2列

    def test_select_role_by_id(self):
        # 测试根据ID查询
        result = self.dao.select_role_by_id("1478")
        self.assertIsNotNone(result)
        self.assertEqual(result[1], "123")  # 验证角色名称

    def test_update_role(self):
        # 测试更新角色，确保角色ID和角色权限是整数
        updated_role = 角色(角色ID=1478, 角色名称="更新后的角色", 角色描述="更新描述", 角色权限=5)  # 设置合理的权限值
        self.dao.update_role(updated_role, 999)  # 传入整数类型的角色ID
        result = self.dao.select_role_by_id(999)
        self.assertEqual(result[1], "更新后的角色")  # 假设角色名称在第2列  # 验证更新后的名称

    def test_select_all(self):
        # 测试查询所有角色
        sql = "SELECT * FROM 角色"
        results = self.dao.select_all(sql)
        self.assertTrue(len(results) > 0)

    def test_delete_role(self):
        # 测试删除角色
        self.dao.delete_role("1478")
        result = self.dao.select_role_by_id("1478")
        self.assertIsNone(result)

    @classmethod
    def tearDownClass(cls):
        # 确保测试完成后删除测试数据
        cls.dao.delete_role("999")


if __name__ == "__main__":
    unittest.main()
