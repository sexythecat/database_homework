import unittest
import datetime

from CollegeAdminSecretary import CollegeAdminSecretary
from DisciplineLeader import DisciplineLeader
from GraduateProgramDirector import GraduateProgramDirector
from Tutor import Tutor
from UserRegister import Service_User_Register
from sql import 用户
from Candidate import Candidate


class MyTestCase(unittest.TestCase):
    """
    测试用户注册:将其和查询输出的User比对即可
    不用内置的assert,因为表结构里面还保存的有创建时间这些字段
    注册用户信息:用户ID=122, 用户名="cy", 更新时间=None, 角色ID=1, 邮箱="test@example.com",手机号="1234567890", 姓名="jm", 密码="password"
    """
    def test_UserRegister(self):
        service_user_register_obj=Service_User_Register()
        service_user_register_obj.userRegister(用户ID=122, 用户名="cy", 更新时间=None, 角色ID=1, 邮箱="test@example.com",
                                           手机号="1234567890", 姓名="jm", 密码="password")
        userTest=Service_User_Register.findUser(122);
    """
    考生根据复试表填写个人报考信息:
    并查看考生的个人信息去进行验证
    考生信息:考生ID=122,考生类别="应届生",性别="男",生源地="广东省",个人简历="擅长于java语言等多种类型的语言开发工作",更新时间=None,创建时间=None,用户ID=122,身份证号="42201200420313031",毕业时间="2022-7-30",出生日期="1980-12-11",本科毕业学校名称="北京林业大学",本科专业="电子信息",本科毕业学校类型="普通本科大学"
    
    """
    def test_CandidateRegister(self):
        candidate_obj = Candidate()
        candidate_obj.candidateRegister(考生ID=103,考生类别="应届生",性别="男",生源地="广东省",个人简历="擅长于java语言等多种类型的语言开发工作",更新时间=None,创建时间=datetime.datetime.today().date(),用户ID=122,身份证号=123123213132,毕业时间="2022-7-30",出生日期="1980-12-11",本科毕业学校名称="北京林业大学",本科专业="电子信息",本科毕业学校类型="普通本科大学")
        # 验证是否插入成功
        candidate_obj.findCandidateByID(103)
    """
    考生填报个人志愿:
    个人志愿表信息: 志愿ID=40,导师ID=123,考生ID=103,学科ID='070503',志愿顺序=1,是否接受方向调整=True,更新时间=None,创建时间=datetime.datetime.today().date()
    """
    def test_CandidateFill(self):
        candidate_obj = Candidate()
        candidate_obj.fillSupervisorPreferences(志愿ID=40,导师ID=123,考生ID=103,学科ID='070503',志愿顺序=1,是否接受方向调整=True,更新时间=None,创建时间=datetime.datetime.today().date())
        # 验证是否插入成功
        candidate_obj.findCandidateByID(103)
        # 自动生成等待审核的志愿结果:
        tutor_obj = Tutor()
        tutor_obj.tutorConfirm(复试结果ID=11, 考生ID=103, 更新时间=None, 创建时间=datetime.datetime.today().date(),
                               最终导师ID=123, 录取状态='待审核', 综合评价='表现优秀', 待确认=None)

    """
    考生查看复试录取结果:
    输入考生ID即可查询:
    
    """
    def test_CandidateFindResult(self):
        candidate_obj = Candidate()
        # 输入考生ID查看结果即可
        candidate_obj.findSupervisorPreferencesByID(103)



    """
    导师注册:和上面一样先进行用户注册,再填写导师个人的相关信息
    用户ID=123, 用户名="genco", 更新时间=None, 角色ID=1, 邮箱="test@example.com",手机号="1234567890", 姓名="jm", 密码="password"
    导师ID=41,照片路径="http://www.genco.com",用户ID=123,更新时间=None,创建时间=datetime.datetime.today().date(),是否具有招生资格=true,简介='主攻方向为xxx的某某导师,研究的是xxx',职称='副教授',导师类别='学科导师',审核状态='已通过',学院ID='4'
    """
    def test_TutorRegister(self):
        service_user_register_obj = Service_User_Register()
        service_user_register_obj.userRegister(用户ID=123, 用户名="genco", 更新时间=None, 角色ID=1,
                                               邮箱="genco@123.com",
                                               手机号="1234567890", 姓名="genco", 密码="password")
        tutor_obj = Tutor()
        tutor_obj.tutorRegister(导师ID=123,照片路径="http://www.genco.com",用户ID=123,更新时间=None,创建时间=datetime.datetime.today().date(),是否具有招生资格='true',简介='主攻方向为xxx的某某导师,研究的是xxx',职称='副教授',导师类别='学科导师',审核状态='已通过',学院ID='4')
        tutor_obj.findTutorByid(123)

    """
        复试结果: 复试结果ID=11 ,考生ID=103 ,更新时间=None ,创建时间=datetime.datetime.today().date(),最终导师ID=123,录取状态='待审核',综合评价='表现优秀',待确认=None
        导师确认选择了自己的学生
    """
    def test_ConfirmCandidate(self):
        tutor_obj = Tutor()
        tutor_obj.tutorConfirm(复试结果ID=11 ,考生ID=103 ,更新时间=None ,创建时间=datetime.datetime.today().date(),最终导师ID=123,录取状态='已录取',综合评价='表现优秀',待确认=None)

    """
        导师查看整体选择自己的结果考生ID
    """
    def test_TutorChooseCandidate(self):
        tutor_obj = Tutor()
        # 输入导师的ID号
        tutor_obj.tutorSelectAllByTutorID(123)
    """
        学科负责人: 确认方向 
        确定方向,但这里其实存在问题,即更新研究方向,但是更新的时候只要求输入学科研究方向,学科概述,学科ID等,别的复用之前的但读取出来的会是乱码
    """
    def test_ConfirmSubjectDirection(self):
        service_user_register_obj = Service_User_Register()
        service_user_register_obj.userRegister(用户ID=150, 用户名="Leader", 更新时间=None, 角色ID=4,
                                               邮箱="test@example.com",
                                               手机号="1234567890", 姓名="Leader", 密码="password")
        # 角色确定为学科负责人
        disciplineleader_obj=DisciplineLeader()
        disciplineleader_obj.researchFocusDefiner(4,学科ID='071001',学科研究方向="植物科学、植物生物学",学科概述="动物学科相关研究")
        # 确认研究方向


    """
    下面的用户ID=160,代表的含义是用户ID为160
    研究生管理秘书:任务
    录入考生初试信息:
    """
    def test_recordFirstSubjectInformation(self):
        service_user_register_obj = Service_User_Register()
        service_user_register_obj.userRegister(用户ID=160, 用户名="Secretary", 更新时间=None, 角色ID=7,
                                               邮箱="test@example.com",
                                               手机号="1234567890", 姓名="Leader", 密码="password")
        # 初试考试信息
        collegeAdminSecretary_obj = CollegeAdminSecretary()
        collegeAdminSecretary_obj.recordFirstSubjectInformation(160,77,'思想政治理论','2024-02-04','一教202')
        # # 初试成绩,可自行对其进行修改
        collegeAdminSecretary_obj.recordFirstScoreformation(160,103,77,100)




    """
    研究生管理秘书: 任务
    录入考生复试信息:录入复试信息,录入用户ID为160(研究生管理秘书)
    录入考生的复试分数值
    """
    def test_recordSecondScoreformation(self):
        # 导入对应的科目内容
        collegeAdminSecretary_obj = CollegeAdminSecretary()
        collegeAdminSecretary_obj.recordLastSubjectInformation(160, 77, '思想政治理论', '2024-02-04', '一教202')
        # 录入科目分数,可以根据需要去改动
        collegeAdminSecretary_obj.recordScoreInformation(160,103,77,100)


    """
    研究生管理秘书:任务
    收集和审核复试考生信息
    """
    def test_SecoreFormation(self):
        collegeAdminSecretary_obj = CollegeAdminSecretary()
        # 将考生的状态修改为待审核
        collegeAdminSecretary_obj.getAndJudgeCandidate(160,103)
        # 将考生的状态修改为已确认
        collegeAdminSecretary_obj.confirmCandidate(160,103)


    """
    研究生管理秘书:任务
    发布录取结果
    先插入用户160,即管理负责人,才可以使用
    """
    def test_publish_record(self):
        collegeAdminSecretary_obj = CollegeAdminSecretary()
        print(collegeAdminSecretary_obj.releaseAdmissionResults(160))
    """
    研究生主管领导:
        审议学生的选择结果
    """
    def test_Candidate_Chooose(self):
        # 主管领导注册:
        service_user_register_obj = Service_User_Register()
        service_user_register_obj.userRegister(用户ID=170, 用户名="genco", 更新时间=None, 角色ID=10,
                                               邮箱="genco@123.com",
                                               手机号="1234567890", 姓名="genco", 密码="password")

        GruduateProgram_obj = GraduateProgramDirector()
        GruduateProgram_obj.reviewOfApplicant(170,123)


    #
    # """
    # 监督成员:
    #
    #
    # """


if __name__ == '__main__':
    unittest.main()
