import UserRegister
from Role_DAO_Impl import Role_DAO_Impl
from 学科_DAO_Impl import 学科_DAO_Impl


# 判断角色的ID号,寻找角色
class DisciplineLeader:


    def  researchFocusDefiner(selef,角色ID,学科研究方向,描述):
        # 按照要求存储过程逻辑写好了
        user=UserRegister.Service_User_Register.findUser(角色ID)
        角色=Role_DAO_Impl.select_role_by_id(user.角色ID)
        if(角色.角色名称=="学科负责人"):
            学科=学科_DAO_Impl.select_all_学科()
            for item in 学科:
                if(item.学科ID==学科.学科ID):
                    update学科=学科(item.学科名称,item.学科ID, item.学科名称, item.学科等级, 描述, item.学科类型, 学科研究方向, item.上级学科, item.更新时间, item.创建时间, item.年度总招生指标, item.增补指标)
                    学科_DAO_Impl.update_学科(update学科)



pass

