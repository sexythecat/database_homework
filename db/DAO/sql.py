import abc
import pymssql

from dbutils.persistent_db import PersistentDB
#############################################################################

#角色表
class 角色:
    # 初始化方法，用来初始化角色的各个属性
    def __init__(self, 角色ID, 角色名称, 角色描述, 角色权限):
        self.__角色ID = 角色ID                        # 角色ID，存储为私有变量
        self.__角色名称 = 角色名称                    # 角色名称，存储为私有变量
        self.__角色描述 = 角色描述                    # 角色描述，存储为私有变量
        self.__角色权限 = 角色权限                    # 角色权限，存储为私有变量

    # 角色ID的getter方法，获取角色ID
    @property
    def 角色ID(self):
        return self.__角色ID

    # 角色ID的setter方法，设置角色ID
    @角色ID.setter
    def 角色ID(self, 角色ID):
        self.__角色ID = 角色ID

    # 角色名称的getter方法，获取角色名称
    @property
    def 角色名称(self):
        return self.__角色名称

    # 角色名称的setter方法，设置角色名称
    @角色名称.setter
    def 角色名称(self, 角色名称):
        self.__角色名称 = 角色名称

    # 角色描述的getter方法，获取角色描述
    @property
    def 角色描述(self):
        return self.__角色描述

    # 角色描述的setter方法，设置角色描述
    @角色描述.setter
    def 角色描述(self, 角色描述):
        self.__角色描述 = 角色描述

    # 角色权限的getter方法，获取角色权限
    @property
    def 角色权限(self):
        return self.__角色权限

    # 角色权限的setter方法，设置角色权限
    @角色权限.setter
    def 角色权限(self, 角色权限):
        self.__角色权限 = 角色权限


#################################################################
#用户表
class 用户:
    # 初始化方法，用来初始化用户的各个属性
    def __init__(self, 用户ID, 用户名, 更新时间=None, 创建时间=None, 角色ID=None, 邮箱=None, 手机号=None, 姓名=None, 密码=None):
        self.__用户ID = 用户ID                        # 用户ID，存储为私有变量
        self.__用户名 = 用户名                        # 用户名，存储为私有变量
        self.__更新时间 = 更新时间                    # 更新时间，存储为私有变量
        self.__创建时间 = 创建时间 if 创建时间 is not None else "CURRENT_TIMESTAMP"  # 创建时间，默认使用数据库设置
        self.__角色ID = 角色ID                        # 角色ID，存储为私有变量
        self.__邮箱 = 邮箱                            # 邮箱，存储为私有变量
        self.__手机号 = 手机号                        # 手机号，存储为私有变量
        self.__姓名 = 姓名                            # 姓名，存储为私有变量
        self.__密码 = 密码                            # 密码，存储为私有变量

    # 各字段的 getter 和 setter 方法
    # 用户ID的getter方法，获取用户ID
    @property
    def 用户ID(self):
        return self.__用户ID

    @用户ID.setter
    def 用户ID(self, 用户ID):
        self.__用户ID = 用户ID

    @property
    def 用户名(self):
        return self.__用户名

    @用户名.setter
    def 用户名(self, 用户名):
        self.__用户名 = 用户名

    @property
    def 更新时间(self):
        return self.__更新时间

    @更新时间.setter
    def 更新时间(self, 更新时间):
        self.__更新时间 = 更新时间

    @property
    def 创建时间(self):
        return self.__创建时间

    @创建时间.setter
    def 创建时间(self, 创建时间):
        self.__创建时间 = 创建时间

    @property
    def 角色ID(self):
        return self.__角色ID

    @角色ID.setter
    def 角色ID(self, 角色ID):
        self.__角色ID = 角色ID

    @property
    def 邮箱(self):
        return self.__邮箱

    @邮箱.setter
    def 邮箱(self, 邮箱):
        self.__邮箱 = 邮箱

    @property
    def 手机号(self):
        return self.__手机号

    @手机号.setter
    def 手机号(self, 手机号):
        self.__手机号 = 手机号

    @property
    def 姓名(self):
        return self.__姓名

    @姓名.setter
    def 姓名(self, 姓名):
        self.__姓名 = 姓名

    @property
    def 密码(self):
        return self.__密码

    @密码.setter
    def 密码(self, 密码):
        self.__密码 = 密码


############################################################################

