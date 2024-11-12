import unittest
from DAO.impl.User_DAO_Impl import User_DAO_Impl
from sql import 用户

class TestUserDAO(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.dao = User_DAO_Impl()
        cls.test_user = 用户(用户ID=122, 用户名="cy", 更新时间=None, 角色ID=1, 邮箱="test@example.com",
                             手机号="1234567890", 姓名="jm", 密码="password")

    def test_insert_user(self):
        self.dao.insert_user(self.test_user)
        result = self.dao.select_user_by_id(122)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], "cy")

    def test_select_user_by_id(self):
        result = self.dao.select_user_by_id(121)
        self.assertIsNotNone(result)
        self.assertEqual(result[1], "jm")

    def test_update_user(self):
        updated_user = 用户(用户ID=1234, 用户名="cy", 更新时间=None, 角色ID=1, 邮箱="update@example.com", 手机号="0987654321", 姓名="cy", 密码="newpassword")
        self.dao.update_user(updated_user, 121)
        result = self.dao.select_user_by_id(121)
        self.assertEqual(result[1], "cy")

    def test_select_all_users(self):
        results = self.dao.select_all_users()
        self.assertTrue(len(results) > 0)

    def test_delete_user(self):
        self.dao.delete_user(121)
        result = self.dao.select_user_by_id(121)
        self.assertIsNone(result)

    @classmethod
    def tearDownClass(cls):
        cls.dao.delete_user(1234)

if __name__ == "__main__":
    unittest.main()
