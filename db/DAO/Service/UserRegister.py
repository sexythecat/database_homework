# main.py
from sql import 用户
from User_DAO_Impl import User_DAO_Impl


# 全体用户的注册方式
class Service_User_Register():

    def userRegister(self,用户ID, 用户名, 更新时间, 角色ID, 邮箱, 手机号, 姓名, 密码):
        # 创建 User_DAO_Impl 实例
        user_dao = User_DAO_Impl()

        # 创建用户实例
        user = 用户(用户ID=用户ID, 用户名=用户名, 更新时间=更新时间, 角色ID=角色ID, 邮箱=邮箱,
                    手机号=手机号, 姓名=姓名, 密码=密码)

        # 插入用户
        user_dao.insert_user(user)


    def findUser(userId)->用户:
        # 创建 User_DAO_Impl 实例
        user_dao = User_DAO_Impl()
        # 示例：根据用户ID查询用户
        result = user_dao.select_user_by_id(userId)
        print("用户信息:", result)
        return result


    def selectAllUser(self):
        user_dao = User_DAO_Impl()
        # 示例：查询所有用户
        all_users = user_dao.select_all_users()
        print("所有用户信息:", all_users)


    """
    用户ID, 用户名, 更新时间, 角色ID, 邮箱, 手机号, 姓名, 密码
    示例: 用户ID=122,用户名="cy",更新时间=None,角色ID=1,邮箱="test@example.com",手机号="1234567890",姓名="jm",密码="password"
    """
    def updateUser(userId, 用户ID, 用户名, 更新时间, 角色ID, 邮箱, 手机号, 姓名, 密码):
        user_dao = User_DAO_Impl()
        user = 用户(用户ID=用户ID, 用户名=用户名, 更新时间=更新时间, 角色ID=角色ID, 邮箱=邮箱,
                    手机号=手机号, 姓名=姓名, 密码=密码)
        user_dao.update_user(user, userId)

    def deleteUser(userId):
        user_dao = User_DAO_Impl()
        # 示例：删除用户
        user_dao.delete_user(userId)

# 示例代码
if __name__ == "__main__":
    Service_User_Register.userRegister(用户ID=122,用户名="cy",更新时间=None,角色ID=1,邮箱="test@example.com",手机号="1234567890",姓名="jm",密码="password")