#考生表
class 考生:
    # 初始化方法，用来初始化考生的各个属性
    def __init__(self, 考生ID, 考生类别, 性别, 生源地, 个人简历, 更新时间, 创建时间, 用户ID, 身份证号, 毕业时间, 出生日期, 本科毕业学校名称, 本科专业, 本科毕业学校类型):
        self.__考生ID = 考生ID                              # 考生ID，存储为私有变量
        self.__考生类别 = 考生类别                          # 考生类别，存储为私有变量
        self.__性别 = 性别                                  # 性别，存储为私有变量
        self.__生源地 = 生源地                              # 生源地，存储为私有变量
        self.__个人简历 = 个人简历                          # 个人简历，存储为私有变量
        self.__更新时间 = 更新时间                          # 更新时间，存储为私有变量
        self.__创建时间 = 创建时间                          # 创建时间，存储为私有变量
        self.__用户ID = 用户ID                              # 用户ID，存储为私有变量
        self.__身份证号 = 身份证号                          # 身份证号，存储为私有变量
        self.__毕业时间 = 毕业时间                          # 毕业时间，存储为私有变量
        self.__出生日期 = 出生日期                          # 出生日期，存储为私有变量
        self.__本科毕业学校名称 = 本科毕业学校名称          # 本科毕业学校名称，存储为私有变量
        self.__本科专业 = 本科专业                          # 本科专业，存储为私有变量
        self.__本科毕业学校类型 = 本科毕业学校类型          # 本科毕业学校类型，存储为私有变量

    # 考生ID的getter方法，获取考生ID
    @property
    def 考生ID(self):
        return self.__考生ID

    # 考生ID的setter方法，设置考生ID
    @考生ID.setter
    def 考生ID(self, 考生ID):
        self.__考生ID = 考生ID

    # 考生类别的getter方法，获取考生类别
    @property
    def 考生类别(self):
        return self.__考生类别

    # 考生类别的setter方法，设置考生类别
    @考生类别.setter
    def 考生类别(self, 考生类别):
        self.__考生类别 = 考生类别

    # 性别的getter方法，获取性别
    @property
    def 性别(self):
        return self.__性别

    # 性别的setter方法，设置性别
    @性别.setter
    def 性别(self, 性别):
        self.__性别 = 性别

    # 生源地的getter方法，获取生源地
    @property
    def 生源地(self):
        return self.__生源地

    # 生源地的setter方法，设置生源地
    @生源地.setter
    def 生源地(self, 生源地):
        self.__生源地 = 生源地

    # 个人简历的getter方法，获取个人简历
    @property
    def 个人简历(self):
        return self.__个人简历

    # 个人简历的setter方法，设置个人简历
    @个人简历.setter
    def 个人简历(self, 个人简历):
        self.__个人简历 = 个人简历

    # 更新时间的getter方法，获取更新时间
    @property
    def 更新时间(self):
        return self.__更新时间

    # 更新时间的setter方法，设置更新时间
    @更新时间.setter
    def 更新时间(self, 更新时间):
        self.__更新时间 = 更新时间

    # 创建时间的getter方法，获取创建时间
    @property
    def 创建时间(self):
        return self.__创建时间

    # 创建时间的setter方法，设置创建时间
    @创建时间.setter
    def 创建时间(self, 创建时间):
        self.__创建时间 = 创建时间

    # 用户ID的getter方法，获取用户ID
    @property
    def 用户ID(self):
        return self.__用户ID

    # 用户ID的setter方法，设置用户ID
    @用户ID.setter
    def 用户ID(self, 用户ID):
        self.__用户ID = 用户ID

    # 身份证号的getter方法，获取身份证号
    @property
    def 身份证号(self):
        return self.__身份证号

    # 身份证号的setter方法，设置身份证号
    @身份证号.setter
    def 身份证号(self, 身份证号):
        self.__身份证号 = 身份证号

    # 毕业时间的getter方法，获取毕业时间
    @property
    def 毕业时间(self):
        return self.__毕业时间

    # 毕业时间的setter方法，设置毕业时间
    @毕业时间.setter
    def 毕业时间(self, 毕业时间):
        self.__毕业时间 = 毕业时间

    # 出生日期的getter方法，获取出生日期
    @property
    def 出生日期(self):
        return self.__出生日期

    # 出生日期的setter方法，设置出生日期
    @出生日期.setter
    def 出生日期(self, 出生日期):
        self.__出生日期 = 出生日期

    # 本科毕业学校名称的getter方法，获取本科毕业学校名称
    @property
    def 本科毕业学校名称(self):
        return self.__本科毕业学校名称

    # 本科毕业学校名称的setter方法，设置本科毕业学校名称
    @本科毕业学校名称.setter
    def 本科毕业学校名称(self, 本科毕业学校名称):
        self.__本科毕业学校名称 = 本科毕业学校名称

    # 本科专业的getter方法，获取本科专业
    @property
    def 本科专业(self):
        return self.__本科专业

    # 本科专业的setter方法，设置本科专业
    @本科专业.setter
    def 本科专业(self, 本科专业):
        self.__本科专业 = 本科专业

    # 本科毕业学校类型的getter方法，获取本科毕业学校类型
    @property
    def 本科毕业学校类型(self):
        return self.__本科毕业学校类型

    # 本科毕业学校类型的setter方法，设置本科毕业学校类型
    @本科毕业学校类型.setter
    def 本科毕业学校类型(self, 本科毕业学校类型):
        self.__本科毕业学校类型 = 本科毕业学校类型


#############################################################
#总分数表

class 总成绩:
    # 初始化方法，用来初始化总成绩的各个属性
    def __init__(self, 总成绩ID, 类别, 总分数值, 更新时间, 创建时间, 考生ID):
        self.__总成绩ID = 总成绩ID                        # 总成绩ID，存储为私有变量
        self.__类别 = 类别                                # 类别，存储为私有变量
        self.__总分数值 = 总分数值                        # 总分数值，存储为私有变量
        self.__更新时间 = 更新时间                        # 更新时间，存储为私有变量
        self.__创建时间 = 创建时间                        # 创建时间，存储为私有变量
        self.__考生ID = 考生ID                            # 考生ID，存储为私有变量

    # 总成绩ID的getter方法，获取总成绩ID
    @property
    def 总成绩ID(self):
        return self.__总成绩ID

    # 总成绩ID的setter方法，设置总成绩ID
    @总成绩ID.setter
    def 总成绩ID(self, 总成绩ID):
        self.__总成绩ID = 总成绩ID

    # 类别的getter方法，获取类别
    @property
    def 类别(self):
        return self.__类别

    # 类别的setter方法，设置类别
    @类别.setter
    def 类别(self, 类别):
        self.__类别 = 类别

    # 总分数值的getter方法，获取总分数值
    @property
    def 总分数值(self):
        return self.__总分数值

    # 总分数值的setter方法，设置总分数值
    @总分数值.setter
    def 总分数值(self, 总分数值):
        self.__总分数值 = 总分数值

    # 更新时间的getter方法，获取更新时间
    @property
    def 更新时间(self):
        return self.__更新时间

    # 更新时间的setter方法，设置更新时间
    @更新时间.setter
    def 更新时间(self, 更新时间):
        self.__更新时间 = 更新时间

    # 创建时间的getter方法，获取创建时间
    @property
    def 创建时间(self):
        return self.__创建时间

    # 创建时间的setter方法，设置创建时间
    @创建时间.setter
    def 创建时间(self, 创建时间):
        self.__创建时间 = 创建时间

    # 考生ID的getter方法，获取考生ID
    @property
    def 考生ID(self):
        return self.__考生ID

    # 考生ID的setter方法，设置考生ID
    @考生ID.setter
    def 考生ID(self, 考生ID):
        self.__考生ID = 考生ID

#############################################################

