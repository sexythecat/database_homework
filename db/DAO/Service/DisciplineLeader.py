import datetime

import UserRegister
from Role_DAO_Impl import Role_DAO_Impl
from sql import 角色, 学科
from 学科_DAO_Impl import 学科_DAO_Impl


# 判断角色的ID号,寻找角色
class DisciplineLeader:

    # 学科负责人确定学科方向
    def  researchFocusDefiner(selef,用户ID,学科ID,学科研究方向,学科概述):
        # 按照要求存储过程逻辑写好了
        user=UserRegister.Service_User_Register.findUser(用户ID)
        role_DAO_Impl_obj=Role_DAO_Impl()
        角色ID = role_DAO_Impl_obj.select_role_by_id(user[0])  # 假设角色ID在元组中的第一个位置
        if(角色ID[0]==4):
            学科_DAO_Impl_obj=学科_DAO_Impl()
            学科列表=学科_DAO_Impl_obj.select_all_学科()
            for item in 学科列表:
                if(item[0]==学科ID):
                    update学科=学科(学科ID,item[1], item[2], 学科概述, item[4], 学科研究方向, item[6], datetime.datetime.today().date(), item[8], item[9], item[10])
                    学科_DAO_Impl_obj.update_学科(update学科,学科ID)
                    print("学科研究方向已经修改")
                else:
                    print("无对应学科ID,无法更新研究方向")



pass

