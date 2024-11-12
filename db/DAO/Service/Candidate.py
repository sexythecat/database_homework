from sql import 复试志愿
from Role_DAO_Impl import Role_DAO_Impl
from 复试志愿_DAO_Impl import 复试志愿_DAO_Impl
from 复试结果_DAO_Impl import 复试结果_DAO_Impl
from sql import 考生

# 考生信息:
class Candidate():
    # 注册考生
    def candidateRegister(self, 考生ID, 考生类别, 性别, 生源地, 个人简历, 更新时间, 创建时间, 用户ID, 身份证号, 毕业时间,
                     出生日期, 本科毕业学校名称, 本科专业, 本科毕业学校类型):
        # 创建 Exam_DAO_Impl 实例
        candidate_dao = Role_DAO_Impl()
        # 创建考生实例
        candidate= 考生(考生ID=考生ID, 考生类别=考生类别, 性别=性别, 生源地=生源地, 个人简历=个人简历, 更新时间=更新时间,
                    创建时间=创建时间, 用户ID=用户ID, 身份证号=身份证号, 毕业时间=毕业时间, 出生日期=出生日期,
                    本科毕业学校名称=本科毕业学校名称, 本科专业=本科专业, 本科毕业学校类型=本科毕业学校类型)
        # 插入考生
        candidate_dao.insert_exam(candidate)

    # 注册复试志愿
    def fillSupervisorPreferences(self, 志愿ID, 导师ID, 考生ID, 学科ID, 志愿顺序, 是否接受方向调整, 更新时间, 创建时间):

        复试志愿_DAO=复试志愿_DAO_Impl()
        # 创建复试志愿实例
        志愿 = 复试志愿(志愿ID=志愿ID, 导师ID=导师ID, 考生ID=考生ID, 学科ID=学科ID, 志愿顺序=志愿顺序,
                        是否接受方向调整=是否接受方向调整, 更新时间=更新时间, 创建时间=创建时间)
        # 插入复试志愿
        复试志愿_DAO.insert_复试志愿(志愿)

    def findResult(考生ID):
        复试结果_DAO=复试结果_DAO_Impl()
        复试结果=复试结果_DAO.select_复试结果_by_id(考生ID)
        print("所有用户信息:",复试结果)

pass



