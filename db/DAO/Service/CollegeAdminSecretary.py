import UserRegister
from Role_DAO_Impl import Role_DAO_Impl
from sql import 考试科目, 成绩, 复试志愿
from 复试志愿_DAO_Impl import 复试志愿_DAO_Impl
from 成绩_DAO_Impl import 成绩_DAO_Impl
from 考试科目_DAO_Impl import 考试科目_DAO_Impl
from 获得_DAO_Impl import 获得_DAO_Impl
from 复试结果_DAO_Impl import 复试结果_DAO_Impl
class CollegeAdminSecretary:
    #初试科目
    def recordFirstSubjectInformation(self, 用户ID,考试科目ID, 名称, 考试时间, 考试地点):
        # 按照要求存储过程逻辑写好了
        user = UserRegister.Service_User_Register.findUser(用户ID)
        Role_DAO_Impl_obj=Role_DAO_Impl()
        角色 = Role_DAO_Impl_obj.select_role_by_id(user[4])
        # 判定
        if (角色[0]==7):
            # 录入初试考试科目信息
            考试=考试科目(考试科目ID=考试科目ID, 类别='初试', 名称=名称, 考试时间=考试时间, 考试地点=考试地点)
            考试科目_DAO_Impl_obj=考试科目_DAO_Impl()
            考试科目_DAO_Impl_obj.insert_考试科目(考试)


    #初试成绩
    def recordFirstScoreformation(self, 用户ID,考生ID, 考试科目ID, 数值):
        # 按照要求存储过程逻辑写好了
        user = UserRegister.Service_User_Register.findUser(用户ID)
        Role_DAO_Impl_obj = Role_DAO_Impl()
        角色 = Role_DAO_Impl_obj.select_role_by_id(user[4])
        # 7的含义是研究生管理秘书
        if (角色[0]== 7):
            # 录入初试考试科目信息
            成绩_DAO_Impl_obj=成绩_DAO_Impl()
            成绩_DAO_Impl_obj.insert_成绩(数值=数值,考试科目ID=考试科目ID,考生ID=考生ID)


    #复试科目
    def recordLastSubjectInformation(self,用户ID,考试科目ID, 名称, 考试时间, 考试地点):
        # 按照要求存储过程逻辑写好了
        user = UserRegister.Service_User_Register.findUser(用户ID)
        Role_DAO_Impl_obj = Role_DAO_Impl()
        角色 = Role_DAO_Impl_obj.select_role_by_id(user[4])
        if (角色[0]==7):
            # 录入复试考试科目信息
            考试 = 考试科目(考试科目ID=考试科目ID, 类别='复试', 名称=名称, 考试时间=考试时间, 考试地点=考试地点)
            考试科目_DAO_Impl_obj=考试科目_DAO_Impl()
            考试科目_DAO_Impl_obj.insert_考试科目(考试)
    #复试分数
    def recordScoreInformation(self,用户ID,考生ID, 考试科目ID, 数值):
        user = UserRegister.Service_User_Register.findUser(用户ID)
        Role_DAO_Impl_obj = Role_DAO_Impl()
        角色 = Role_DAO_Impl_obj.select_role_by_id(user[4])
        if (角色[0]==7):
            # 录入复试考试科目成绩信息
            成绩_DAO_Impl_obj=成绩_DAO_Impl()
            成绩_DAO_Impl_obj.insert_成绩(考生ID=考生ID, 考试科目ID=考试科目ID, 数值=数值)

    #复试志愿
    def reExaminationPreference(self,用户ID,志愿ID,考生ID, 导师ID, 学科ID, 志愿顺序, 是否接受方向调整, 更新时间, 创建时间):
        user = UserRegister.Service_User_Register.findUser(用户ID)
        Role_DAO_Impl_obj = Role_DAO_Impl()
        角色 = Role_DAO_Impl_obj.select_role_by_id(user[4])
        if (角色[0]==7):
            preference=复试志愿(志愿ID=志愿ID,考生ID=考生ID, 导师ID=导师ID, 学科ID=学科ID, 志愿顺序=志愿顺序, 是否接受方向调整=是否接受方向调整, 更新时间=更新时间, 创建时间=创建时间)
            复试志愿_DAO_Impl.insert_preference(preference)

    # 收集和审核复试考生的信息
    def getAndJudgeCandidate(self,用户ID,考生角色ID):
        user = UserRegister.Service_User_Register.findUser(用户ID)
        Role_DAO_Impl_obj = Role_DAO_Impl()
        角色 = Role_DAO_Impl_obj.select_role_by_id(user[4])
        if (角色[0]==7):
            复试结果_DAO_Impl_obj=复试结果_DAO_Impl()
            复试结果=复试结果_DAO_Impl_obj.select_复试结果_by_考生ID(考生ID=考生角色ID)
            if(复试结果.录取状态=="待确认"):
                复试结果.录取状态="待审核"
            复试结果_DAO_Impl.update_复试结果(复试结果,复试结果.复试结果ID)

    # 确认复试考生的信息
    def confirmCandidate(self,管理秘书ID,考生角色ID):
        user = UserRegister.Service_User_Register.findUser(管理秘书ID)
        Role_DAO_Impl_obj = Role_DAO_Impl()
        角色 = Role_DAO_Impl_obj.select_role_by_id(user[4])
        if (角色[0] ==7):
            复试结果_DAO_Impl_obj = 复试结果_DAO_Impl()
            复试结果 = 复试结果_DAO_Impl_obj.select_复试结果_by_考生ID(考生ID=考生角色ID)
            if (复试结果.录取状态 == "待审核"):
                复试结果.录取状态 = "已确认"
            复试结果_DAO_Impl.update_复试结果(复试结果, 复试结果.复试结果ID)





    # 发布录取结果
    def releaseAdmissionResults(self,用户ID):
        user = UserRegister.Service_User_Register.findUser(用户ID)
        Role_DAO_Impl_obj = Role_DAO_Impl()
        角色 = Role_DAO_Impl_obj.select_role_by_id(user[4])
        if (角色[0] == 7):
            复试结果=复试结果_DAO_Impl.select_all_复试结果()
            # 创建一个字典链表来存储符合条件的复试结果
        results_list = []
        for item in 复试结果:
            print(item[0])
            if(item[0]=="已确认"):
                # 将每一条符合条件的结果转为字典并加入链表
                result_dict = {
                    "学生ID": item.学生ID,
                    "姓名": item.姓名,
                    "录取状态": item.录取状态,
                    "专业": item.专业,
                    "复试分数": item.复试分数,
                    # 根据复试结果的字段添加更多的键值对
                }
                results_list.append(result_dict)

        # 返回或处理字典链表
        return results_list








pass