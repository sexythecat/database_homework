import UserRegister
from Role_DAO_Impl import Role_DAO_Impl
from 复试结果_DAO_Impl import 复试结果_DAO_Impl
from 获得_DAO_Impl import 获得_DAO_Impl


class GraduateProgramDirector:
    # 均为用户注册的ID
    def reviewOfApplicant(self,研究生主管领导ID,考生角色ID):
        # 按照要求存储过程逻辑写好了
        user = UserRegister.Service_User_Register.findUser(研究生主管领导ID)
        角色 = Role_DAO_Impl.select_role_by_id(user.角色ID)
        # 判定
        if (角色.角色名称 == "研究生主管领导"):
                candidate = UserRegister.Service_User_Register.findUser(考生角色ID)
                考生 = Role_DAO_Impl.select_role_by_id(candidate.角色ID)
                获得 = 获得_DAO_Impl.select_role_by_id(考生.考生ID)
                复试结果 = 复试结果_DAO_Impl.select_复试结果_by_id(获得.复试结果ID)
                if (复试结果.录取状态 == "已确认"):
                    复试结果.录取状态 = "已录取"
                复试结果_DAO_Impl.update_复试结果(复试结果, 复试结果.复试结果ID)

pass