#考试科目表
class 考试科目:
    # 初始化方法，用来初始化考试科目的各个属性
    def __init__(self, 考试科目ID, 类别, 名称, 考试时间, 考试地点):
        self.__考试科目ID = 考试科目ID                  # 考试科目ID，存储为私有变量
        self.__类别 = 类别                              # 类别，存储为私有变量，可能的值是 '初试' 或 '复试'
        self.__名称 = 名称                              # 名称，存储为私有变量
        self.__考试时间 = 考试时间                      # 考试时间，存储为私有变量
        self.__考试地点 = 考试地点                      # 考试地点，存储为私有变量

    # 考试科目ID的getter方法，获取考试科目ID
    @property
    def 考试科目ID(self):
        return self.__考试科目ID

    # 考试科目ID的setter方法，设置考试科目ID
    @考试科目ID.setter
    def 考试科目ID(self, 考试科目ID):
        self.__考试科目ID = 考试科目ID

    # 类别的getter方法，获取类别
    @property
    def 类别(self):
        return self.__类别

    # 类别的setter方法，设置类别
    @类别.setter
    def 类别(self, 类别):
        self.__类别 = 类别

    # 名称的getter方法，获取名称
    @property
    def 名称(self):
        return self.__名称

    # 名称的setter方法，设置名称
    @名称.setter
    def 名称(self, 名称):
        self.__名称 = 名称

    # 考试时间的getter方法，获取考试时间
    @property
    def 考试时间(self):
        return self.__考试时间

    # 考试时间的setter方法，设置考试时间
    @考试时间.setter
    def 考试时间(self, 考试时间):
        self.__考试时间 = 考试时间

    # 考试地点的getter方法，获取考试地点
    @property
    def 考试地点(self):
        return self.__考试地点

    # 考试地点的setter方法，设置考试地点
    @考试地点.setter
    def 考试地点(self, 考试地点):
        self.__考试地点 = 考试地点

###########################################################

#招生目录表

class 招生目录:
    # 初始化方法，用来初始化招生目录的各个属性
    def __init__(self, 招生目录ID, 招生年度, 是否通过学校审核):
        self.__招生目录ID = 招生目录ID                # 招生目录ID，存储为私有变量
        self.__招生年度 = 招生年度                      # 招生年度，存储为私有变量，确保年份在合理范围内
        self.__是否通过学校审核 = 是否通过学校审核      # 是否通过学校审核，存储为布尔值，使用 BIT 类型

    # 招生目录ID的getter方法，获取招生目录ID
    @property
    def 招生目录ID(self):
        return self.__招生目录ID

    # 招生目录ID的setter方法，设置招生目录ID
    @招生目录ID.setter
    def 招生目录ID(self, 招生目录ID):
        self.__招生目录ID = 招生目录ID

    # 招生年度的getter方法，获取招生年度
    @property
    def 招生年度(self):
        return self.__招生年度

    # 招生年度的setter方法，设置招生年度
    @招生年度.setter
    def 招生年度(self, 招生年度):
        if 招生年度 < 1900 or 招生年度 > 2100:
            raise ValueError('招生年度必须在1900和2100之间')
        self.__招生年度 = 招生年度

    # 是否通过学校审核的getter方法，获取是否通过学校审核
    @property
    def 是否通过学校审核(self):
        return self.__是否通过学校审核

    # 是否通过学校审核的setter方法，设置是否通过学校审核
    @是否通过学校审核.setter
    def 是否通过学校审核(self, 是否通过学校审核):
        self.__是否通过学校审核 = 是否通过学校审核

#############################################################

#学院表
class 学院:
    # 初始化方法，用来初始化学院的各个属性
    def __init__(self, 学院ID, 学院名称):
        self.__学院ID = 学院ID                      # 学院ID，存储为私有变量
        self.__学院名称 = 学院名称                    # 学院名称，存储为私有变量

    # 学院ID的getter方法，获取学院ID
    @property
    def 学院ID(self):
        return self.__学院ID

    # 学院ID的setter方法，设置学院ID
    @学院ID.setter
    def 学院ID(self, 学院ID):
        self.__学院ID = 学院ID

    # 学院名称的getter方法，获取学院名称
    @property
    def 学院名称(self):
        return self.__学院名称

    # 学院名称的setter方法，设置学院名称
    @学院名称.setter
    def 学院名称(self, 学院名称):
        self.__学院名称 = 学院名称

######################################################################

#学科表

class 学科:
    # 初始化方法，用来初始化学科的各个属性
    def __init__(self, 学科ID, 学科名称, 学科等级, 学科概述, 学科类型, 学科研究方向, 上级学科, 更新时间, 创建时间, 年度总招生指标, 增补指标):
        self.__学科ID = 学科ID                    # 学科ID，存储为私有变量，主键
        self.__学科名称 = 学科名称                  # 学科名称，存储为私有变量
        self.__学科等级 = 学科等级                  # 学科等级，存储为私有变量，使用CHECK约束，值只能是 '一级学科' 或 '二级学科'
        self.__学科概述 = 学科概述                  # 学科概述，存储为私有变量，500字符描述
        self.__学科类型 = 学科类型                  # 学科类型，学术型或专业学位型，存储为私有变量
        self.__学科研究方向 = 学科研究方向            # 学科研究方向，存储为私有变量，最多100字符
        self.__上级学科 = 上级学科                  # 上级学科，存储为私有变量，允许为空
        self.__更新时间 = 更新时间                  # 更新时间，存储为私有变量
        self.__创建时间 = 创建时间                  # 创建时间，存储为私有变量
        self.__年度总招生指标 = 年度总招生指标        # 年度总招生指标，存储为私有变量
        self.__增补指标 = 增补指标                  # 增补指标，存储为私有变量

    # 学科ID的getter方法，获取学科ID
    @property
    def 学科ID(self):
        return self.__学科ID

    # 学科ID的setter方法，设置学科ID
    @学科ID.setter
    def 学科ID(self, 学科ID):
        self.__学科ID = 学科ID

    # 学科名称的getter方法，获取学科名称
    @property
    def 学科名称(self):
        return self.__学科名称

    # 学科名称的setter方法，设置学科名称
    @学科名称.setter
    def 学科名称(self, 学科名称):
        self.__学科名称 = 学科名称

    # 学科等级的getter方法，获取学科等级
    @property
    def 学科等级(self):
        return self.__学科等级

    # 学科等级的setter方法，设置学科等级
    @学科等级.setter
    def 学科等级(self, 学科等级):
        if 学科等级 not in ['一级学科', '二级学科']:
            raise ValueError('学科等级必须是 "一级学科" 或 "二级学科"')
        self.__学科等级 = 学科等级

    # 学科概述的getter方法，获取学科概述
    @property
    def 学科概述(self):
        return self.__学科概述

    # 学科概述的setter方法，设置学科概述
    @学科概述.setter
    def 学科概述(self, 学科概述):
        self.__学科概述 = 学科概述

    # 学科类型的getter方法，获取学科类型
    @property
    def 学科类型(self):
        return self.__学科类型

    # 学科类型的setter方法，设置学科类型
    @学科类型.setter
    def 学科类型(self, 学科类型):
        self.__学科类型 = 学科类型

    # 学科研究方向的getter方法，获取学科研究方向
    @property
    def 学科研究方向(self):
        return self.__学科研究方向

    # 学科研究方向的setter方法，设置学科研究方向
    @学科研究方向.setter
    def 学科研究方向(self, 学科研究方向):
        self.__学科研究方向 = 学科研究方向

    # 上级学科的getter方法，获取上级学科
    @property
    def 上级学科(self):
        return self.__上级学科

    # 上级学科的setter方法，设置上级学科
    @上级学科.setter
    def 上级学科(self, 上级学科):
        self.__上级学科 = 上级学科

    # 更新时间的getter方法，获取更新时间
    @property
    def 更新时间(self):
        return self.__更新时间

    # 更新时间的setter方法，设置更新时间
    @更新时间.setter
    def 更新时间(self, 更新时间):
        self.__更新时间 = 更新时间

    # 创建时间的getter方法，获取创建时间
    @property
    def 创建时间(self):
        return self.__创建时间

    # 创建时间的setter方法，设置创建时间
    @创建时间.setter
    def 创建时间(self, 创建时间):
        self.__创建时间 = 创建时间

    # 年度总招生指标的getter方法，获取年度总招生指标
    @property
    def 年度总招生指标(self):
        return self.__年度总招生指标

    # 年度总招生指标的setter方法，设置年度总招生指标
    @年度总招生指标.setter
    def 年度总招生指标(self, 年度总招生指标):
        self.__年度总招生指标 = 年度总招生指标

    # 增补指标的getter方法，获取增补指标
    @property
    def 增补指标(self):
        return self.__增补指标

    # 增补指标的setter方法，设置增补指标
    @增补指标.setter
    def 增补指标(self, 增补指标):
        self.__增补指标 = 增补指标

