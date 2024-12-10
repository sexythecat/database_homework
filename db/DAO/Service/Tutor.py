from sql import 导师, 复试结果
from 复试结果_DAO_Impl import 复试结果_DAO_Impl
from 导师_DAO_Impl import 导师_DAO_Impl
class Tutor:
    #老师注册
    def tutorRegister(self,导师ID, 照片路径, 用户ID, 更新时间, 创建时间, 是否具有招生资格, 简介, 职称, 学院ID, 导师类别, 审核状态):
        tutor_dao=导师_DAO_Impl()
        # 创建考生实例
        tutor =导师(导师ID=导师ID, 照片路径=照片路径, 用户ID=用户ID, 更新时间=更新时间, 创建时间=创建时间, 是否具有招生资格=是否具有招生资格, 简介=简介, 职称=职称, 学院ID=学院ID, 导师类别=导师类别, 审核状态=审核状态)
        # 插入考生
        tutor_dao.insert_导师(tutor)

    # 根据导师ID查看相关信息
    def findTutorByid(self,导师ID):
        tutor_dao = 导师_DAO_Impl()
        导师=tutor_dao.select_导师_by_id(导师ID)
        print("导师:",导师)
    #确认选择学生
    def tutorConfirm(self,复试结果ID, 考生ID, 更新时间, 创建时间, 最终导师ID,录取状态,综合评价):
        复试结果_dao=复试结果_DAO_Impl()
        #创建复试结果确认实例
        result=复试结果.__init__(复试结果ID=复试结果ID, 考生ID=考生ID, 更新时间=更新时间, 创建时间=创建时间, 最终导师ID=最终导师ID, 录取状态=录取状态, 综合评价=综合评价)

        复试结果_dao.insert_复试结果(result)

    # 查看选择结果:
    def  tutorSelectAllByTutorID(self,导师ID):
        复试结果_dao=复试结果_DAO_Impl()
        导师确认复试结果=复试结果_dao.select_all_ByTutorID(导师ID)
        print("确认复试结果:",导师确认复试结果)

    #查看整体选择结果
    def tutorSelectAll(self):
        复试结果_dao = 复试结果_DAO_Impl()
        result=复试结果_dao.select_all_复试结果()
        print(result)

if __name__ == '__main__':
   Tutor.tutorRegister(41,"/path/to/xxx.jpg",123,None,None,True,"导师简介","副教授",6,"学科导师","已通过")