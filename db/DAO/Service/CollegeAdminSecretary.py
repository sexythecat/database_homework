import UserRegister
from Role_DAO_Impl import Role_DAO_Impl
from sql import 考试科目, 成绩, 复试志愿
from 复试志愿_DAO_Impl import 复试志愿_DAO_Impl
from 成绩_DAO_Impl import 成绩_DAO_Impl
from 考试科目_DAO_Impl import 考试科目_DAO_Impl


class CollegeAdminSecretary:
    #初试科目
    def recordFirstSubjectInformation(self, 角色ID,考试科目ID, 名称, 考试时间, 考试地点):
        # 按照要求存储过程逻辑写好了
        user = UserRegister.Service_User_Register.findUser(角色ID)
        角色 = Role_DAO_Impl.select_role_by_id(user.角色ID)
        # 判定
        if (角色.角色名称 == "研究生管理秘书"):
            # 录入初试考试科目信息
            考试=考试科目(考试科目ID=考试科目ID, 类别='初试', 名称=名称, 考试时间=考试时间, 考试地点=考试地点)
            考试科目_DAO_Impl.insert_role(考试)

    #初试成绩
    def recordFirstScoreformation(self, 角色ID,考生ID, 考试科目ID, 数值):
        # 按照要求存储过程逻辑写好了
        user = UserRegister.Service_User_Register.findUser(角色ID)
        角色 = Role_DAO_Impl.select_role_by_id(user.角色ID)
        if (角色.角色名称 == "研究生管理秘书"):
            # 录入初试考试科目信息
            score=成绩 (考生ID, 考试科目ID, 数值)
            成绩_DAO_Impl.insert_score(score)
    #复试科目
    def recordLastSubjectInformation(self,角色ID,考试科目ID, 名称, 考试时间, 考试地点):
        # 按照要求存储过程逻辑写好了
        user = UserRegister.Service_User_Register.findUser(角色ID)
        角色 = Role_DAO_Impl.select_role_by_id(user.角色ID)
        if (角色.角色名称 == "研究生管理秘书"):
            # 录入初试考试科目信息
            考试 = 考试科目(考试科目ID=考试科目ID, 类别='复试', 名称=名称, 考试时间=考试时间, 考试地点=考试地点)
            考试科目_DAO_Impl.insert_role(考试)
    #复试分数
    def recordScoreInformation(self,角色ID,考生ID, 考试科目ID, 数值):
        user = UserRegister.Service_User_Register
        角色 = Role_DAO_Impl.select_role_by_id(user.角色ID)
        if (角色.角色名称 == "研究生管理秘书"):
            # 录入初试考试科目信息
            score = 成绩(考生ID, 考试科目ID, 数值)
            成绩_DAO_Impl.insert_score(score)
    #复试志愿
    def reExaminationPreference(self,志愿ID,考生ID, 导师ID, 学科ID, 志愿顺序, 是否接受方向调整, 更新时间, 创建时间):
        user = UserRegister.Service_User_Register
        角色 = Role_DAO_Impl.select_role_by_id(user.角色ID)
        if (角色.角色名称 == "研究生管理秘书"):
            preference=复试志愿(志愿ID,考生ID, 导师ID, 学科ID, 志愿顺序, 是否接受方向调整, 更新时间, 创建时间)
            复试志愿_DAO_Impl.insert_preference(preference)

    # 收集和审核复试考生的信息




    # 发布录取结果



pass