#####################################################

#导师表
class 导师:
    # 初始化方法，用来初始化导师的各个属性
    def __init__(self, 导师ID, 照片路径, 用户ID, 更新时间, 创建时间, 是否具有招生资格, 简介, 职称, 学院ID, 导师类别, 审核状态):
        self.__导师ID = 导师ID                        # 导师ID，存储为私有变量，主键
        self.__照片路径 = 照片路径                      # 照片路径，存储为私有变量
        self.__用户ID = 用户ID                        # 用户ID，存储为私有变量，外键
        self.__更新时间 = 更新时间                      # 更新时间，存储为私有变量
        self.__创建时间 = 创建时间                      # 创建时间，存储为私有变量
        self.__是否具有招生资格 = 是否具有招生资格      # 是否具有招生资格，布尔值，存储为私有变量
        self.__简介 = 简介                            # 简介，存储为私有变量，1000字符描述
        self.__职称 = 职称                            # 职称，存储为私有变量，限定为 '副教授'，'教授'，'讲师' 的值
        self.__学院ID = 学院ID                        # 学院ID，存储为私有变量，外键
        self.__导师类别 = 导师类别                      # 导师类别，存储为私有变量
        self.__审核状态 = 审核状态                      # 审核状态，存储为私有变量，限定为 '已通过'，'正在进行'，'未通过' 的值

    # 导师ID的getter方法，获取导师ID
    @property
    def 导师ID(self):
        return self.__导师ID

    # 导师ID的setter方法，设置导师ID
    @导师ID.setter
    def 导师ID(self, 导师ID):
        self.__导师ID = 导师ID

    # 照片路径的getter方法，获取照片路径
    @property
    def 照片路径(self):
        return self.__照片路径

    # 照片路径的setter方法，设置照片路径
    @照片路径.setter
    def 照片路径(self, 照片路径):
        self.__照片路径 = 照片路径

    # 用户ID的getter方法，获取用户ID
    @property
    def 用户ID(self):
        return self.__用户ID

    # 用户ID的setter方法，设置用户ID
    @用户ID.setter
    def 用户ID(self, 用户ID):
        self.__用户ID = 用户ID

    # 更新时间的getter方法，获取更新时间
    @property
    def 更新时间(self):
        return self.__更新时间

    # 更新时间的setter方法，设置更新时间
    @更新时间.setter
    def 更新时间(self, 更新时间):
        self.__更新时间 = 更新时间

    # 创建时间的getter方法，获取创建时间
    @property
    def 创建时间(self):
        return self.__创建时间

    # 创建时间的setter方法，设置创建时间
    @创建时间.setter
    def 创建时间(self, 创建时间):
        self.__创建时间 = 创建时间

    # 是否具有招生资格的getter方法，获取是否具有招生资格
    @property
    def 是否具有招生资格(self):
        return self.__是否具有招生资格

    # 是否具有招生资格的setter方法，设置是否具有招生资格
    @是否具有招生资格.setter
    def 是否具有招生资格(self, 是否具有招生资格):
        self.__是否具有招生资格 = 是否具有招生资格

    # 简介的getter方法，获取简介
    @property
    def 简介(self):
        return self.__简介

    # 简介的setter方法，设置简介
    @简介.setter
    def 简介(self, 简介):
        self.__简介 = 简介

    # 职称的getter方法，获取职称
    @property
    def 职称(self):
        return self.__职称

    # 职称的setter方法，设置职称
    @职称.setter
    def 职称(self, 职称):
        if 职称 not in ['副教授', '教授', '讲师']:
            raise ValueError('职称必须是 "副教授"、"教授" 或 "讲师"')
        self.__职称 = 职称

    # 学院ID的getter方法，获取学院ID
    @property
    def 学院ID(self):
        return self.__学院ID

    # 学院ID的setter方法，设置学院ID
    @学院ID.setter
    def 学院ID(self, 学院ID):
        self.__学院ID = 学院ID

    # 导师类别的getter方法，获取导师类别
    @property
    def 导师类别(self):
        return self.__导师类别

    # 导师类别的setter方法，设置导师类别
    @导师类别.setter
    def 导师类别(self, 导师类别):
        self.__导师类别 = 导师类别

    # 审核状态的getter方法，获取审核状态
    @property
    def 审核状态(self):
        return self.__审核状态

    # 审核状态的setter方法，设置审核状态
    @审核状态.setter
    def 审核状态(self, 审核状态):
        if 审核状态 not in ['已通过', '正在进行', '未通过']:
            raise ValueError('审核状态必须是 "已通过"、"正在进行" 或 "未通过"')
        self.__审核状态 = 审核状态

################################################################################
#招生目录条目表

class 招生目录条目:
    # 初始化方法，用来初始化招生目录条目的各个属性
    def __init__(self, 招生目录条目ID, 年份, 学院ID, 创建时间, 更新时间, 是否招收同等学力, 学科ID):
        self.__招生目录条目ID = 招生目录条目ID        # 招生目录条目ID，存储为私有变量，主键
        self.__年份 = 年份                            # 年份，存储为私有变量，约束在1900到2100之间
        self.__学院ID = 学院ID                        # 学院ID，存储为私有变量，外键
        self.__创建时间 = 创建时间                    # 创建时间，存储为私有变量
        self.__更新时间 = 更新时间                    # 更新时间，存储为私有变量
        self.__是否招收同等学力 = 是否招收同等学力      # 是否招收同等学力，布尔值，存储为私有变量
        self.__学科ID = 学科ID                        # 学科ID，存储为私有变量，外键

    # 招生目录条目ID的getter方法，获取招生目录条目ID
    @property
    def 招生目录条目ID(self):
        return self.__招生目录条目ID

    # 招生目录条目ID的setter方法，设置招生目录条目ID
    @招生目录条目ID.setter
    def 招生目录条目ID(self, 招生目录条目ID):
        self.__招生目录条目ID = 招生目录条目ID

    # 年份的getter方法，获取年份
    @property
    def 年份(self):
        return self.__年份

    # 年份的setter方法，设置年份
    @年份.setter
    def 年份(self, 年份):
        if 年份 < 1900 or 年份 > 2100:
            raise ValueError('年份必须在1900到2100之间')
        self.__年份 = 年份

    # 学院ID的getter方法，获取学院ID
    @property
    def 学院ID(self):
        return self.__学院ID

    # 学院ID的setter方法，设置学院ID
    @学院ID.setter
    def 学院ID(self, 学院ID):
        self.__学院ID = 学院ID

    # 创建时间的getter方法，获取创建时间
    @property
    def 创建时间(self):
        return self.__创建时间

    # 创建时间的setter方法，设置创建时间
    @创建时间.setter
    def 创建时间(self, 创建时间):
        self.__创建时间 = 创建时间

    # 更新时间的getter方法，获取更新时间
    @property
    def 更新时间(self):
        return self.__更新时间

    # 更新时间的setter方法，设置更新时间
    @更新时间.setter
    def 更新时间(self, 更新时间):
        self.__更新时间 = 更新时间

    # 是否招收同等学力的getter方法，获取是否招收同等学力
    @property
    def 是否招收同等学力(self):
        return self.__是否招收同等学力

    # 是否招收同等学力的setter方法，设置是否招收同等学力
    @是否招收同等学力.setter
    def 是否招收同等学力(self, 是否招收同等学力):
        self.__是否招收同等学力 = 是否招收同等学力

    # 学科ID的getter方法，获取学科ID
    @property
    def 学科ID(self):
        return self.__学科ID

    # 学科ID的setter方法，设置学科ID
    @学科ID.setter
    def 学科ID(self, 学科ID):
        self.__学科ID = 学科ID

########################################################

#复试志愿表

class 复试志愿:
    # 初始化方法，用来初始化复试志愿的各个属性
    def __init__(self, 志愿ID, 导师ID, 考生ID, 学科ID, 志愿顺序, 是否接受方向调整, 更新时间, 创建时间):
        self.__志愿ID = 志愿ID                      # 志愿ID，存储为私有变量，主键
        self.__导师ID = 导师ID                      # 导师ID，存储为私有变量，外键
        self.__考生ID = 考生ID                      # 考生ID，存储为私有变量，外键
        self.__学科ID = 学科ID                      # 学科ID，存储为私有变量，外键
        self.__志愿顺序 = 志愿顺序                  # 志愿顺序，存储为私有变量，限定为1、2、3
        self.__是否接受方向调整 = 是否接受方向调整    # 是否接受方向调整，布尔值，存储为私有变量
        self.__更新时间 = 更新时间                    # 更新时间，存储为私有变量
        self.__创建时间 = 创建时间                    # 创建时间，存储为私有变量

    # 志愿ID的getter方法，获取志愿ID
    @property
    def 志愿ID(self):
        return self.__志愿ID

    # 志愿ID的setter方法，设置志愿ID
    @志愿ID.setter
    def 志愿ID(self, 志愿ID):
        self.__志愿ID = 志愿ID

    # 导师ID的getter方法，获取导师ID
    @property
    def 导师ID(self):
        return self.__导师ID

    # 导师ID的setter方法，设置导师ID
    @导师ID.setter
    def 导师ID(self, 导师ID):
        self.__导师ID = 导师ID

    # 考生ID的getter方法，获取考生ID
    @property
    def 考生ID(self):
        return self.__考生ID

    # 考生ID的setter方法，设置考生ID
    @考生ID.setter
    def 考生ID(self, 考生ID):
        self.__考生ID = 考生ID

    # 学科ID的getter方法，获取学科ID
    @property
    def 学科ID(self):
        return self.__学科ID

    # 学科ID的setter方法，设置学科ID
    @学科ID.setter
    def 学科ID(self, 学科ID):
        self.__学科ID = 学科ID

    # 志愿顺序的getter方法，获取志愿顺序
    @property
    def 志愿顺序(self):
        return self.__志愿顺序

    # 志愿顺序的setter方法，设置志愿顺序
    @志愿顺序.setter
    def 志愿顺序(self, 志愿顺序):
        if 志愿顺序 not in [1, 2, 3]:
            raise ValueError('志愿顺序只能是1、2、3')
        self.__志愿顺序 = 志愿顺序

    # 是否接受方向调整的getter方法，获取是否接受方向调整
    @property
    def 是否接受方向调整(self):
        return self.__是否接受方向调整

    # 是否接受方向调整的setter方法，设置是否接受方向调整
    @是否接受方向调整.setter
    def 是否接受方向调整(self, 是否接受方向调整):
        self.__是否接受方向调整 = 是否接受方向调整

    # 更新时间的getter方法，获取更新时间
    @property
    def 更新时间(self):
        return self.__更新时间

    # 更新时间的setter方法，设置更新时间
    @更新时间.setter
    def 更新时间(self, 更新时间):
        self.__更新时间 = 更新时间

    # 创建时间的getter方法，获取创建时间
    @property
    def 创建时间(self):
        return self.__创建时间

    # 创建时间的setter方法，设置创建时间
    @创建时间.setter
    def 创建时间(self, 创建时间):
        self.__创建时间 = 创建时间

#################################################################3

#复试结果表
class 复试结果:
    # 初始化方法，用来初始化复试结果的各个属性
    def __init__(self, 复试结果ID, 考生ID, 更新时间, 创建时间, 最终导师ID, 录取状态, 综合评价):
        self.__复试结果ID = 复试结果ID              # 复试结果ID，存储为私有变量，主键
        self.__考生ID = 考生ID                      # 考生ID，存储为私有变量，外键
        self.__更新时间 = 更新时间                  # 更新时间，存储为私有变量
        self.__创建时间 = 创建时间                  # 创建时间，存储为私有变量
        self.__最终导师ID = 最终导师ID              # 最终导师ID，存储为私有变量，外键
        self.__录取状态 = 录取状态                    # 录取状态，存储为私有变量，限定为'已录取', '待审核', '未录取'
        self.__综合评价 = 综合评价                    # 综合评价，存储为私有变量

    # 复试结果ID的getter方法，获取复试结果ID
    @property
    def 复试结果ID(self):
        return self.__复试结果ID

    # 复试结果ID的setter方法，设置复试结果ID
    @复试结果ID.setter
    def 复试结果ID(self, 复试结果ID):
        self.__复试结果ID = 复试结果ID

    # 考生ID的getter方法，获取考生ID
    @property
    def 考生ID(self):
        return self.__考生ID

    # 考生ID的setter方法，设置考生ID
    @考生ID.setter
    def 考生ID(self, 考生ID):
        self.__考生ID = 考生ID

    # 更新时间的getter方法，获取更新时间
    @property
    def 更新时间(self):
        return self.__更新时间

    # 更新时间的setter方法，设置更新时间
    @更新时间.setter
    def 更新时间(self, 更新时间):
        self.__更新时间 = 更新时间

    # 创建时间的getter方法，获取创建时间
    @property
    def 创建时间(self):
        return self.__创建时间

    # 创建时间的setter方法，设置创建时间
    @创建时间.setter
    def 创建时间(self, 创建时间):
        self.__创建时间 = 创建时间

    # 最终导师ID的getter方法，获取最终导师ID
    @property
    def 最终导师ID(self):
        return self.__最终导师ID

    # 最终导师ID的setter方法，设置最终导师ID
    @最终导师ID.setter
    def 最终导师ID(self, 最终导师ID):
        self.__最终导师ID = 最终导师ID

    # 录取状态的getter方法，获取录取状态
    @property
    def 录取状态(self):
        return self.__录取状态

    # 录取状态的setter方法，设置录取状态
    @录取状态.setter
    def 录取状态(self, 录取状态):
        if 录取状态 not in ['已录取', '待审核', '未录取']:
            raise ValueError('录取状态必须是 "已录取", "待审核" 或 "未录取"')
        self.__录取状态 = 录取状态

    # 综合评价的getter方法，获取综合评价
    @property
    def 综合评价(self):
        return self.__综合评价

    # 综合评价的setter方法，设置综合评价
    @综合评价.setter
    def 综合评价(self, 综合评价):
        self.__综合评价 = 综合评价

#####################################################################

#具有表

class 具有:
    # 初始化方法，用来初始化具有的各个属性
    def __init__(self, 学科ID, 招生目录ID):
        self.__学科ID = 学科ID          # 学科ID，存储为私有变量，外键引用学科表
        self.__招生目录ID = 招生目录ID  # 招生目录ID，存储为私有变量，外键引用招生目录表

    # 学科ID的getter方法，获取学科ID
    @property
    def 学科ID(self):
        return self.__学科ID

    # 学科ID的setter方法，设置学科ID
    @学科ID.setter
    def 学科ID(self, 学科ID):
        self.__学科ID = 学科ID

    # 招生目录ID的getter方法，获取招生目录ID
    @property
    def 招生目录ID(self):
        return self.__招生目录ID

    # 招生目录ID的setter方法，设置招生目录ID
    @招生目录ID.setter
    def 招生目录ID(self, 招生目录ID):
        self.__招生目录ID = 招生目录ID



######################################################

#拥有表

class 拥有:
    # 初始化方法，用来初始化拥有的各个属性
    def __init__(self, 考生ID, 总成绩ID):
        self.__考生ID = 考生ID          # 考生ID，存储为私有变量，外键引用考生表
        self.__总成绩ID = 总成绩ID      # 总成绩ID，存储为私有变量，外键引用总成绩表

    # 考生ID的getter方法，获取考生ID
    @property
    def 考生ID(self):
        return self.__考生ID

    # 考生ID的setter方法，设置考生ID
    @考生ID.setter
    def 考生ID(self, 考生ID):
        self.__考生ID = 考生ID

    # 总成绩ID的getter方法，获取总成绩ID
    @property
    def 总成绩ID(self):
        return self.__总成绩ID

    # 总成绩ID的setter方法，设置总成绩ID
    @总成绩ID.setter
    def 总成绩ID(self, 总成绩ID):
        self.__总成绩ID = 总成绩ID


######################################################

#包含1表
class 包含1:
    # 初始化方法，用来初始化包含1的各个属性
    def __init__(self, 志愿ID, 学科ID):
        self.__志愿ID = 志愿ID        # 志愿ID，存储为私有变量，外键引用复试志愿表
        self.__学科ID = 学科ID        # 学科ID，存储为私有变量，外键引用学科表

    # 志愿ID的getter方法，获取志愿ID
    @property
    def 志愿ID(self):
        return self.__志愿ID

    # 志愿ID的setter方法，设置志愿ID
    @志愿ID.setter
    def 志愿ID(self, 志愿ID):
        self.__志愿ID = 志愿ID

    # 学科ID的getter方法，获取学科ID
    @property
    def 学科ID(self):
        return self.__学科ID

    # 学科ID的setter方法，设置学科ID
    @学科ID.setter
    def 学科ID(self, 学科ID):
        self.__学科ID = 学科ID


#########################################################################

#选择表
class 选择:
    # 初始化方法，用来初始化选择的各个属性
    def __init__(self, 志愿ID, 导师ID):
        self.__志愿ID = 志愿ID        # 志愿ID，存储为私有变量，外键引用复试志愿表
        self.__导师ID = 导师ID        # 导师ID，存储为私有变量，外键引用导师表

    # 志愿ID的getter方法，获取志愿ID
    @property
    def 志愿ID(self):
        return self.__志愿ID

    # 志愿ID的setter方法，设置志愿ID
    @志愿ID.setter
    def 志愿ID(self, 志愿ID):
        self.__志愿ID = 志愿ID

    # 导师ID的getter方法，获取导师ID
    @property
    def 导师ID(self):
        return self.__导师ID

    # 导师ID的setter方法，设置导师ID
    @导师ID.setter
    def 导师ID(self, 导师ID):
        self.__导师ID = 导师ID

########################################################3

#确定表

class 确定:
    # 初始化方法，用来初始化确定的各个属性
    def __init__(self, 复试结果ID, 导师ID):
        self.__复试结果ID = 复试结果ID      # 复试结果ID，存储为私有变量，外键引用复试结果表
        self.__导师ID = 导师ID              # 导师ID，存储为私有变量，外键引用导师表

    # 复试结果ID的getter方法，获取复试结果ID
    @property
    def 复试结果ID(self):
        return self.__复试结果ID

    # 复试结果ID的setter方法，设置复试结果ID
    @复试结果ID.setter
    def 复试结果ID(self, 复试结果ID):
        self.__复试结果ID = 复试结果ID

    # 导师ID的getter方法，获取导师ID
    @property
    def 导师ID(self):
        return self.__导师ID

    # 导师ID的setter方法，设置导师ID
    @导师ID.setter
    def 导师ID(self, 导师ID):
        self.__导师ID = 导师ID

########################################################################

#对应1表

class 对应1:
    # 初始化方法，用来初始化对应1的各个属性
    def __init__(self, 导师ID, 用户ID):
        self.__导师ID = 导师ID        # 导师ID，存储为私有变量，外键引用导师表
        self.__用户ID = 用户ID        # 用户ID，存储为私有变量，外键引用用户表

    # 导师ID的getter方法，获取导师ID
    @property
    def 导师ID(self):
        return self.__导师ID

    # 导师ID的setter方法，设置导师ID
    @导师ID.setter
    def 导师ID(self, 导师ID):
        self.__导师ID = 导师ID

    # 用户ID的getter方法，获取用户ID
    @property
    def 用户ID(self):
        return self.__用户ID

    # 用户ID的setter方法，设置用户ID
    @用户ID.setter
    def 用户ID(self, 用户ID):
        self.__用户ID = 用户ID

########################################################
#对应2表


class 对应2:
    # 初始化方法，用来初始化对应2的各个属性
    def __init__(self, 考生ID, 用户ID):
        self.__考生ID = 考生ID        # 考生ID，存储为私有变量，外键引用考生表
        self.__用户ID = 用户ID        # 用户ID，存储为私有变量，外键引用用户表

    # 考生ID的getter方法，获取考生ID
    @property
    def 考生ID(self):
        return self.__考生ID

    # 考生ID的setter方法，设置考生ID
    @考生ID.setter
    def 考生ID(self, 考生ID):
        self.__考生ID = 考生ID

    # 用户ID的getter方法，获取用户ID
    @property
    def 用户ID(self):
        return self.__用户ID

    # 用户ID的setter方法，设置用户ID
    @用户ID.setter
    def 用户ID(self, 用户ID):
        self.__用户ID = 用户ID


#############################################################################
#获得表

class 获得:
    # 初始化方法，用来初始化获得的各个属性
    def __init__(self, 考生ID, 复试结果ID):
        self.__考生ID = 考生ID        # 考生ID，存储为私有变量，外键引用考生表
        self.__复试结果ID = 复试结果ID  # 复试结果ID，存储为私有变量，外键引用复试结果表

    # 考生ID的getter方法，获取考生ID
    @property
    def 考生ID(self):
        return self.__考生ID

    # 考生ID的setter方法，设置考生ID
    @考生ID.setter
    def 考生ID(self, 考生ID):
        self.__考生ID = 考生ID

    # 复试结果ID的getter方法，获取复试结果ID
    @property
    def 复试结果ID(self):
        return self.__复试结果ID

    # 复试结果ID的setter方法，设置复试结果ID
    @复试结果ID.setter
    def 复试结果ID(self, 复试结果ID):
        self.__复试结果ID = 复试结果ID

#############################################################################
#从属表

class 从属:
    # 初始化方法，用来初始化从属的各个属性
    def __init__(self, 导师ID, 学科ID):
        self.__导师ID = 导师ID        # 导师ID，存储为私有变量，外键引用导师表
        self.__学科ID = 学科ID        # 学科ID，存储为私有变量，外键引用学科表

    # 导师ID的getter方法，获取导师ID
    @property
    def 导师ID(self):
        return self.__导师ID

    # 导师ID的setter方法，设置导师ID
    @导师ID.setter
    def 导师ID(self, 导师ID):
        self.__导师ID = 导师ID

    # 学科ID的getter方法，获取学科ID
    @property
    def 学科ID(self):
        return self.__学科ID

    # 学科ID的setter方法，设置学科ID
    @学科ID.setter
    def 学科ID(self, 学科ID):
        self.__学科ID = 学科ID

#############################################################################
#编制表

class 编制:
    # 初始化方法，用来初始化编制的各个属性
    def __init__(self, 学院ID, 招生目录条目ID):
        self.__学院ID = 学院ID          # 学院ID，存储为私有变量，外键引用学院表
        self.__招生目录条目ID = 招生目录条目ID  # 招生目录条目ID，存储为私有变量，外键引用招生目录条目表

    # 学院ID的getter方法，获取学院ID
    @property
    def 学院ID(self):
        return self.__学院ID

    # 学院ID的setter方法，设置学院ID
    @学院ID.setter
    def 学院ID(self, 学院ID):
        self.__学院ID = 学院ID

    # 招生目录条目ID的getter方法，获取招生目录条目ID
    @property
    def 招生目录条目ID(self):
        return self.__招生目录条目ID

    # 招生目录条目ID的setter方法，设置招生目录条目ID
    @招生目录条目ID.setter
    def 招生目录条目ID(self, 招生目录条目ID):
        self.__招生目录条目ID = 招生目录条目ID

#############################################################################
#包含3表

class 包含3:
    # 初始化方法，用来初始化包含3的各个属性
    def __init__(self, 招生目录ID, 招生目录条目ID):
        self.__招生目录ID = 招生目录ID          # 招生目录ID，存储为私有变量，外键引用招生目录表
        self.__招生目录条目ID = 招生目录条目ID  # 招生目录条目ID，存储为私有变量，外键引用招生目录条目表

    # 招生目录ID的getter方法，获取招生目录ID
    @property
    def 招生目录ID(self):
        return self.__招生目录ID

    # 招生目录ID的setter方法，设置招生目录ID
    @招生目录ID.setter
    def 招生目录ID(self, 招生目录ID):
        self.__招生目录ID = 招生目录ID

    # 招生目录条目ID的getter方法，获取招生目录条目ID
    @property
    def 招生目录条目ID(self):
        return self.__招生目录条目ID

    # 招生目录条目ID的setter方法，设置招生目录条目ID
    @招生目录条目ID.setter
    def 招生目录条目ID(self, 招生目录条目ID):
        self.__招生目录条目ID = 招生目录条目ID

#############################################################################
#包含表
class 包含2:
    # 初始化方法，用来初始化包含2的各个属性
    def __init__(self, 考试科目ID, 招生目录条目ID):
        self.__考试科目ID = 考试科目ID          # 考试科目ID，存储为私有变量，外键引用考试科目表
        self.__招生目录条目ID = 招生目录条目ID  # 招生目录条目ID，存储为私有变量，外键引用招生目录条目表

    # 考试科目ID的getter方法，获取考试科目ID
    @property
    def 考试科目ID(self):
        return self.__考试科目ID

    # 考试科目ID的setter方法，设置考试科目ID
    @考试科目ID.setter
    def 考试科目ID(self, 考试科目ID):
        self.__考试科目ID = 考试科目ID

    # 招生目录条目ID的getter方法，获取招生目录条目ID
    @property
    def 招生目录条目ID(self):
        return self.__招生目录条目ID

    # 招生目录条目ID的setter方法，设置招生目录条目ID
    @招生目录条目ID.setter
    def 招生目录条目ID(self, 招生目录条目ID):
        self.__招生目录条目ID = 招生目录条目ID


#############################################################################

#作为表
class 作为:
    # 初始化方法，用来初始化作为的各个属性
    def __init__(self, 用户ID, 角色ID):
        self.__用户ID = 用户ID  # 用户ID，外键引用用户表
        self.__角色ID = 角色ID  # 角色ID，外键引用角色表

    # 用户ID的getter方法，获取用户ID
    @property
    def 用户ID(self):
        return self.__用户ID

    # 用户ID的setter方法，设置用户ID
    @用户ID.setter
    def 用户ID(self, 用户ID):
        self.__用户ID = 用户ID

    # 角色ID的getter方法，获取角色ID
    @property
    def 角色ID(self):
        return self.__角色ID

    # 角色ID的setter方法，设置角色ID
    @角色ID.setter
    def 角色ID(self, 角色ID):
        self.__角色ID = 角色ID

#############################################################################
#成绩表
class 成绩:
    # 初始化方法，用来初始化成绩的各个属性
    def __init__(self, 数值, 考生ID, 考试科目ID):
        self.__数值 = 数值  # 成绩的数值
        self.__考生ID = 考生ID  # 考生ID，外键引用考生表
        self.__考试科目ID = 考试科目ID  # 考试科目ID，外键引用考试科目表

    # 数值的getter方法，获取成绩数值
    @property
    def 数值(self):
        return self.__数值

    # 数值的setter方法，设置成绩数值
    @数值.setter
    def 数值(self, 数值):
        self.__数值 = 数值

    # 考生ID的getter方法，获取考生ID
    @property
    def 考生ID(self):
        return self.__考生ID

    # 考生ID的setter方法，设置考生ID
    @考生ID.setter
    def 考生ID(self, 考生ID):
        self.__考生ID = 考生ID

    # 考试科目ID的getter方法，获取考试科目ID
    @property
    def 考试科目ID(self):
        return self.__考试科目ID

    # 考试科目ID的setter方法，设置考试科目ID
    @考试科目ID.setter
    def 考试科目ID(self, 考试科目ID):
        self.__考试科目ID = 考试科目ID


##########################################################################
#填报表

class 填报:
    # 初始化方法，用来初始化填报表的各个属性
    def __init__(self, 考生ID, 志愿ID):
        self.__考生ID = 考生ID  # 考生ID，外键引用考生表
        self.__志愿ID = 志愿ID  # 志愿ID，外键引用志愿表

    # 考生ID的getter方法，获取考生ID
    @property
    def 考生ID(self):
        return self.__考生ID

    # 考生ID的setter方法，设置考生ID
    @考生ID.setter
    def 考生ID(self, 考生ID):
        self.__考生ID = 考生ID

    # 志愿ID的getter方法，获取志愿ID
    @property
    def 志愿ID(self):
        return self.__志愿ID

    # 志愿ID的setter方法，设置志愿ID
    @志愿ID.setter
    def 志愿ID(self, 志愿ID):
        self.__志愿ID = 志愿ID


class 属于:
    # 初始化方法，用来初始化属于表的各个属性
    def __init__(self, 导师ID, 学院ID):
        self.__导师ID = 导师ID       # 导师ID，外键引用导师表
        self.__学院ID = 学院ID       # 学院ID，外键引用学院表

    # 导师ID的getter方法，获取导师ID
    @property
    def 导师ID(self):
        return self.__导师ID

    # 导师ID的setter方法，设置导师ID
    @导师ID.setter
    def 导师ID(self, 导师ID):
        self.__导师ID = 导师ID

    # 学院ID的getter方法，获取学院ID
    @property
    def 学院ID(self):
        return self.__学院ID

    # 学院ID的setter方法，设置学院ID
    @学院ID.setter
    def 学院ID(self, 学院ID):
        self.__学院ID = 学院ID





