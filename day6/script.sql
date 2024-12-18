USE [education]
GO
/****** Object:  Table [dbo].[考生]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[考生](
	[考生ID] [int] NOT NULL,
	[考生类别] [varchar](20) NULL,
	[性别] [varchar](10) NULL,
	[生源地] [varchar](80) NULL,
	[个人简历] [varchar](1000) NULL,
	[更新时间] [datetime] NULL,
	[创建时间] [datetime] NULL,
	[用户ID] [int] NULL,
	[身份证号] [varchar](18) NULL,
	[毕业时间] [date] NULL,
	[出生日期] [date] NULL,
	[本科毕业学校名称] [varchar](30) NULL,
	[本科专业] [varchar](30) NULL,
	[本科毕业学校类型] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[考生ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_考生基本信息]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_考生基本信息]
AS
SELECT 
    考生ID,
    考生类别
FROM [education].[dbo].[考生];
GO
/****** Object:  Table [dbo].[复试志愿]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[复试志愿](
	[志愿ID] [int] NOT NULL,
	[导师ID] [int] NULL,
	[考生ID] [int] NULL,
	[学科ID] [varchar](15) NULL,
	[志愿顺序] [int] NULL,
	[是否接受方向调整] [bit] NULL,
	[更新时间] [datetime] NULL,
	[创建时间] [datetime] NULL,
	[志愿状态] [varchar](20) NULL,
	[志愿ID_New] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[志愿ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_复试志愿]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_复试志愿]
AS
SELECT
    复试志愿.考生ID,
    复试志愿.导师ID,
    复试志愿.志愿顺序,
    复试志愿.是否接受方向调整
FROM [education].[dbo].[复试志愿];
GO
/****** Object:  Table [dbo].[复试结果]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[复试结果](
	[复试结果ID] [int] NOT NULL,
	[考生ID] [int] NULL,
	[更新时间] [datetime] NULL,
	[创建时间] [datetime] NULL,
	[最终导师ID] [int] NULL,
	[录取状态] [varchar](20) NULL,
	[综合评价] [varchar](100) NULL,
	[待确认] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[复试结果ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_复试结果]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_复试结果]
AS
SELECT
    复试结果.考生ID,
    复试结果.录取状态,
    复试结果.综合评价,
    复试结果.更新时间 AS 最后更新时间
FROM [education].[dbo].[复试结果];
GO
/****** Object:  View [dbo].[v_导师选择结果]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_导师选择结果]
AS
SELECT 
    r.导师ID, 
    c.考生ID,  
    r.志愿顺序, 
    fr.录取状态, 
    fr.综合评价
FROM [education].[dbo].[复试志愿] r
JOIN [education].[dbo].[考生] c ON r.考生ID = c.考生ID
LEFT JOIN [education].[dbo].[复试结果] fr ON fr.考生ID = c.考生ID AND fr.最终导师ID = r.导师ID;
GO
/****** Object:  View [dbo].[v_复试志愿详细信息]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_复试志愿详细信息]
AS
SELECT 
    r.考生ID,
    r.导师ID,
    r.志愿顺序,
    r.是否接受方向调整,
    c.性别,
    c.生源地
FROM [education].[dbo].[复试志愿] r
JOIN [education].[dbo].[考生] c ON r.考生ID = c.考生ID;
GO
/****** Object:  Table [dbo].[确定]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[确定](
	[复试结果ID] [int] NOT NULL,
	[导师ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[复试结果ID] ASC,
	[导师ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_导师确认学生]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_导师确认学生]
AS
SELECT 
    d.导师ID, 
    s.考生ID, 
    s.性别,
    s.生源地,
    rs.录取状态
FROM [education].[dbo].[确定] d

JOIN [education].[dbo].[复试结果] rs ON d.复试结果ID = rs.复试结果ID 
JOIN [education].[dbo].[考生] s ON s.考生ID = rs.考生ID;
GO
/****** Object:  Table [dbo].[成绩]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[成绩](
	[数值] [float] NULL,
	[考生ID] [int] NOT NULL,
	[考试科目ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[考生ID] ASC,
	[考试科目ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[考试科目]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[考试科目](
	[考试科目ID] [int] NOT NULL,
	[类别] [varchar](10) NOT NULL,
	[名称] [varchar](30) NOT NULL,
	[考试时间] [date] NOT NULL,
	[考试地点] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[考试科目ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_考生初试信息]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_考生初试信息]
AS
SELECT 
    c.考生ID,
    ec.考试科目ID,
    ec.名称 AS 科目名称,
    ec.考试地点,
    ec.考试时间,
    s.数值 AS 初试成绩
FROM [dbo].[考生] c
JOIN [dbo].[成绩] s ON c.考生ID = s.考生ID
JOIN [dbo].[考试科目] ec ON s.考试科目ID = ec.考试科目ID
WHERE ec.类别 = '初试';
GO
/****** Object:  Table [dbo].[导师]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[导师](
	[导师ID] [int] NOT NULL,
	[照片路径] [varchar](50) NULL,
	[用户ID] [int] NULL,
	[更新时间] [datetime] NULL,
	[创建时间] [datetime] NULL,
	[是否具有招生资格] [bit] NULL,
	[简介] [varchar](1000) NULL,
	[职称] [varchar](50) NULL,
	[导师类别] [varchar](50) NULL,
	[审核状态] [varchar](20) NULL,
	[学院ID] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[导师ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_考生复试信息]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_考生复试信息]
AS
SELECT 
    fr.志愿ID,
    c.考生ID,
    fr.导师ID,
    fr.学科ID,
    fr.志愿顺序,
    fr.是否接受方向调整,
    ec.考试科目ID,
    ec.名称 AS 科目名称,
    s.数值 AS 复试成绩
FROM [dbo].[复试志愿] fr
JOIN [dbo].[考生] c ON fr.考生ID = c.考生ID
JOIN [dbo].[导师] d ON fr.导师ID = d.导师ID
JOIN [dbo].[成绩] s ON c.考生ID = s.考生ID
JOIN [dbo].[考试科目] ec ON s.考试科目ID = ec.考试科目ID
WHERE ec.类别 = '复试';
GO
/****** Object:  View [dbo].[v_复试结果信息]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_复试结果信息]
AS
SELECT 
    rr.复试结果ID,
    c.考生ID,
    d.导师ID,
    rr.录取状态,
    rr.综合评价,
    rr.更新时间
FROM [dbo].[复试结果] rr
JOIN [dbo].[考生] c ON rr.考生ID = c.考生ID
JOIN [dbo].[导师] d ON rr.最终导师ID = d.导师ID;
GO
/****** Object:  Table [dbo].[学科]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[学科](
	[学科ID] [varchar](15) NOT NULL,
	[学科名称] [varchar](40) NULL,
	[学科等级] [varchar](10) NULL,
	[学科概述] [varchar](500) NULL,
	[学科类型] [varchar](20) NULL,
	[学科研究方向] [varchar](100) NULL,
	[上级学科] [varchar](40) NULL,
	[更新时间] [datetime] NULL,
	[创建时间] [datetime] NULL,
	[年度总招生指标] [varchar](20) NULL,
	[增补指标] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[学科ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_复试志愿信息]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_复试志愿信息]
AS
SELECT 
    rz.志愿ID,
    rz.考生ID,
    rz.导师ID,
    rz.学科ID,
    s.学科名称,
    rz.志愿顺序,
    rz.是否接受方向调整,
    rz.创建时间,
    rz.更新时间
FROM 
    [dbo].[复试志愿] AS rz
LEFT JOIN 
    [dbo].[考生] AS k ON rz.考生ID = k.考生ID
LEFT JOIN 
    [dbo].[导师] AS d ON rz.导师ID = d.导师ID
LEFT JOIN 
    [dbo].[学科] AS s ON rz.学科ID = s.学科ID;
GO
/****** Object:  View [dbo].[vw_录取结果信息]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_录取结果信息]
AS
SELECT 
    k.考生ID,
    rz.导师ID,
    rz.学科ID,
    s.学科名称,
    rz.志愿顺序,
    rr.录取状态,
    rr.综合评价,
    rr.更新时间 AS 录取更新时间
FROM 
    [dbo].[考生] AS k
LEFT JOIN 
    [dbo].[复试志愿] AS rz ON k.考生ID = rz.考生ID
LEFT JOIN 
    [dbo].[导师] AS d ON rz.导师ID = d.导师ID
LEFT JOIN 
    [dbo].[复试结果] AS rr ON k.考生ID = rr.考生ID
LEFT JOIN 
    [dbo].[学科] AS s ON rz.学科ID = s.学科ID;
GO
/****** Object:  View [dbo].[vw_考生综合信息]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_考生综合信息]
AS
SELECT 
    k.考生ID,
    k.性别,
    k.考生类别,
    rz.导师ID,
    rz.学科ID,
    s.学科名称,
    rz.志愿顺序,
    rr.录取状态,
    rr.综合评价,
    rr.更新时间 AS 录取更新时间
FROM 
    [dbo].[考生] AS k
LEFT JOIN 
    [dbo].[复试志愿] AS rz ON k.考生ID = rz.考生ID
LEFT JOIN 
    [dbo].[导师] AS d ON rz.导师ID = d.导师ID
LEFT JOIN 
    [dbo].[复试结果] AS rr ON k.考生ID = rr.考生ID
LEFT JOIN 
    [dbo].[学科] AS s ON rz.学科ID = s.学科ID;
GO
/****** Object:  View [dbo].[vw_学科信息]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_学科信息]
AS
SELECT 
    学科ID,
    学科名称,
    学科研究方向,
    学科概述,
    更新时间
FROM 
    [dbo].[学科];
GO
/****** Object:  Table [dbo].[角色]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[角色](
	[角色ID] [int] NOT NULL,
	[角色名称] [varchar](20) NOT NULL,
	[角色描述] [varchar](150) NULL,
	[角色权限] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[角色ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[用户]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[用户](
	[用户ID] [int] NOT NULL,
	[用户名] [varchar](20) NOT NULL,
	[更新时间] [datetime] NULL,
	[创建时间] [datetime] NOT NULL,
	[角色ID] [int] NULL,
	[邮箱] [varchar](50) NULL,
	[手机号] [varchar](50) NULL,
	[姓名] [varchar](20) NULL,
	[密码] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[用户ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[作为]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[作为](
	[用户ID] [int] NOT NULL,
	[角色ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[用户ID] ASC,
	[角色ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_用户角色信息]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_用户角色信息]
AS
SELECT 
    u.用户ID,
    u.用户名,
    r.角色ID,
    r.角色名称
FROM 
    [dbo].[用户] AS u
JOIN 
    [dbo].[作为] AS a ON u.用户ID = a.用户ID
JOIN 
    [dbo].[角色] AS r ON a.角色ID = r.角色ID;
GO
/****** Object:  View [dbo].[vw_学科负责人信息]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_学科负责人信息]
AS
SELECT 
    u.用户ID AS 负责人用户ID,
    u.用户名 AS 负责人姓名,
    r.角色名称
FROM 
    [dbo].[用户] AS u
LEFT JOIN 
    [dbo].[角色] AS r ON u.角色ID = r.角色ID
WHERE 
    r.角色名称 = '学科负责人';
GO
/****** Object:  Table [dbo].[对应2]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[对应2](
	[考生ID] [int] NOT NULL,
	[用户ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[考生ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_导师选择学生]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_导师选择学生]
AS
SELECT 
    r.导师ID, 
    r.考生ID,
    s.姓名 AS 考生姓名,
    r.志愿顺序,
    r.是否接受方向调整,
    fr.录取状态,
    fr.综合评价
FROM [education].[dbo].[复试志愿] r
left JOIN [education].[dbo].[考生] c ON r.考生ID = c.考生ID
left join [education].[dbo].[对应2] cs on cs.考生ID=c.考生ID
left join [education].[dbo].[用户] s on s.用户ID=cs.用户ID
LEFT JOIN [education].[dbo].[复试结果] fr ON fr.考生ID = r.考生ID AND fr.最终导师ID = r.导师ID;
GO
/****** Object:  View [dbo].[vw_复试结果统计视图]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_复试结果统计视图]
AS
SELECT 
    r.录取状态,
    COUNT(*) AS 考生数量
FROM 
    复试结果 r
GROUP BY 
    r.录取状态;
GO
/****** Object:  View [dbo].[vw_考生复试审核明细视图]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_考生复试审核明细视图]
AS
SELECT 
    c.考生ID,
    r.复试结果ID,
    r.录取状态,
    r.综合评价 AS 审核意见,
    r.更新时间 AS 审核更新时间
FROM 
    复试结果 r
JOIN 
    考生 c ON r.考生ID = c.考生ID
WHERE 
    r.录取状态 IS NOT NULL;
GO
/****** Object:  View [dbo].[vw_考生复试志愿与导师信息]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_考生复试志愿与导师信息]
AS
SELECT 
    c.考生ID,
    r.志愿顺序,
    r.是否接受方向调整,
    d.导师ID,
    fr.录取状态,
    fr.综合评价 AS 复试评价,
    fr.更新时间 AS 录取更新时间
FROM 
    复试志愿 r
JOIN 
    考生 c ON r.考生ID = c.考生ID  -- 关联考生信息
JOIN 
    导师 d ON r.导师ID = d.导师ID  -- 关联导师信息
LEFT JOIN 
    复试结果 fr ON r.考生ID = fr.考生ID AND r.导师ID = fr.最终导师ID  -- 获取复试结果信息，按考生ID和导师ID匹配
GO
/****** Object:  View [dbo].[vw_学科秘书复试结果待确认]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_学科秘书复试结果待确认]
AS
SELECT 
    fr.复试结果ID,
    fr.考生ID,
    fr.最终导师ID,
    fr.待确认,
    fr.更新时间 AS 最后更新时间
FROM 
    复试结果 fr
left JOIN 
    考生 c ON fr.考生ID = c.考生ID  -- 获取考生信息
left JOIN 
    导师 d ON fr.最终导师ID = d.导师ID  -- 获取导师信息
WHERE 
    fr.待确认 is NULL;  -- 筛选待确认的复试结果
GO
/****** Object:  View [dbo].[vw_导师复试结果与志愿选择]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_导师复试结果与志愿选择]
AS
SELECT 
    r.导师ID,
    r.考生ID,
    r.志愿顺序,
    r.是否接受方向调整,
    fr.录取状态,
    fr.综合评价 AS 复试评价
FROM 
    复试志愿 r
JOIN 
    考生 c ON r.考生ID = c.考生ID  -- 获取考生信息
JOIN 
    导师 d ON r.导师ID = d.导师ID  -- 获取导师信息
LEFT JOIN 
    复试结果 fr ON r.考生ID = fr.考生ID AND r.导师ID = fr.最终导师ID;  -- 获取复试结果
GO
/****** Object:  View [dbo].[vw_考生选择全过程]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_考生选择全过程] AS
SELECT 
    考生.考生ID, 
    考生.考生类别,
    复试志愿.导师ID,  
    复试志愿.志愿顺序, 
    复试志愿.是否接受方向调整, 
    复试结果.录取状态, 
    复试结果.综合评价,
    复试结果.更新时间 AS 最后更新时间
FROM 考生
LEFT JOIN 复试志愿 ON 考生.考生ID = 复试志愿.考生ID
LEFT JOIN 导师 ON 复试志愿.导师ID = 导师.导师ID
LEFT JOIN 复试结果 ON 考生.考生ID = 复试结果.考生ID;
GO
/****** Object:  View [dbo].[vw_学科秘书复试审核情况]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_学科秘书复试审核情况]
AS
SELECT 
    fr.复试结果ID,
    fr.考生ID,
    r.导师ID,
    fr.待确认,
    fr.录取状态,
    fr.综合评价 AS 复试评价,
    fr.更新时间 AS 审核更新时间
FROM 
    复试结果 fr
JOIN 
    考生 c ON fr.考生ID = c.考生ID  -- 获取考生信息
JOIN 
    导师 d ON fr.最终导师ID = d.导师ID  -- 获取导师信息
JOIN 
    复试志愿 r ON r.考生ID = fr.考生ID AND r.导师ID = fr.最终导师ID  -- 获取复试志愿
WHERE 
    fr.待确认 = 1;  -- 筛选待确认的复试结果
GO
/****** Object:  Table [dbo].[包含1]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[包含1](
	[志愿ID] [int] NOT NULL,
	[学科ID] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[志愿ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[包含2]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[包含2](
	[考试科目ID] [int] NOT NULL,
	[招生目录条目ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[考试科目ID] ASC,
	[招生目录条目ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[包含3]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[包含3](
	[招生目录ID] [int] NOT NULL,
	[招生目录条目ID] [int] NOT NULL,
 CONSTRAINT [PK_包含3] PRIMARY KEY CLUSTERED 
(
	[招生目录ID] ASC,
	[招生目录条目ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[编制]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[编制](
	[学院ID] [int] NOT NULL,
	[招生目录条目ID] [int] NOT NULL,
 CONSTRAINT [PK_编制] PRIMARY KEY CLUSTERED 
(
	[学院ID] ASC,
	[招生目录条目ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[从属]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[从属](
	[导师ID] [int] NOT NULL,
	[学科ID] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[导师ID] ASC,
	[学科ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[对应1]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[对应1](
	[导师ID] [int] NOT NULL,
	[用户ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[导师ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[获得]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[获得](
	[考生ID] [int] NOT NULL,
	[复试结果ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[考生ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[具有]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[具有](
	[学科ID] [varchar](15) NOT NULL,
	[招生目录条目ID] [int] NOT NULL,
 CONSTRAINT [PK_具有] PRIMARY KEY CLUSTERED 
(
	[学科ID] ASC,
	[招生目录条目ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[填报]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[填报](
	[考生ID] [int] NULL,
	[志愿ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[志愿ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[选择]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[选择](
	[志愿ID] [int] NOT NULL,
	[导师ID] [int] NOT NULL,
 CONSTRAINT [PK_选择] PRIMARY KEY CLUSTERED 
(
	[志愿ID] ASC,
	[导师ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[学院]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[学院](
	[学院ID] [int] NOT NULL,
	[学院名称] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[学院ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[拥有]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[拥有](
	[考生ID] [int] NOT NULL,
	[总成绩ID] [int] NOT NULL,
	[类型] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[考生ID] ASC,
	[总成绩ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[招生目录]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[招生目录](
	[招生目录ID] [int] NOT NULL,
	[招生年度] [int] NOT NULL,
	[是否通过学校审核] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[招生目录ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[招生目录条目]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[招生目录条目](
	[招生目录条目ID] [int] NOT NULL,
	[年份] [int] NULL,
	[学院ID] [int] NULL,
	[创建时间] [datetime] NULL,
	[更新时间] [datetime] NULL,
	[是否招收同等学力] [bit] NULL,
	[学科ID] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[招生目录条目ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[属于]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[属于](
	[导师ID] [int] NOT NULL,
	[学院ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[导师ID] ASC,
	[学院ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[总成绩]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[总成绩](
	[总成绩ID] [int] NOT NULL,
	[类别] [varchar](10) NOT NULL,
	[总分数值] [float] NOT NULL,
	[更新时间] [datetime] NULL,
	[创建时间] [datetime] NULL,
	[考生ID] [int] NULL,
 CONSTRAINT [PK__总成绩__01F15EBD51D7DA78] PRIMARY KEY CLUSTERED 
(
	[总成绩ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (1, N'070503-01')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (4, N'070503-01')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (5, N'070503-01')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (7, N'071001-03')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (8, N'071001-03')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (9, N'071001-03')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (10, N'070503-01')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (11, N'070503-01')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (13, N'080200-04')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (14, N'080200-04')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (15, N'080200-04')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (18, N'090301-01')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (19, N'070503-01')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (21, N'070503-01')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (23, N'070503-01')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (24, N'070503-01')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (26, N'070503-01')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (27, N'090301-02')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (28, N'090301-02')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (29, N'090301-02')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (66, N'071001-01')
GO
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (3, 3)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (4, 4)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (5, 5)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (6, 6)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (7, 7)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (8, 8)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (9, 9)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (10, 10)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (11, 11)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (12, 12)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (13, 13)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (14, 14)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (15, 15)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (16, 16)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (17, 17)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (18, 18)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (19, 19)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (20, 20)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (21, 21)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (22, 22)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (25, 25)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (26, 26)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (28, 28)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (29, 29)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (33, 3)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (34, 4)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (35, 5)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (36, 6)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (37, 7)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (38, 8)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (39, 9)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (40, 10)
GO
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (3, 3)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (3, 25)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (4, 4)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (4, 26)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (5, 5)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (6, 6)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (6, 28)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (7, 7)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (7, 29)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (8, 8)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (9, 9)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (10, 10)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (11, 11)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (12, 12)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (13, 13)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (14, 14)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (15, 15)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (16, 16)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (17, 17)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (18, 18)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (19, 19)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (20, 20)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (21, 21)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (22, 22)
GO
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (2, 3)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (3, 4)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (3, 5)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (4, 6)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (4, 7)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (4, 8)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (4, 29)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (5, 9)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (5, 10)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (5, 11)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (5, 12)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (5, 13)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (5, 14)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (5, 15)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (6, 16)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (6, 17)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (7, 18)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (7, 19)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (7, 20)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (7, 21)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (8, 22)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (8, 25)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (9, 26)
GO
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (76, 2, 11)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (83, 2, 12)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (79, 2, 13)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (8.5, 2, 14)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (82, 2, 15)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (3, 2, 16)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (7.5, 2, 17)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (8, 2, 18)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (2, 2, 19)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (89, 2, 20)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (75, 3, 21)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (8, 3, 22)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (2, 3, 23)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (92.5, 3, 24)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (2, 3, 25)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (90, 3, 26)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (78.5, 3, 27)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (86, 3, 28)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (4, 3, 29)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (7, 3, 30)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (76.5, 4, 31)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (8, 4, 32)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (4, 4, 33)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (77, 4, 34)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (1, 4, 35)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (91, 4, 36)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (7, 4, 37)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (87, 4, 38)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (4, 4, 39)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (9, 4, 40)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (77.5, 5, 2)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (1, 5, 3)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (90, 5, 4)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (83, 5, 5)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (8, 5, 6)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (4, 5, 7)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (91, 5, 8)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (7, 5, 9)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (85, 5, 10)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (2, 6, 11)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (3, 6, 12)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (75, 6, 13)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (3, 6, 14)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (1, 6, 15)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (87, 6, 16)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (82, 6, 17)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (4, 6, 18)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (77.5, 6, 19)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (8, 6, 20)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (85.5, 6, 688)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (80, 7, 21)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (1, 7, 22)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (8, 7, 23)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (86, 7, 24)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (83, 7, 25)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (1, 7, 26)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (9, 7, 27)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (92, 7, 28)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (1, 7, 29)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (84, 7, 30)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (8, 8, 31)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (7, 8, 32)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (4, 8, 33)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (82, 8, 34)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (9, 8, 35)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (1, 8, 36)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (7, 8, 37)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (9, 8, 38)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (1, 8, 39)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (79, 8, 40)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (88, 8, 112)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (88, 8, 116)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (90, 8, 502)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (9, 9, 2)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (1, 9, 3)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (85, 9, 4)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (4, 9, 5)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (88, 9, 6)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (1, 9, 7)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (91, 9, 8)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (7, 9, 9)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (6, 9, 10)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (1, 10, 11)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (3, 10, 12)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (78, 10, 13)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (4, 10, 14)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (1, 10, 15)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (56, 10, 16)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (3, 10, 17)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (1, 10, 18)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (7, 10, 19)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (90, 10, 20)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (68.5, 102, 4)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (85.5, 102, 5)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (85.5, 102, 6)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (99, 102, 13)
GO
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (1, N'070503-01')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (3, N'090301-01')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (4, N'090301-02')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (5, N'090703-01')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (6, N'090704-01')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (7, N'090704-03')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (8, N'090704-02')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (9, N'071001-01')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (10, N'071001-02')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (11, N'071001-02')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (12, N'071010-01')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (13, N'083200-02')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (14, N'083200-01')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (15, N'080200-02')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (16, N'080200-01')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (17, N'070503-01')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (18, N'070503-01')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (21, N'070503-01')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (22, N'070503-01')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (23, N'090301-02')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (24, N'090301-02')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (25, N'090704-01')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (26, N'090704-01')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (27, N'090704-04')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (28, N'090704-04')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (29, N'071001-03')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (30, N'071002-02')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (30, N'071002-03')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (31, N'071002-02')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (31, N'071002-03')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (32, N'071001-04')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (33, N'083200-03')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (34, N'083200-04')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (35, N'080200-03')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (35, N'080200-04')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (36, N'080200-04')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (37, N'070503-01')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (38, N'070503-01')
GO
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (1, N'path/to/photo1.jpg', 28, CAST(N'2024-11-07T13:38:41.867' AS DateTime), CAST(N'2024-11-06T12:44:34.787' AS DateTime), 1, N'从事人工智能与机器学习研究', N'教授', N'博士生导师', N'已通过', N'1')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (3, N'path/to/photo3.jpg', 30, CAST(N'2024-11-06T12:44:34.787' AS DateTime), CAST(N'2024-11-06T12:44:34.787' AS DateTime), 1, N'讲师，专注于土壤学与环境保护的研究。', N'讲师', N'博士生导师', N'正在进行', N'2')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (4, N'path/to/photo4.jpg', 31, CAST(N'2024-11-06T12:44:34.787' AS DateTime), CAST(N'2024-11-06T12:44:34.787' AS DateTime), 1, N'副教授，研究土壤资源与环境的可持续发展。', N'副教授', N'硕士生导师', N'未通过', N'2')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (5, N'path/to/photo5.jpg', 32, CAST(N'2024-11-06T12:44:34.787' AS DateTime), CAST(N'2024-11-06T12:44:34.787' AS DateTime), 1, N'教授，研究方向为森林昆虫学和森林生态学。', N'教授', N'博士生导师', N'已通过', N'3')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (6, N'path/to/photo6.jpg', 33, CAST(N'2024-11-06T12:44:34.787' AS DateTime), CAST(N'2024-11-06T12:44:34.787' AS DateTime), 1, N'副教授，研究森林经营理论及其技术的应用。', N'副教授', N'硕士生导师', N'已通过', N'3')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (7, N'path/to/photo7.jpg', 34, CAST(N'2024-11-06T12:44:34.787' AS DateTime), CAST(N'2024-11-06T12:44:34.787' AS DateTime), 1, N'讲师，专注于森林资源调查与监测方面的教学与研究。', N'讲师', N'硕士生导师', N'未通过', N'4')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (8, N'path/to/photo8.jpg', 35, CAST(N'2024-11-06T12:44:34.787' AS DateTime), CAST(N'2024-11-06T12:44:34.787' AS DateTime), 1, N'教授，长期从事森林学科的教学与研究工作。', N'教授', N'博士生导师', N'已通过', N'4')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (9, N'path/to/photo9.jpg', 36, CAST(N'2024-11-06T12:44:34.787' AS DateTime), CAST(N'2024-11-06T12:44:34.787' AS DateTime), 1, N'副教授，研究领域包括森林遥感与信息技术。', N'副教授', N'硕士生导师', N'正在进行', N'5')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (10, N'path/to/photo10.jpg', 37, CAST(N'2024-11-06T12:44:34.787' AS DateTime), CAST(N'2024-11-06T12:44:34.787' AS DateTime), 1, N'讲师，专注于植物学科的基础研究与应用。', N'讲师', N'硕士生导师', N'未通过', N'5')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (11, N'path/to/photo11.jpg', 38, CAST(N'2024-11-06T12:44:34.787' AS DateTime), CAST(N'2024-11-06T12:44:34.787' AS DateTime), 1, N'副教授，研究方向为植物分类与系统演化。', N'副教授', N'博士生导师', N'已通过', N'6')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (12, N'path/to/photo12.jpg', 39, CAST(N'2024-11-06T12:44:34.787' AS DateTime), CAST(N'2024-11-06T12:44:34.787' AS DateTime), 1, N'教授，研究木本植物的生长发育及其调控机制。', N'教授', N'博士生导师', N'已通过', N'6')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (13, N'path/to/photo13.jpg', 40, CAST(N'2024-11-06T12:44:34.787' AS DateTime), CAST(N'2024-11-06T12:44:34.787' AS DateTime), 1, N'副教授，专注于光合作用与光生物学的教学与研究。', N'副教授', N'硕士生导师', N'已通过', N'7')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (14, N'path/to/photo14.jpg', 2, CAST(N'2024-11-06T12:44:34.787' AS DateTime), CAST(N'2024-11-06T12:44:34.787' AS DateTime), 1, N'讲师，研究方向为动物生物学与动物保护。', N'讲师', N'硕士生导师', N'正在进行', N'7')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (15, N'path/to/photo15.jpg', 2, CAST(N'2024-11-06T12:44:34.787' AS DateTime), CAST(N'2024-11-06T12:44:34.787' AS DateTime), 1, N'教授，专注于动物分子生态学的研究。', N'教授', N'博士生导师', N'已通过', N'8')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (16, N'path/to/photo16.jpg', 11, CAST(N'2024-11-06T12:44:34.787' AS DateTime), CAST(N'2024-11-06T12:44:34.787' AS DateTime), 1, N'副教授，研究动物行为学及其生态学。', N'副教授', N'博士生导师', N'未通过', N'8')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (17, N'path/to/photo17.jpg', 12, CAST(N'2024-11-06T12:44:34.787' AS DateTime), CAST(N'2024-11-06T12:44:34.787' AS DateTime), 1, N'讲师，研究分子生物学和基因工程技术。', N'讲师', N'硕士生导师', N'已通过', N'9')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (18, N'path/to/photo18.jpg', 13, CAST(N'2024-11-06T12:44:34.787' AS DateTime), CAST(N'2024-11-06T12:44:34.787' AS DateTime), 1, N'副教授，专注于生物化学与分子生物学的研究。', N'副教授', N'博士生导师', N'已通过', N'9')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (21, N'path/to/photo1.jpg', 101, CAST(N'2024-11-06T14:17:28.657' AS DateTime), CAST(N'2024-11-06T14:17:28.657' AS DateTime), 1, N'导师简介1', N'副教授', N'学科导师', N'已通过', N'1')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (22, N'path/to/photo2.jpg', 102, CAST(N'2024-11-06T14:17:28.657' AS DateTime), CAST(N'2024-11-06T14:17:28.657' AS DateTime), 1, N'导师简介2', N'教授', N'学科导师', N'已通过', N'1')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (23, N'path/to/photo3.jpg', 103, CAST(N'2024-11-06T14:17:28.657' AS DateTime), CAST(N'2024-11-06T14:17:28.657' AS DateTime), 1, N'导师简介3', N'讲师', N'学科导师', N'已通过', N'2')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (24, N'path/to/photo4.jpg', 104, CAST(N'2024-11-06T14:17:28.657' AS DateTime), CAST(N'2024-11-06T14:17:28.657' AS DateTime), 1, N'导师简介4', N'副教授', N'学科导师', N'已通过', N'2')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (25, N'path/to/photo5.jpg', 105, CAST(N'2024-11-06T14:17:28.657' AS DateTime), CAST(N'2024-11-06T14:17:28.657' AS DateTime), 1, N'导师简介5', N'教授', N'学科导师', N'已通过', N'3')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (26, N'path/to/photo6.jpg', 106, CAST(N'2024-11-06T14:17:28.657' AS DateTime), CAST(N'2024-11-06T14:17:28.657' AS DateTime), 1, N'导师简介6', N'副教授', N'学科导师', N'已通过', N'3')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (27, N'path/to/photo7.jpg', 107, CAST(N'2024-11-06T14:17:28.657' AS DateTime), CAST(N'2024-11-06T14:17:28.657' AS DateTime), 1, N'导师简介7', N'讲师', N'学科导师', N'已通过', N'4')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (28, N'path/to/photo8.jpg', 108, CAST(N'2024-11-06T14:17:28.657' AS DateTime), CAST(N'2024-11-06T14:17:28.657' AS DateTime), 1, N'导师简介8', N'教授', N'学科导师', N'已通过', N'4')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (29, N'path/to/photo9.jpg', 109, CAST(N'2024-11-06T14:17:28.657' AS DateTime), CAST(N'2024-11-06T14:17:28.657' AS DateTime), 1, N'导师简介9', N'副教授', N'学科导师', N'已通过', N'5')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (30, N'path/to/photo10.jpg', 110, CAST(N'2024-11-06T14:17:28.657' AS DateTime), CAST(N'2024-11-06T14:17:28.657' AS DateTime), 1, N'导师简介10', N'讲师', N'学科导师', N'已通过', N'5')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (31, N'path/to/photo11.jpg', 111, CAST(N'2024-11-06T14:17:28.657' AS DateTime), CAST(N'2024-11-06T14:17:28.657' AS DateTime), 1, N'导师简介11', N'副教授', N'学科导师', N'已通过', N'5')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (32, N'path/to/photo12.jpg', 112, CAST(N'2024-11-06T14:17:28.657' AS DateTime), CAST(N'2024-11-06T14:17:28.657' AS DateTime), 1, N'导师简介12', N'教授', N'学科导师', N'已通过', N'5')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (33, N'path/to/photo13.jpg', 113, CAST(N'2024-11-06T14:17:28.657' AS DateTime), CAST(N'2024-11-06T14:17:28.657' AS DateTime), 1, N'导师简介13', N'讲师', N'学科导师', N'已通过', N'7')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (34, N'path/to/photo14.jpg', 114, CAST(N'2024-11-06T14:17:28.657' AS DateTime), CAST(N'2024-11-06T14:17:28.657' AS DateTime), 1, N'导师简介14', N'副教授', N'学科导师', N'已通过', N'7')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (35, N'path/to/photo15.jpg', 115, CAST(N'2024-11-06T14:17:28.657' AS DateTime), CAST(N'2024-11-06T14:17:28.657' AS DateTime), 1, N'导师简介15', N'教授', N'学科导师', N'已通过', N'8')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (36, N'path/to/photo16.jpg', 116, CAST(N'2024-11-06T14:17:28.657' AS DateTime), CAST(N'2024-11-06T14:17:28.657' AS DateTime), 1, N'导师简介16', N'副教授', N'学科导师', N'已通过', N'8')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (37, N'path/to/photo17.jpg', 117, CAST(N'2024-11-06T14:17:28.657' AS DateTime), CAST(N'2024-11-06T14:17:28.657' AS DateTime), 1, N'导师简介17', N'讲师', N'学科导师', N'已通过', N'9')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (38, N'path/to/photo18.jpg', 118, CAST(N'2024-11-06T14:17:28.657' AS DateTime), CAST(N'2024-11-06T14:17:28.657' AS DateTime), 1, N'导师简介18', N'副教授', N'学科导师', N'已通过', N'9')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (40, NULL, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'6')
GO
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (1, 28)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (3, 30)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (4, 31)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (5, 32)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (6, 33)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (7, 34)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (8, 35)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (9, 36)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (10, 37)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (11, 38)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (12, 39)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (13, 40)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (14, 2)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (15, 2)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (16, 11)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (17, 12)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (18, 13)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (21, 101)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (22, 102)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (23, 103)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (24, 104)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (25, 105)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (26, 106)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (27, 107)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (28, 108)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (29, 109)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (30, 110)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (31, 111)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (32, 112)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (33, 113)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (34, 114)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (35, 115)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (36, 116)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (37, 117)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (38, 118)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (40, 88)
GO
INSERT [dbo].[对应2] ([考生ID], [用户ID]) VALUES (102, 89)
GO
INSERT [dbo].[复试结果] ([复试结果ID], [考生ID], [更新时间], [创建时间], [最终导师ID], [录取状态], [综合评价], [待确认]) VALUES (3, 3, CAST(N'2024-11-06T16:07:02.653' AS DateTime), CAST(N'2024-11-06T16:07:02.653' AS DateTime), NULL, N'未录取', N'未通过复试', NULL)
INSERT [dbo].[复试结果] ([复试结果ID], [考生ID], [更新时间], [创建时间], [最终导师ID], [录取状态], [综合评价], [待确认]) VALUES (4, 4, CAST(N'2024-11-06T16:07:02.653' AS DateTime), CAST(N'2024-11-06T16:07:02.653' AS DateTime), 10, N'待审核', N'面试表现一般，成绩有待提高', NULL)
INSERT [dbo].[复试结果] ([复试结果ID], [考生ID], [更新时间], [创建时间], [最终导师ID], [录取状态], [综合评价], [待确认]) VALUES (5, 5, CAST(N'2024-11-06T16:07:02.653' AS DateTime), CAST(N'2024-11-06T16:07:02.653' AS DateTime), 35, N'已录取', N'优秀的学术背景和研究能力', NULL)
INSERT [dbo].[复试结果] ([复试结果ID], [考生ID], [更新时间], [创建时间], [最终导师ID], [录取状态], [综合评价], [待确认]) VALUES (6, 6, CAST(N'2024-11-06T16:07:02.653' AS DateTime), CAST(N'2024-11-06T16:07:02.653' AS DateTime), 3, N'待审核', N'有潜力，但部分复试环节表现欠佳', NULL)
INSERT [dbo].[复试结果] ([复试结果ID], [考生ID], [更新时间], [创建时间], [最终导师ID], [录取状态], [综合评价], [待确认]) VALUES (7, 7, CAST(N'2024-11-06T16:07:02.653' AS DateTime), CAST(N'2024-11-06T16:07:02.653' AS DateTime), NULL, N'未录取', N'未通过复试，学术能力较弱', NULL)
INSERT [dbo].[复试结果] ([复试结果ID], [考生ID], [更新时间], [创建时间], [最终导师ID], [录取状态], [综合评价], [待确认]) VALUES (9, 9, CAST(N'2024-11-06T16:07:02.653' AS DateTime), CAST(N'2024-11-06T16:07:02.653' AS DateTime), 1, N'待审核', N'面试过程中展现了很好的问题解决能力', NULL)
INSERT [dbo].[复试结果] ([复试结果ID], [考生ID], [更新时间], [创建时间], [最终导师ID], [录取状态], [综合评价], [待确认]) VALUES (10, 10, CAST(N'2024-11-07T16:12:13.740' AS DateTime), CAST(N'2024-11-06T16:07:02.653' AS DateTime), NULL, N'已录取', N'表现优秀，建议录取', NULL)
INSERT [dbo].[复试结果] ([复试结果ID], [考生ID], [更新时间], [创建时间], [最终导师ID], [录取状态], [综合评价], [待确认]) VALUES (66, 101, NULL, NULL, 38, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[复试志愿] ON 

INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间], [志愿状态], [志愿ID_New]) VALUES (1, 22, 101, N'070503-01', 1, 1, CAST(N'2024-11-10T18:05:29.297' AS DateTime), CAST(N'2024-11-10T18:05:29.297' AS DateTime), NULL, 1041)
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间], [志愿状态], [志愿ID_New]) VALUES (4, 21, 2, N'070503-01', 1, 0, CAST(N'2024-11-07T14:14:55.140' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime), N'待导师确认', 4)
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间], [志愿状态], [志愿ID_New]) VALUES (5, 22, 2, N'070503-01', 2, 1, CAST(N'2024-11-07T14:14:55.140' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime), N'待导师确认', 5)
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间], [志愿状态], [志愿ID_New]) VALUES (7, 31, 3, N'071001-03', 1, 1, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime), NULL, 7)
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间], [志愿状态], [志愿ID_New]) VALUES (8, 30, 3, N'071001-03', 2, 0, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime), NULL, 8)
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间], [志愿状态], [志愿ID_New]) VALUES (9, 29, 3, N'071001-03', 3, 1, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime), NULL, 9)
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间], [志愿状态], [志愿ID_New]) VALUES (10, 10, 4, N'070503-01', 1, 0, CAST(N'2024-11-07T14:14:55.140' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime), N'待导师确认', 10)
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间], [志愿状态], [志愿ID_New]) VALUES (11, 1, 4, N'070503-01', 2, 1, CAST(N'2024-11-07T14:14:55.140' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime), N'待导师确认', 11)
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间], [志愿状态], [志愿ID_New]) VALUES (13, 36, 5, N'080200-04', 1, 1, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime), NULL, 13)
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间], [志愿状态], [志愿ID_New]) VALUES (14, 35, 5, N'080200-04', 2, 0, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime), NULL, 14)
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间], [志愿状态], [志愿ID_New]) VALUES (15, 34, 5, N'080200-04', 3, 1, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime), NULL, 15)
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间], [志愿状态], [志愿ID_New]) VALUES (18, 3, 6, N'090301-01', 3, 0, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime), NULL, 18)
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间], [志愿状态], [志愿ID_New]) VALUES (19, 1, 7, N'070503-01', 1, 1, CAST(N'2024-11-07T14:14:55.140' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime), N'待导师确认', 19)
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间], [志愿状态], [志愿ID_New]) VALUES (21, 1, 8, N'070503-01', 1, 0, CAST(N'2024-11-07T14:14:55.140' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime), N'待导师确认', 21)
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间], [志愿状态], [志愿ID_New]) VALUES (23, 3, 8, N'070503-01', 3, 0, CAST(N'2024-11-07T14:14:55.140' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime), N'待导师确认', 23)
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间], [志愿状态], [志愿ID_New]) VALUES (24, 1, 9, N'070503-01', 1, 1, CAST(N'2024-11-07T14:14:55.140' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime), N'待导师确认', 24)
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间], [志愿状态], [志愿ID_New]) VALUES (26, 3, 9, N'070503-01', 3, 1, CAST(N'2024-11-07T14:14:55.140' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime), N'待导师确认', 26)
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间], [志愿状态], [志愿ID_New]) VALUES (27, 23, 10, N'090301-02', 1, 0, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime), NULL, 27)
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间], [志愿状态], [志愿ID_New]) VALUES (28, 24, 10, N'090301-02', 2, 1, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime), NULL, 28)
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间], [志愿状态], [志愿ID_New]) VALUES (29, 4, 10, N'090301-02', 3, 0, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime), NULL, 29)
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间], [志愿状态], [志愿ID_New]) VALUES (30, 12, 8, N'070503-01', 3, 1, CAST(N'2024-11-07T15:55:59.820' AS DateTime), CAST(N'2024-11-07T15:55:59.820' AS DateTime), NULL, 33)
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间], [志愿状态], [志愿ID_New]) VALUES (66, 1, 101, N'071001-01', 1, 1, CAST(N'2024-11-09T16:45:25.353' AS DateTime), CAST(N'2024-11-09T16:45:25.353' AS DateTime), N'未处理', 41)
SET IDENTITY_INSERT [dbo].[复试志愿] OFF
GO
INSERT [dbo].[获得] ([考生ID], [复试结果ID]) VALUES (3, 3)
INSERT [dbo].[获得] ([考生ID], [复试结果ID]) VALUES (4, 4)
INSERT [dbo].[获得] ([考生ID], [复试结果ID]) VALUES (5, 5)
INSERT [dbo].[获得] ([考生ID], [复试结果ID]) VALUES (6, 6)
INSERT [dbo].[获得] ([考生ID], [复试结果ID]) VALUES (7, 7)
INSERT [dbo].[获得] ([考生ID], [复试结果ID]) VALUES (9, 9)
INSERT [dbo].[获得] ([考生ID], [复试结果ID]) VALUES (10, 10)
INSERT [dbo].[获得] ([考生ID], [复试结果ID]) VALUES (101, 66)
GO
INSERT [dbo].[角色] ([角色ID], [角色名称], [角色描述], [角色权限]) VALUES (1, N'管理员', N'系统管理员，拥有所有权限', 15)
INSERT [dbo].[角色] ([角色ID], [角色名称], [角色描述], [角色权限]) VALUES (2, N'导师', N'导师维护个人简介等信息。导师在志愿选择阶段确认选择的学生。导师查看整体选择结果。', 10)
INSERT [dbo].[角色] ([角色ID], [角色名称], [角色描述], [角色权限]) VALUES (3, N'考生', N'可以查看个人报考信息和导师志愿、复试录取结果', 5)
INSERT [dbo].[角色] ([角色ID], [角色名称], [角色描述], [角色权限]) VALUES (4, N'学科负责人', N'确定学科研究方向', 12)
INSERT [dbo].[角色] ([角色ID], [角色名称], [角色描述], [角色权限]) VALUES (5, N'学科秘书', N'确定学科研究方向。', 8)
INSERT [dbo].[角色] ([角色ID], [角色名称], [角色描述], [角色权限]) VALUES (6, N'监督成员', N'同研究生主管领导，但没有审核权，可查看全过程。', 7)
INSERT [dbo].[角色] ([角色ID], [角色名称], [角色描述], [角色权限]) VALUES (7, N'研究生管理秘书', N'录入考生初、复试信息。收集和审核复试考生信息。发布录取公示结果。', 6)
INSERT [dbo].[角色] ([角色ID], [角色名称], [角色描述], [角色权限]) VALUES (8, N'外部用户', N'可以注册账户但无其他权限', 3)
INSERT [dbo].[角色] ([角色ID], [角色名称], [角色描述], [角色权限]) VALUES (9, N'访客', N'仅能浏览公共信息', 1)
INSERT [dbo].[角色] ([角色ID], [角色名称], [角色描述], [角色权限]) VALUES (10, N'研究生主管领导', N'审议考生和学生选择结果。', 9)
GO
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'071002', 3)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'071002-01', 3)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'071002-02', 3)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'071002-03', 3)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'071005', 4)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'071007', 5)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'071009', 6)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'071010', 7)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'071010-01', 7)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'071010-02', 7)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'0710Z2', 8)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'080200', 9)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'080200-01', 9)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'080200-02', 9)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'080200-03', 9)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'080200-04', 9)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'0829Z1', 10)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'083200', 11)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'083200-01', 11)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'083200-02', 11)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'083200-03', 11)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'083200-04', 11)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'086000', 12)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'090301', 13)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'090301-01', 13)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'090301-02', 13)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'090701', 14)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'090702', 15)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'090703', 16)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'090703-01', 16)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'090704', 17)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'090704-01', 17)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'090704-02', 17)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'090704-03', 17)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'090704-04', 17)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'0907Z2', 18)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'0907Z4', 19)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'095135', 20)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'095136（1）', 21)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'095136（2）', 21)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'095400', 22)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'095400（1）', 22)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'095400（2）', 22)
GO
INSERT [dbo].[考生] ([考生ID], [考生类别], [性别], [生源地], [个人简历], [更新时间], [创建时间], [用户ID], [身份证号], [毕业时间], [出生日期], [本科毕业学校名称], [本科专业], [本科毕业学校类型]) VALUES (2, N'往届生', N'女', N'上海市', N'工作经验丰富，曾参与多个项目。', NULL, CAST(N'2024-11-06T10:44:11.330' AS DateTime), 2, N'310101199002022345', CAST(N'2023-06-30' AS Date), CAST(N'1990-02-02' AS Date), N'复旦大学', N'电子工程', N'普通本科大学')
INSERT [dbo].[考生] ([考生ID], [考生类别], [性别], [生源地], [个人简历], [更新时间], [创建时间], [用户ID], [身份证号], [毕业时间], [出生日期], [本科毕业学校名称], [本科专业], [本科毕业学校类型]) VALUES (3, N'同等学力', N'男', N'广东省', N'本科成绩优异，拥有相关职业资格证书。', NULL, CAST(N'2024-11-06T10:44:11.330' AS DateTime), 4, N'440101199003033456', CAST(N'2022-06-30' AS Date), CAST(N'1990-03-03' AS Date), N'中山大学', N'土木工程', N'普通本科大学')
INSERT [dbo].[考生] ([考生ID], [考生类别], [性别], [生源地], [个人简历], [更新时间], [创建时间], [用户ID], [身份证号], [毕业时间], [出生日期], [本科毕业学校名称], [本科专业], [本科毕业学校类型]) VALUES (4, N'定向生', N'女', N'北京市', N'在校期间担任班级干部，表现突出。', NULL, CAST(N'2024-11-06T10:44:11.330' AS DateTime), 5, N'110101199004044567', CAST(N'2025-06-30' AS Date), CAST(N'1990-04-04' AS Date), N'北京师范大学', N'教育学', N'普通本科大学')
INSERT [dbo].[考生] ([考生ID], [考生类别], [性别], [生源地], [个人简历], [更新时间], [创建时间], [用户ID], [身份证号], [毕业时间], [出生日期], [本科毕业学校名称], [本科专业], [本科毕业学校类型]) VALUES (5, N'非定向考生', N'男', N'江苏省', N'多次获得学术奖项，有良好的科研基础。', NULL, CAST(N'2024-11-06T10:44:11.330' AS DateTime), 6, N'320101199005055678', CAST(N'2021-06-30' AS Date), CAST(N'1990-05-05' AS Date), N'合肥技术大学', N'化学工程', N'开放大学')
INSERT [dbo].[考生] ([考生ID], [考生类别], [性别], [生源地], [个人简历], [更新时间], [创建时间], [用户ID], [身份证号], [毕业时间], [出生日期], [本科毕业学校名称], [本科专业], [本科毕业学校类型]) VALUES (6, N'应届生', N'女', N'浙江省', N'热衷于创新和技术实践，参与过多个项目。', NULL, CAST(N'2024-11-06T10:44:11.330' AS DateTime), 7, N'330101199006066789', CAST(N'2024-06-30' AS Date), CAST(N'1990-06-06' AS Date), N'浙江大学', N'机械工程', N'普通本科大学')
INSERT [dbo].[考生] ([考生ID], [考生类别], [性别], [生源地], [个人简历], [更新时间], [创建时间], [用户ID], [身份证号], [毕业时间], [出生日期], [本科毕业学校名称], [本科专业], [本科毕业学校类型]) VALUES (7, N'往届生', N'男', N'天津市', N'有过跨行业经验，适应能力强。', NULL, CAST(N'2024-11-06T10:44:11.330' AS DateTime), 8, N'120101199007077890', CAST(N'2023-06-30' AS Date), CAST(N'1990-07-07' AS Date), N'私立大学', N'金融学', N'独立学院')
INSERT [dbo].[考生] ([考生ID], [考生类别], [性别], [生源地], [个人简历], [更新时间], [创建时间], [用户ID], [身份证号], [毕业时间], [出生日期], [本科毕业学校名称], [本科专业], [本科毕业学校类型]) VALUES (8, N'同等学力', N'女', N'山东省', N'有较强的语言表达能力，喜欢公共事务。', NULL, CAST(N'2024-11-06T10:44:11.330' AS DateTime), 9, N'370101199008088901', CAST(N'2022-06-30' AS Date), CAST(N'1990-08-08' AS Date), N'信息科技大学', N'公共管理', N'专科院校')
INSERT [dbo].[考生] ([考生ID], [考生类别], [性别], [生源地], [个人简历], [更新时间], [创建时间], [用户ID], [身份证号], [毕业时间], [出生日期], [本科毕业学校名称], [本科专业], [本科毕业学校类型]) VALUES (9, N'定向生', N'男', N'河南省', N'在校期间多次获得奖学金，成绩优秀。', NULL, CAST(N'2024-11-06T10:44:11.330' AS DateTime), 10, N'410101199009099012', CAST(N'2025-06-30' AS Date), CAST(N'1990-09-09' AS Date), N'郑州大学', N'环境科学', N'普通本科大学')
INSERT [dbo].[考生] ([考生ID], [考生类别], [性别], [生源地], [个人简历], [更新时间], [创建时间], [用户ID], [身份证号], [毕业时间], [出生日期], [本科毕业学校名称], [本科专业], [本科毕业学校类型]) VALUES (10, N'非定向考生', N'女', N'湖北省', N'具备丰富的社会实践经验，关注社会热点。', NULL, CAST(N'2024-11-06T10:44:11.330' AS DateTime), 1, N'420101199010101234', CAST(N'2021-06-30' AS Date), CAST(N'1990-10-10' AS Date), N'武汉大学', N'法学', N'普通本科大学')
INSERT [dbo].[考生] ([考生ID], [考生类别], [性别], [生源地], [个人简历], [更新时间], [创建时间], [用户ID], [身份证号], [毕业时间], [出生日期], [本科毕业学校名称], [本科专业], [本科毕业学校类型]) VALUES (101, N'定向生', N'男', N'湖南省', N'可以', NULL, NULL, 66, N'1', CAST(N'2023-01-02' AS Date), CAST(N'1900-09-12' AS Date), N'鹤壁', N'政治', N'普通本科大学')
INSERT [dbo].[考生] ([考生ID], [考生类别], [性别], [生源地], [个人简历], [更新时间], [创建时间], [用户ID], [身份证号], [毕业时间], [出生日期], [本科毕业学校名称], [本科专业], [本科毕业学校类型]) VALUES (102, NULL, NULL, NULL, NULL, NULL, NULL, 89, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (2, N'初试', N'201 英语一', CAST(N'2024-01-02' AS Date), N'地点B')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (3, N'初试', N'715 数理统计', CAST(N'2024-01-03' AS Date), N'地点C')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (4, N'复试', N'101 思想政治理论', CAST(N'2024-02-01' AS Date), N'地点D')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (5, N'复试', N'201 英语一或 203 日语', CAST(N'2024-02-02' AS Date), N'地点E')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (6, N'初试', N'715 数理统计', CAST(N'2024-01-03' AS Date), N'地点F')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (7, N'复试', N'101 思想政治理论', CAST(N'2024-02-01' AS Date), N'地点G')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (8, N'复试', N'201 英语一', CAST(N'2024-02-02' AS Date), N'地点H')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (9, N'复试', N'715 普通生态学', CAST(N'2024-02-03' AS Date), N'地点I')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (10, N'初试', N'314 数学（农）', CAST(N'2024-01-04' AS Date), N'地点J')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (11, N'初试', N'803 森林生态学', CAST(N'2024-01-05' AS Date), N'地点K')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (12, N'初试', N'802 普通生态学', CAST(N'2024-01-06' AS Date), N'地点L')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (13, N'复试', N'345 林业基础知识综合', CAST(N'2024-02-04' AS Date), N'地点M')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (14, N'复试', N'846 现代林业理论', CAST(N'2024-02-05' AS Date), N'地点N')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (15, N'初试', N'101 思想政治理论', CAST(N'2024-01-07' AS Date), N'地点O')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (16, N'复试', N'201 英语一', CAST(N'2024-02-06' AS Date), N'地点P')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (17, N'初试', N'715 数理统计', CAST(N'2024-01-08' AS Date), N'地点Q')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (18, N'复试', N'101 思想政治理论', CAST(N'2024-02-07' AS Date), N'地点R')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (19, N'复试', N'201 英语一', CAST(N'2024-02-08' AS Date), N'地点S')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (20, N'复试', N'203 日语', CAST(N'2024-02-09' AS Date), N'地点T')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (21, N'初试', N'715 数理统计', CAST(N'2024-01-09' AS Date), N'地点U')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (22, N'初试', N'101 思想政治理论', CAST(N'2024-01-10' AS Date), N'地点V')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (23, N'复试', N'803 森林生态学', CAST(N'2024-02-10' AS Date), N'地点W')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (24, N'复试', N'314 数学（农）', CAST(N'2024-02-11' AS Date), N'地点X')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (25, N'初试', N'802 普通生态学', CAST(N'2024-01-11' AS Date), N'地点Y')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (26, N'复试', N'846 现代林业理论', CAST(N'2024-02-12' AS Date), N'地点Z')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (27, N'初试', N'715 数理统计', CAST(N'2024-01-12' AS Date), N'地点AA')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (28, N'复试', N'101 思想政治理论', CAST(N'2024-02-13' AS Date), N'地点AB')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (29, N'复试', N'201 英语一', CAST(N'2024-02-14' AS Date), N'地点AC')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (30, N'复试', N'203 日语', CAST(N'2024-02-15' AS Date), N'地点AD')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (31, N'初试', N'715 数理统计', CAST(N'2024-01-13' AS Date), N'地点AE')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (32, N'复试', N'345 林业基础知识综合', CAST(N'2024-02-16' AS Date), N'地点AF')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (33, N'初试', N'101 思想政治理论', CAST(N'2024-01-14' AS Date), N'地点AG')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (34, N'复试', N'715 普通生态学', CAST(N'2024-02-17' AS Date), N'地点AH')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (35, N'初试', N'201 英语一', CAST(N'2024-01-15' AS Date), N'地点AI')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (36, N'初试', N'715 数理统计', CAST(N'2024-01-16' AS Date), N'地点AJ')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (37, N'复试', N'846 现代林业理论', CAST(N'2024-02-18' AS Date), N'地点AK')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (38, N'复试', N'803 森林生态学', CAST(N'2024-02-19' AS Date), N'地点AL')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (39, N'初试', N'314 数学（农）', CAST(N'2024-01-17' AS Date), N'地点AM')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (40, N'复试', N'345 林业基础知识综合', CAST(N'2024-02-20' AS Date), N'地点AN')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (66, N'初试', N'高等数学', CAST(N'2024-11-07' AS Date), N'考场A')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (112, N'复试', N'面试', CAST(N'2024-11-07' AS Date), N'考场B')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (116, N'复试', N'面试', CAST(N'2024-11-07' AS Date), N'考场B')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (501, N'初试', N'高等数学', CAST(N'2024-11-07' AS Date), N'考场A')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (502, N'复试', N'面试', CAST(N'2024-11-07' AS Date), N'考场B')
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (688, N'初试', N'线性代数', CAST(N'2024-11-07' AS Date), N'考场A')
GO
INSERT [dbo].[确定] ([复试结果ID], [导师ID]) VALUES (3, 10)
INSERT [dbo].[确定] ([复试结果ID], [导师ID]) VALUES (4, 35)
INSERT [dbo].[确定] ([复试结果ID], [导师ID]) VALUES (5, 3)
INSERT [dbo].[确定] ([复试结果ID], [导师ID]) VALUES (7, 1)
INSERT [dbo].[确定] ([复试结果ID], [导师ID]) VALUES (66, 38)
GO
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (101, 1)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (2, 4)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (2, 5)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (3, 7)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (3, 8)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (3, 9)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (4, 10)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (4, 11)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (5, 13)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (5, 14)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (5, 15)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (6, 18)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (7, 19)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (8, 21)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (8, 23)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (9, 24)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (9, 26)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (10, 27)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (10, 28)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (10, 29)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (101, 66)
GO
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (1, 22)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (4, 21)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (5, 22)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (7, 31)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (8, 30)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (9, 29)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (10, 10)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (11, 1)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (13, 36)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (14, 35)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (15, 34)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (18, 3)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (19, 1)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (21, 1)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (23, 3)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (24, 1)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (26, 3)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (27, 23)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (28, 24)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (29, 4)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (66, 1)
GO
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'070503', N'地图学与地理信息系统', N'一级学科', N'与地图及信息系统相关', N'学术型学科', N'地理信息学', NULL, CAST(N'2024-11-06T12:08:28.047' AS DateTime), CAST(N'2024-11-06T12:08:28.047' AS DateTime), N'80', N'15')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'070503-01', N'3S 技术集成开发与应用', N'二级学科', N'研究智能制造相关技术', N'学术型学科', N'智能制造', N'地图学与地理信息系统', CAST(N'2024-11-07T14:57:31.807' AS DateTime), CAST(N'2024-11-06T12:36:55.693' AS DateTime), N'6', N'3')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'071001', N'植物学', N'一级学科', N'植物学科相关研究', N'学术型学科', N'植物科学、植物生物学等', NULL, CAST(N'2024-11-06T12:08:28.047' AS DateTime), CAST(N'2024-11-06T12:08:28.047' AS DateTime), N'90', N'18')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'071001-01', N'树木逆境生物学', N'二级学科', N'植物学科相关研究', N'专业学位', N'农业工程技术', N'植物学', CAST(N'2024-11-06T12:36:55.693' AS DateTime), CAST(N'2024-11-06T12:36:55.693' AS DateTime), N'10', N'2')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'071001-02', N'植物分类与系统演化', N'二级学科', N'植物学科相关研究', N'专业学位', N'林业技术与应用', N'植物学', CAST(N'2024-11-06T12:36:55.693' AS DateTime), CAST(N'2024-11-06T12:36:55.693' AS DateTime), N'10', N'3')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'071001-03', N'木本植物生长发育及其调控机理', N'二级学科', N'植物学科相关研究', N'专业学位', N'林业技术与应用', N'植物学', CAST(N'2024-11-06T12:36:55.693' AS DateTime), CAST(N'2024-11-06T12:36:55.693' AS DateTime), N'1', N'0')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'071001-04', N'光合作用与光生物学', N'二级学科', N'植物学科相关研究', N'学术型学科', N'植物科学、植物生物学等', N'植物学', CAST(N'2024-11-06T12:36:55.693' AS DateTime), CAST(N'2024-11-06T12:36:55.693' AS DateTime), N'9', N'1')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'071002', N'动物学', N'一级学科', N'动物学科相关研究', N'学术型学科', N'动物生物学、动物保护等', NULL, CAST(N'2024-11-06T12:08:28.047' AS DateTime), CAST(N'2024-11-06T12:08:28.047' AS DateTime), N'100', N'20')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'071002-01', N'动物生殖生物学', N'二级学科', N'动物学科相关研究', N'学术型学科', N'动物生物学、动物保护等', N'动物学', CAST(N'2024-11-06T12:36:55.693' AS DateTime), CAST(N'2024-11-06T12:36:55.693' AS DateTime), N'10', N'2')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'071002-02', N'动物分子生态学 ', N'二级学科', N'动物学科相关研究', N'学术型学科', N'微生物学、病原生物学等', N' 动物学', CAST(N'2024-11-06T12:36:55.693' AS DateTime), CAST(N'2024-11-06T12:36:55.693' AS DateTime), N'10', N'2')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'071002-03', N'动物行为学', N'二级学科', N'动物学科相关研究', N'学术型学科', N'遗传学、生物信息学等', N'动物学', CAST(N'2024-11-06T12:36:55.693' AS DateTime), CAST(N'2024-11-06T12:36:55.693' AS DateTime), N'10', N'2')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'071005', N'微生物学', N'一级学科', N'微生物学科相关研究', N'学术型学科', N'微生物学、病原生物学等', NULL, CAST(N'2024-11-06T12:08:28.047' AS DateTime), CAST(N'2024-11-06T12:08:28.047' AS DateTime), N'120', N'24')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'071007', N'遗传学', N'一级学科', N'遗传学科相关研究', N'学术型学科', N'遗传学、生物信息学等', NULL, CAST(N'2024-11-06T12:08:28.047' AS DateTime), CAST(N'2024-11-06T12:08:28.047' AS DateTime), N'100', N'20')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'071009', N'细胞生物学', N'一级学科', N'细胞生物学科相关研究', N'学术型学科', N'细胞生物学、分子生物学等', NULL, CAST(N'2024-11-06T12:08:28.047' AS DateTime), CAST(N'2024-11-06T12:08:28.047' AS DateTime), N'110', N'22')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'071010', N'生物化学与分子生物学', N'一级学科', N'生物化学与分子生物学相关研究', N'学术型学科', N'分子生物学、基因工程等', NULL, CAST(N'2024-11-06T12:08:28.047' AS DateTime), CAST(N'2024-11-06T12:08:28.047' AS DateTime), N'130', N'26')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'071010-01', N'生物化学', N'二级学科', N'生物化学与分子生物学相关研究', N'学术型学科', N'分子生物学、基因工程等', N' 生物化学与分子生物学', CAST(N'2024-11-06T12:36:55.693' AS DateTime), CAST(N'2024-11-06T12:36:55.693' AS DateTime), N'13', N'2')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'071010-02', N'分子生物学', N'二级学科', N'生物化学与分子生物学相关研究', N'学术型学科', N'细胞生物学、分子生物学等', N'生物化学与分子生物学', CAST(N'2024-11-06T12:36:55.693' AS DateTime), CAST(N'2024-11-06T12:36:55.693' AS DateTime), N'11', N'2')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'0710Z2', N'计算生物学与生物信息学', N'一级学科', N'计算生物学与生物信息学相关研究', N'学术型学科', N'计算生物学、基因组学等', NULL, CAST(N'2024-11-06T12:08:28.047' AS DateTime), CAST(N'2024-11-06T12:08:28.047' AS DateTime), N'120', N'24')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'080200', N'机械工程', N'一级学科', N'机械工程学科相关研究', N'学术型学科', N'机械设计、制造等', NULL, CAST(N'2024-11-06T12:08:28.047' AS DateTime), CAST(N'2024-11-06T12:08:28.047' AS DateTime), N'100', N'20')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'080200-01', N'无损检测技术与装备', N'二级学科', N'林业学科相关研究', N'专业学位', N'林业技术与应用', N'机械工程', CAST(N'2024-11-06T12:36:55.693' AS DateTime), CAST(N'2024-11-06T12:36:55.693' AS DateTime), N'18', N'5')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'080200-02', N'智能机器人', N'二级学科', N'食品加工与相关研究', N'专业学位', N'食品加工、食品质量管理等', N'机械工程', CAST(N'2024-11-06T12:36:55.693' AS DateTime), CAST(N'2024-11-06T12:36:55.693' AS DateTime), N'13', N'2')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'080200-03', N'先进设计与智能制造', N'二级学科', N'机械工程学科相关研究', N'学术型学科', N'机械设计、制造等', N'机械工程', CAST(N'2024-11-06T12:36:55.693' AS DateTime), CAST(N'2024-11-06T12:36:55.693' AS DateTime), N'10', N'2')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'080200-04', N'智能车辆与无人驾驶', N'二级学科', N'林业装备与信息化相关研究', N'学术型学科', N'林业装备、信息化技术等', N'机械工程', CAST(N'2024-11-06T12:36:55.693' AS DateTime), CAST(N'2024-11-06T12:36:55.693' AS DateTime), N'11', N'2')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'0829Z1', N'林业装备与信息化', N'一级学科', N'林业装备与信息化相关研究', N'学术型学科', N'林业装备、信息化技术等', NULL, CAST(N'2024-11-06T12:08:28.047' AS DateTime), CAST(N'2024-11-06T12:08:28.047' AS DateTime), N'110', N'22')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'083200', N'食品科学与工程', N'一级学科', N'食品科学与工程学科相关研究', N'学术型学科', N'食品技术、食品工程等', NULL, CAST(N'2024-11-06T12:08:28.047' AS DateTime), CAST(N'2024-11-06T12:08:28.047' AS DateTime), N'100', N'20')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'083200-01', N'食品科学', N'二级学科', N'计算生物学与生物信息学相关研究', N'学术型学科', N'计算生物学、基因组学等', N'食品科学与工程', CAST(N'2024-11-06T12:36:55.693' AS DateTime), CAST(N'2024-11-06T12:36:55.693' AS DateTime), N'12', N'2')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'083200-02', N'农产品加工及贮藏工程', N'二级学科', N'食品科学与工程学科相关研究', N'学术型学科', N'食品技术、食品工程等', N'食品科学与工程', CAST(N'2024-11-06T12:36:55.693' AS DateTime), CAST(N'2024-11-06T12:36:55.693' AS DateTime), N'10', N'2')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'083200-03', N'粮食，油脂及植物蛋白工程', N'二级学科', N'生物与医药相关学科', N'专业学位', N'生物医药、医疗技术等', N'食品科学与工程', CAST(N'2024-11-06T12:36:55.693' AS DateTime), CAST(N'2024-11-06T12:36:55.693' AS DateTime), N'10', N'3')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'083200-04', N'食品安全', N'二级学科', N'林木遗传育种学科相关研究', N'学术型学科', N'林木遗传、育种技术等', N'食品科学与工程', CAST(N'2024-11-06T12:36:55.693' AS DateTime), CAST(N'2024-11-06T12:36:55.693' AS DateTime), N'12', N'2')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'086000', N'生物与医药（全日制专业学位）', N'一级学科', N'生物与医药相关学科', N'专业学位', N'生物医药、医疗技术等', NULL, CAST(N'2024-11-06T12:08:28.047' AS DateTime), CAST(N'2024-11-06T12:08:28.047' AS DateTime), N'150', N'30')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'090301', N'土壤学', N'一级学科', N'土壤学科相关研究', N'学术型学科', N'土壤环境、土壤科学', NULL, CAST(N'2024-11-06T12:08:28.047' AS DateTime), CAST(N'2024-11-06T12:08:28.047' AS DateTime), N'100', N'20')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'090301-01', N'土壤生态', N'二级学科', N'土壤学科相关研究', N'学术型学科', N'土壤环境、土壤科学', N'土壤学', CAST(N'2024-11-06T12:36:55.693' AS DateTime), CAST(N'2024-11-06T12:36:55.693' AS DateTime), N'3', N'1')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'090301-02', N'土壤资源与环境', N'二级学科', N'森林培育学科相关研究', N'学术型学科', N'森林生态与培育', N'土壤学', CAST(N'2024-11-06T12:36:55.693' AS DateTime), CAST(N'2024-11-06T12:36:55.693' AS DateTime), N'2', N'0')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'090701', N'林木遗传育种', N'一级学科', N'林木遗传育种学科相关研究', N'学术型学科', N'林木遗传、育种技术等', NULL, CAST(N'2024-11-06T12:08:28.047' AS DateTime), CAST(N'2024-11-06T12:08:28.047' AS DateTime), N'120', N'24')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'090702', N'森林培育', N'一级学科', N'森林培育学科相关研究', N'学术型学科', N'森林生态与培育', NULL, CAST(N'2024-11-06T12:08:28.047' AS DateTime), CAST(N'2024-11-06T12:08:28.047' AS DateTime), N'120', N'25')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'090703', N'森林保护学', N'一级学科', N'森林保护学科相关研究', N'学术型学科', N'森林保护', NULL, CAST(N'2024-11-06T12:08:28.047' AS DateTime), CAST(N'2024-11-06T12:08:28.047' AS DateTime), N'110', N'22')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'090703-01', N'森林昆虫学', N'二级学科', N'森林保护学科相关研究', N'学术型学科', N'森林保护', N'森林保护学', CAST(N'2024-11-06T12:36:55.693' AS DateTime), CAST(N'2024-11-06T12:36:55.693' AS DateTime), N'11', N'2')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'090704', N'森林经理学', N'一级学科', N'森林管理学科相关研究', N'学术型学科', N'森林资源管理', NULL, CAST(N'2024-11-06T12:08:28.047' AS DateTime), CAST(N'2024-11-06T12:08:28.047' AS DateTime), N'90', N'18')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'090704-01', N'森林经营理论与技术', N'二级学科', N'森林管理学科相关研究', N'学术型学科', N'森林资源管理', N' 森林经理学', CAST(N'2024-11-06T12:36:55.693' AS DateTime), CAST(N'2024-11-06T12:36:55.693' AS DateTime), N'9', N'1')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'090704-02', N'森林资源调查与监测 ', N'二级学科', N'城市森林学科相关研究', N'学术型学科', N'城市林业生态与规划', N'森林经理学', CAST(N'2024-11-06T12:36:55.693' AS DateTime), CAST(N'2024-11-06T12:36:55.693' AS DateTime), N'4', N'1')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'090704-03', N'森林结构与生长模型模拟', N'二级学科', N'森林学科相关研究', N'学术型学科', N'森林生态与保护', N'森林经理学', CAST(N'2024-11-06T12:36:55.693' AS DateTime), CAST(N'2024-11-06T12:36:55.693' AS DateTime), N'10', N'1')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'090704-04', N'林业遥感与信息技术', N'二级学科', N'农业工程相关学科', N'专业学位', N'农业工程技术', N'森林经理学', CAST(N'2024-11-06T12:36:55.693' AS DateTime), CAST(N'2024-11-06T12:36:55.693' AS DateTime), N'15', N'3')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'0907Z2', N'城市林业', N'一级学科', N'城市森林学科相关研究', N'学术型学科', N'城市林业生态与规划', NULL, CAST(N'2024-11-06T12:08:28.047' AS DateTime), CAST(N'2024-11-06T12:08:28.047' AS DateTime), N'70', N'14')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'0907Z4', N'森林学', N'一级学科', N'森林学科相关研究', N'学术型学科', N'森林生态与保护', NULL, CAST(N'2024-11-06T12:08:28.047' AS DateTime), CAST(N'2024-11-06T12:08:28.047' AS DateTime), N'80', N'16')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'095135', N'食品加工与（全日制专业学位）', N'一级学科', N'食品加工与相关研究', N'专业学位', N'食品加工、食品质量管理等', NULL, CAST(N'2024-11-06T12:08:28.047' AS DateTime), CAST(N'2024-11-06T12:08:28.047' AS DateTime), N'130', N'26')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'095136（1）', N'农业工程与信息技术（非全日制专业学位）', N'一级学科', N'农业工程相关学科', N'专业学位', N'农业工程技术', NULL, CAST(N'2024-11-06T12:08:28.047' AS DateTime), CAST(N'2024-11-06T12:08:28.047' AS DateTime), N'100', N'20')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'095136（2）', N'农业工程与信息技术（全日制专业学位）', N'一级学科', N'农业工程相关学科', N'专业学位', N'农业工程技术', NULL, CAST(N'2024-11-06T12:08:28.047' AS DateTime), CAST(N'2024-11-06T12:08:28.047' AS DateTime), N'150', N'30')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'095400', N'林业（全日制专业学位）', N'一级学科', N'林业学科相关研究', N'专业学位', N'林业技术与应用', NULL, CAST(N'2024-11-06T12:08:28.047' AS DateTime), CAST(N'2024-11-06T12:08:28.047' AS DateTime), N'180', N'35')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'095400（1）', N'林业（全日制专业学位）', N'一级学科', N'林业学科相关研究', N'专业学位', N'林业技术与应用', NULL, CAST(N'2024-11-06T12:08:28.047' AS DateTime), CAST(N'2024-11-06T12:08:28.047' AS DateTime), N'180', N'35')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'095400（2）', N'林业（非全日制专业学位）', N'一级学科', N'林业学科相关研究', N'专业学位', N'林业技术与应用', NULL, CAST(N'2024-11-06T12:08:28.047' AS DateTime), CAST(N'2024-11-06T12:08:28.047' AS DateTime), N'150', N'30')
GO
INSERT [dbo].[学院] ([学院ID], [学院名称]) VALUES (1, N'林学院')
INSERT [dbo].[学院] ([学院ID], [学院名称]) VALUES (2, N'生物科学与技术学院')
INSERT [dbo].[学院] ([学院ID], [学院名称]) VALUES (3, N'工学院')
INSERT [dbo].[学院] ([学院ID], [学院名称]) VALUES (4, N'信息学院')
INSERT [dbo].[学院] ([学院ID], [学院名称]) VALUES (5, N'材料科学与技术学院')
INSERT [dbo].[学院] ([学院ID], [学院名称]) VALUES (6, N'园林学院')
INSERT [dbo].[学院] ([学院ID], [学院名称]) VALUES (7, N'经济管理学院')
INSERT [dbo].[学院] ([学院ID], [学院名称]) VALUES (8, N'水土保持学院')
INSERT [dbo].[学院] ([学院ID], [学院名称]) VALUES (9, N'生态与自然保护学院（国家公园学院）')
INSERT [dbo].[学院] ([学院ID], [学院名称]) VALUES (11, N'外语学院')
INSERT [dbo].[学院] ([学院ID], [学院名称]) VALUES (12, N'理学院')
INSERT [dbo].[学院] ([学院ID], [学院名称]) VALUES (13, N'环境科学与工程学院')
INSERT [dbo].[学院] ([学院ID], [学院名称]) VALUES (14, N'艺术设计学院')
INSERT [dbo].[学院] ([学院ID], [学院名称]) VALUES (15, N'马克思主义学院')
GO
INSERT [dbo].[拥有] ([考生ID], [总成绩ID], [类型]) VALUES (2, 3, NULL)
INSERT [dbo].[拥有] ([考生ID], [总成绩ID], [类型]) VALUES (2, 4, NULL)
INSERT [dbo].[拥有] ([考生ID], [总成绩ID], [类型]) VALUES (3, 5, N'初试')
INSERT [dbo].[拥有] ([考生ID], [总成绩ID], [类型]) VALUES (3, 6, N'复试')
INSERT [dbo].[拥有] ([考生ID], [总成绩ID], [类型]) VALUES (4, 7, N'初试')
INSERT [dbo].[拥有] ([考生ID], [总成绩ID], [类型]) VALUES (4, 8, N'复试')
INSERT [dbo].[拥有] ([考生ID], [总成绩ID], [类型]) VALUES (5, 9, N'初试')
INSERT [dbo].[拥有] ([考生ID], [总成绩ID], [类型]) VALUES (5, 10, N'复试')
INSERT [dbo].[拥有] ([考生ID], [总成绩ID], [类型]) VALUES (6, 11, N'初试')
INSERT [dbo].[拥有] ([考生ID], [总成绩ID], [类型]) VALUES (6, 12, N'复试')
INSERT [dbo].[拥有] ([考生ID], [总成绩ID], [类型]) VALUES (7, 13, N'初试')
INSERT [dbo].[拥有] ([考生ID], [总成绩ID], [类型]) VALUES (7, 14, N'复试')
INSERT [dbo].[拥有] ([考生ID], [总成绩ID], [类型]) VALUES (8, 15, N'初试')
INSERT [dbo].[拥有] ([考生ID], [总成绩ID], [类型]) VALUES (8, 16, N'复试')
INSERT [dbo].[拥有] ([考生ID], [总成绩ID], [类型]) VALUES (9, 17, N'初试')
INSERT [dbo].[拥有] ([考生ID], [总成绩ID], [类型]) VALUES (9, 18, N'复试')
INSERT [dbo].[拥有] ([考生ID], [总成绩ID], [类型]) VALUES (10, 19, N'初试')
INSERT [dbo].[拥有] ([考生ID], [总成绩ID], [类型]) VALUES (10, 20, N'复试')
INSERT [dbo].[拥有] ([考生ID], [总成绩ID], [类型]) VALUES (101, 66, N'复试')
INSERT [dbo].[拥有] ([考生ID], [总成绩ID], [类型]) VALUES (102, 204, N'初试')
INSERT [dbo].[拥有] ([考生ID], [总成绩ID], [类型]) VALUES (102, 205, NULL)
GO
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (1, N'admin', NULL, CAST(N'2024-11-06T10:37:31.993' AS DateTime), 1, N'admin@example.com', N'13800138000', N'张三', N'password123')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (2, N'mentor1', NULL, CAST(N'2024-11-06T10:37:31.993' AS DateTime), 2, N'mentor1@example.com', N'13800138001', N'李四', N'password456')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (4, N'subjecthead1', NULL, CAST(N'2024-11-06T10:37:31.993' AS DateTime), 4, N'subjecthead1@example.com', N'13800138003', N'赵六', N'password101')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (5, N'subjectsec1', NULL, CAST(N'2024-11-06T10:37:31.993' AS DateTime), 5, N'subjectsec1@example.com', N'13800138004', N'孙七', N'password202')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (6, N'supervisormember1', NULL, CAST(N'2024-11-06T10:37:31.993' AS DateTime), 6, N'supervisormember1@example.com', N'13800138005', N'周八', N'password303')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (7, N'gradsecretary1', NULL, CAST(N'2024-11-06T10:37:31.993' AS DateTime), 7, N'gradsecretary1@example.com', N'13800138006', N'钱九', N'password404')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (8, N'externaluser1', NULL, CAST(N'2024-11-06T10:37:31.993' AS DateTime), 8, N'externaluser1@example.com', N'13800138007', N'吴十', N'password505')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (9, N'visitor1', NULL, CAST(N'2024-11-06T10:37:31.993' AS DateTime), 9, N'visitor1@example.com', N'13800138008', N'郑十一', N'password606')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (10, N'gradlead1', NULL, CAST(N'2024-11-06T10:37:31.993' AS DateTime), 10, N'gradlead1@example.com', N'13800138009', N'冯十二', N'password707')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (11, N'mentor2', NULL, CAST(N'2024-11-06T11:46:40.047' AS DateTime), 2, N'mentor2@example.com', N'13800138003', N'赵可', N'password123')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (12, N'mentor3', NULL, CAST(N'2024-11-06T11:46:40.047' AS DateTime), 2, N'mentor3@example.com', N'13800138004', N'王七', N'password123')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (13, N'mentor4', NULL, CAST(N'2024-11-06T11:46:40.047' AS DateTime), 2, N'mentor4@example.com', N'13800138005', N'周其', N'password113')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (14, N'mentor5', NULL, CAST(N'2024-11-06T11:46:40.047' AS DateTime), 2, N'mentor5@example.com', N'13800138006', N'吴里', N'password123')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (15, N'mentor6', NULL, CAST(N'2024-11-06T11:46:40.047' AS DateTime), 2, N'mentor6@example.com', N'13800138007', N'郑出', N'password113')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (16, N'mentor7', NULL, CAST(N'2024-11-06T11:46:40.047' AS DateTime), 2, N'mentor7@example.com', N'13800138008', N'冯好', N'password123')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (17, N'mentor8', NULL, CAST(N'2024-11-06T11:46:40.047' AS DateTime), 2, N'mentor8@example.com', N'13800138009', N'陈中', N'password123')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (18, N'candidate2', NULL, CAST(N'2024-11-06T11:47:40.890' AS DateTime), 3, N'candidate2@example.com', N'13800138010', N'林小明', N'password234')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (19, N'candidate3', NULL, CAST(N'2024-11-06T11:47:40.890' AS DateTime), 3, N'candidate3@example.com', N'13800138011', N'刘晓娜', N'password234')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (20, N'candidate4', NULL, CAST(N'2024-11-06T11:47:40.890' AS DateTime), 3, N'candidate4@example.com', N'13800138012', N'王强', N'password234')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (21, N'candidate10', NULL, CAST(N'2024-11-06T11:47:40.890' AS DateTime), 3, N'candidate10@example.com', N'13800138018', N'陈凯', N'password234')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (22, N'candidate11', NULL, CAST(N'2024-11-06T11:47:40.890' AS DateTime), 3, N'candidate11@example.com', N'13800138019', N'冯欣怡', N'password234')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (23, N'candidate9', NULL, CAST(N'2024-11-06T11:47:40.890' AS DateTime), 3, N'candidate9@example.com', N'13800138017', N'周子健', N'password234')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (24, N'candidate5', NULL, CAST(N'2024-11-06T11:47:40.890' AS DateTime), 3, N'candidate5@example.com', N'13800138013', N'李晨', N'password234')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (25, N'candidate6', NULL, CAST(N'2024-11-06T11:47:40.890' AS DateTime), 3, N'candidate6@example.com', N'13800138014', N'张静', N'password234')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (26, N'candidate7', NULL, CAST(N'2024-11-06T11:47:40.890' AS DateTime), 3, N'candidate7@example.com', N'13800138015', N'孙佳怡', N'password234')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (27, N'candidate8', NULL, CAST(N'2024-11-06T11:47:40.890' AS DateTime), 3, N'candidate8@example.com', N'13800138016', N'赵莉莉', N'password234')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (28, N'mentor9', NULL, CAST(N'2024-11-06T11:51:21.790' AS DateTime), 2, N'mentor9@example.com', N'13800138028', N'高伟', N'password123')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (29, N'mentor10', NULL, CAST(N'2024-11-06T11:51:21.790' AS DateTime), 2, N'mentor10@example.com', N'13800138029', N'李波', N'password123')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (30, N'mentor11', NULL, CAST(N'2024-11-06T11:51:21.790' AS DateTime), 2, N'mentor11@example.com', N'13800138030', N'周婷', N'password123')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (31, N'mentor12', NULL, CAST(N'2024-11-06T11:51:21.790' AS DateTime), 2, N'mentor12@example.com', N'13800138031', N'王晓', N'password123')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (32, N'mentor13', NULL, CAST(N'2024-11-06T11:51:21.790' AS DateTime), 2, N'mentor13@example.com', N'13800138032', N'赵力', N'password123')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (33, N'mentor14', NULL, CAST(N'2024-11-06T11:51:21.790' AS DateTime), 2, N'mentor14@example.com', N'13800138033', N'孙丽', N'password123')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (34, N'mentor15', NULL, CAST(N'2024-11-06T11:51:21.790' AS DateTime), 2, N'mentor15@example.com', N'13800138034', N'陈艳', N'password123')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (35, N'mentor16', NULL, CAST(N'2024-11-06T11:51:21.790' AS DateTime), 2, N'mentor16@example.com', N'13800138035', N'李春', N'password123')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (36, N'mentor17', NULL, CAST(N'2024-11-06T11:51:21.790' AS DateTime), 2, N'mentor17@example.com', N'13800138036', N'张军', N'password123')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (37, N'mentor18', NULL, CAST(N'2024-11-06T11:51:21.790' AS DateTime), 2, N'mentor18@example.com', N'13800138037', N'杨娜', N'password123')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (38, N'mentor19', NULL, CAST(N'2024-11-06T11:51:21.790' AS DateTime), 2, N'mentor19@example.com', N'13800138038', N'王磊', N'password123')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (39, N'mentor20', NULL, CAST(N'2024-11-06T11:51:21.790' AS DateTime), 2, N'mentor20@example.com', N'13800138039', N'李娜', N'password123')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (40, N'mentor21', NULL, CAST(N'2024-11-06T11:51:21.790' AS DateTime), 2, N'mentor21@example.com', N'13800138040', N'孙勇', N'password123')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (41, N'导师', CAST(N'2024-11-07T19:43:51.120' AS DateTime), CAST(N'2024-11-07T19:43:51.120' AS DateTime), NULL, N'admin@example.com', N'1234567890', N'管理员姓名', N'admin_password')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (42, N'导师', CAST(N'2024-11-07T19:51:26.980' AS DateTime), CAST(N'2024-11-07T19:51:26.980' AS DateTime), NULL, N'admin@example.com', N'1234567890', N'管理员姓名', N'admin_password')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (66, N'学生', NULL, CAST(N'2024-11-07T16:28:11.457' AS DateTime), 3, N'qq.com', N'27364990238', N'考生1', N'password')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (88, N'@导师ID', NULL, CAST(N'2024-11-09T17:30:43.150' AS DateTime), 2, NULL, NULL, NULL, N'123456')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (89, N'102', NULL, CAST(N'2024-11-09T17:38:05.470' AS DateTime), 3, NULL, NULL, NULL, N'123456')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (100, N'管理员', CAST(N'2024-11-07T19:42:39.220' AS DateTime), CAST(N'2024-11-07T19:42:39.220' AS DateTime), NULL, N'admin@example.com', N'1234567890', N'管理员姓名', N'admin_password')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (101, N'导师101', CAST(N'2024-11-06T14:04:09.880' AS DateTime), CAST(N'2024-11-06T14:04:09.880' AS DateTime), 1, N'mentor101@example.com', N'13800000001', N'导师一', N'password101')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (102, N'导师102', CAST(N'2024-11-06T14:04:09.880' AS DateTime), CAST(N'2024-11-06T14:04:09.880' AS DateTime), 1, N'mentor102@example.com', N'13800000002', N'导师二', N'password102')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (103, N'导师103', CAST(N'2024-11-06T14:04:09.880' AS DateTime), CAST(N'2024-11-06T14:04:09.880' AS DateTime), 1, N'mentor103@example.com', N'13800000003', N'导师三', N'password103')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (104, N'导师104', CAST(N'2024-11-06T14:04:09.880' AS DateTime), CAST(N'2024-11-06T14:04:09.880' AS DateTime), 1, N'mentor104@example.com', N'13800000004', N'导师四', N'password104')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (105, N'导师105', CAST(N'2024-11-06T14:04:09.880' AS DateTime), CAST(N'2024-11-06T14:04:09.880' AS DateTime), 1, N'mentor105@example.com', N'13800000005', N'导师五', N'password105')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (106, N'导师106', CAST(N'2024-11-06T14:04:09.880' AS DateTime), CAST(N'2024-11-06T14:04:09.880' AS DateTime), 1, N'mentor106@example.com', N'13800000006', N'导师六', N'password106')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (107, N'导师107', CAST(N'2024-11-06T14:04:09.880' AS DateTime), CAST(N'2024-11-06T14:04:09.880' AS DateTime), 1, N'mentor107@example.com', N'13800000007', N'导师七', N'password107')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (108, N'导师108', CAST(N'2024-11-06T14:04:09.880' AS DateTime), CAST(N'2024-11-06T14:04:09.880' AS DateTime), 1, N'mentor108@example.com', N'13800000008', N'导师八', N'password108')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (109, N'导师109', CAST(N'2024-11-06T14:04:09.880' AS DateTime), CAST(N'2024-11-06T14:04:09.880' AS DateTime), 1, N'mentor109@example.com', N'13800000009', N'导师九', N'password109')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (110, N'导师110', CAST(N'2024-11-06T14:04:09.880' AS DateTime), CAST(N'2024-11-06T14:04:09.880' AS DateTime), 1, N'mentor110@example.com', N'13800000010', N'导师十', N'password110')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (111, N'导师111', CAST(N'2024-11-06T14:04:09.880' AS DateTime), CAST(N'2024-11-06T14:04:09.880' AS DateTime), 1, N'mentor111@example.com', N'13800000011', N'导师十一', N'password111')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (112, N'导师112', CAST(N'2024-11-06T14:04:09.880' AS DateTime), CAST(N'2024-11-06T14:04:09.880' AS DateTime), 1, N'mentor112@example.com', N'13800000012', N'导师十二', N'password112')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (113, N'导师113', CAST(N'2024-11-06T14:04:09.880' AS DateTime), CAST(N'2024-11-06T14:04:09.880' AS DateTime), 1, N'mentor113@example.com', N'13800000013', N'导师十三', N'password113')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (114, N'导师114', CAST(N'2024-11-06T14:04:09.880' AS DateTime), CAST(N'2024-11-06T14:04:09.880' AS DateTime), 1, N'mentor114@example.com', N'13800000014', N'导师十四', N'password114')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (115, N'导师115', CAST(N'2024-11-06T14:04:09.880' AS DateTime), CAST(N'2024-11-06T14:04:09.880' AS DateTime), 1, N'mentor115@example.com', N'13800000015', N'导师十五', N'password115')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (116, N'导师116', CAST(N'2024-11-06T14:04:09.880' AS DateTime), CAST(N'2024-11-06T14:04:09.880' AS DateTime), 1, N'mentor116@example.com', N'13800000016', N'导师十六', N'password116')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (117, N'导师117', CAST(N'2024-11-06T14:04:09.880' AS DateTime), CAST(N'2024-11-06T14:04:09.880' AS DateTime), 1, N'mentor117@example.com', N'13800000017', N'导师十七', N'password117')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (118, N'导师118', CAST(N'2024-11-06T14:04:09.880' AS DateTime), CAST(N'2024-11-06T14:04:09.880' AS DateTime), 1, N'mentor118@example.com', N'13800000018', N'导师十八', N'password118')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (119, N'导师119', CAST(N'2024-11-06T14:04:09.880' AS DateTime), CAST(N'2024-11-06T14:04:09.880' AS DateTime), 1, N'mentor119@example.com', N'13800000019', N'导师十九', N'password119')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (120, N'导师120', CAST(N'2024-11-06T14:04:09.880' AS DateTime), CAST(N'2024-11-06T14:04:09.880' AS DateTime), 1, N'mentor120@example.com', N'13800000020', N'导师二十', N'password120')
GO
INSERT [dbo].[招生目录] ([招生目录ID], [招生年度], [是否通过学校审核]) VALUES (3, 2022, 0)
INSERT [dbo].[招生目录] ([招生目录ID], [招生年度], [是否通过学校审核]) VALUES (4, 2021, 1)
INSERT [dbo].[招生目录] ([招生目录ID], [招生年度], [是否通过学校审核]) VALUES (5, 2020, 0)
INSERT [dbo].[招生目录] ([招生目录ID], [招生年度], [是否通过学校审核]) VALUES (6, 2024, 1)
INSERT [dbo].[招生目录] ([招生目录ID], [招生年度], [是否通过学校审核]) VALUES (7, 2024, 1)
INSERT [dbo].[招生目录] ([招生目录ID], [招生年度], [是否通过学校审核]) VALUES (8, 2024, 0)
INSERT [dbo].[招生目录] ([招生目录ID], [招生年度], [是否通过学校审核]) VALUES (9, 2024, 1)
INSERT [dbo].[招生目录] ([招生目录ID], [招生年度], [是否通过学校审核]) VALUES (10, 2024, 0)
INSERT [dbo].[招生目录] ([招生目录ID], [招生年度], [是否通过学校审核]) VALUES (11, 2024, 1)
INSERT [dbo].[招生目录] ([招生目录ID], [招生年度], [是否通过学校审核]) VALUES (12, 2024, 1)
INSERT [dbo].[招生目录] ([招生目录ID], [招生年度], [是否通过学校审核]) VALUES (13, 2024, 1)
INSERT [dbo].[招生目录] ([招生目录ID], [招生年度], [是否通过学校审核]) VALUES (14, 2024, 1)
INSERT [dbo].[招生目录] ([招生目录ID], [招生年度], [是否通过学校审核]) VALUES (15, 2024, 0)
INSERT [dbo].[招生目录] ([招生目录ID], [招生年度], [是否通过学校审核]) VALUES (16, 2024, 1)
INSERT [dbo].[招生目录] ([招生目录ID], [招生年度], [是否通过学校审核]) VALUES (17, 2024, 1)
INSERT [dbo].[招生目录] ([招生目录ID], [招生年度], [是否通过学校审核]) VALUES (18, 2024, 1)
INSERT [dbo].[招生目录] ([招生目录ID], [招生年度], [是否通过学校审核]) VALUES (19, 2024, 1)
INSERT [dbo].[招生目录] ([招生目录ID], [招生年度], [是否通过学校审核]) VALUES (20, 2024, 1)
INSERT [dbo].[招生目录] ([招生目录ID], [招生年度], [是否通过学校审核]) VALUES (21, 2024, 1)
INSERT [dbo].[招生目录] ([招生目录ID], [招生年度], [是否通过学校审核]) VALUES (22, 2024, 1)
GO
INSERT [dbo].[招生目录条目] ([招生目录条目ID], [年份], [学院ID], [创建时间], [更新时间], [是否招收同等学力], [学科ID]) VALUES (3, 2024, 2, CAST(N'2024-11-06T13:54:29.407' AS DateTime), CAST(N'2024-11-06T13:54:29.407' AS DateTime), 1, N'090301')
INSERT [dbo].[招生目录条目] ([招生目录条目ID], [年份], [学院ID], [创建时间], [更新时间], [是否招收同等学力], [学科ID]) VALUES (4, 2024, 3, CAST(N'2024-11-06T13:54:29.407' AS DateTime), CAST(N'2024-11-06T13:54:29.407' AS DateTime), 1, N'090703')
INSERT [dbo].[招生目录条目] ([招生目录条目ID], [年份], [学院ID], [创建时间], [更新时间], [是否招收同等学力], [学科ID]) VALUES (5, 2024, 3, CAST(N'2024-11-06T13:54:29.407' AS DateTime), CAST(N'2024-11-06T13:54:29.407' AS DateTime), 0, N'090704')
INSERT [dbo].[招生目录条目] ([招生目录条目ID], [年份], [学院ID], [创建时间], [更新时间], [是否招收同等学力], [学科ID]) VALUES (6, 2024, 4, CAST(N'2024-11-06T13:54:29.407' AS DateTime), CAST(N'2024-11-06T13:54:29.407' AS DateTime), 0, N'090704')
INSERT [dbo].[招生目录条目] ([招生目录条目ID], [年份], [学院ID], [创建时间], [更新时间], [是否招收同等学力], [学科ID]) VALUES (7, 2024, 4, CAST(N'2024-11-06T13:54:29.407' AS DateTime), CAST(N'2024-11-06T13:54:29.407' AS DateTime), 0, N'090704')
INSERT [dbo].[招生目录条目] ([招生目录条目ID], [年份], [学院ID], [创建时间], [更新时间], [是否招收同等学力], [学科ID]) VALUES (8, 2024, 4, CAST(N'2024-11-06T13:54:29.407' AS DateTime), CAST(N'2024-11-06T13:54:29.407' AS DateTime), 0, N'090704')
INSERT [dbo].[招生目录条目] ([招生目录条目ID], [年份], [学院ID], [创建时间], [更新时间], [是否招收同等学力], [学科ID]) VALUES (9, 2024, 5, CAST(N'2024-11-06T13:54:29.407' AS DateTime), CAST(N'2024-11-06T13:54:29.407' AS DateTime), 0, N'071001')
INSERT [dbo].[招生目录条目] ([招生目录条目ID], [年份], [学院ID], [创建时间], [更新时间], [是否招收同等学力], [学科ID]) VALUES (10, 2024, 5, CAST(N'2024-11-06T13:54:29.407' AS DateTime), CAST(N'2024-11-06T13:54:29.407' AS DateTime), 0, N'071001')
INSERT [dbo].[招生目录条目] ([招生目录条目ID], [年份], [学院ID], [创建时间], [更新时间], [是否招收同等学力], [学科ID]) VALUES (11, 2024, 5, CAST(N'2024-11-06T13:54:29.407' AS DateTime), CAST(N'2024-11-06T13:54:29.407' AS DateTime), 1, N'071001')
INSERT [dbo].[招生目录条目] ([招生目录条目ID], [年份], [学院ID], [创建时间], [更新时间], [是否招收同等学力], [学科ID]) VALUES (12, 2024, 5, CAST(N'2024-11-06T13:54:29.407' AS DateTime), CAST(N'2024-11-06T13:54:29.407' AS DateTime), 1, N'071001')
INSERT [dbo].[招生目录条目] ([招生目录条目ID], [年份], [学院ID], [创建时间], [更新时间], [是否招收同等学力], [学科ID]) VALUES (13, 2024, 5, CAST(N'2024-11-06T13:54:29.407' AS DateTime), CAST(N'2024-11-06T13:54:29.407' AS DateTime), 1, N'071002')
INSERT [dbo].[招生目录条目] ([招生目录条目ID], [年份], [学院ID], [创建时间], [更新时间], [是否招收同等学力], [学科ID]) VALUES (14, 2024, 5, CAST(N'2024-11-06T13:54:29.407' AS DateTime), CAST(N'2024-11-06T13:54:29.407' AS DateTime), 1, N'071002')
INSERT [dbo].[招生目录条目] ([招生目录条目ID], [年份], [学院ID], [创建时间], [更新时间], [是否招收同等学力], [学科ID]) VALUES (15, 2024, 5, CAST(N'2024-11-06T13:54:29.407' AS DateTime), CAST(N'2024-11-06T13:54:29.407' AS DateTime), 1, N'071002')
INSERT [dbo].[招生目录条目] ([招生目录条目ID], [年份], [学院ID], [创建时间], [更新时间], [是否招收同等学力], [学科ID]) VALUES (16, 2024, 6, CAST(N'2024-11-06T13:54:29.407' AS DateTime), CAST(N'2024-11-06T13:54:29.407' AS DateTime), 1, N'071010')
INSERT [dbo].[招生目录条目] ([招生目录条目ID], [年份], [学院ID], [创建时间], [更新时间], [是否招收同等学力], [学科ID]) VALUES (17, 2024, 6, CAST(N'2024-11-06T13:54:29.407' AS DateTime), CAST(N'2024-11-06T13:54:29.407' AS DateTime), 1, N'071010')
INSERT [dbo].[招生目录条目] ([招生目录条目ID], [年份], [学院ID], [创建时间], [更新时间], [是否招收同等学力], [学科ID]) VALUES (18, 2024, 7, CAST(N'2024-11-06T13:54:29.407' AS DateTime), CAST(N'2024-11-06T13:54:29.407' AS DateTime), 1, N'083200')
INSERT [dbo].[招生目录条目] ([招生目录条目ID], [年份], [学院ID], [创建时间], [更新时间], [是否招收同等学力], [学科ID]) VALUES (19, 2024, 7, CAST(N'2024-11-06T13:54:29.407' AS DateTime), CAST(N'2024-11-06T13:54:29.407' AS DateTime), 0, N'083200')
INSERT [dbo].[招生目录条目] ([招生目录条目ID], [年份], [学院ID], [创建时间], [更新时间], [是否招收同等学力], [学科ID]) VALUES (20, 2024, 7, CAST(N'2024-11-06T13:54:29.407' AS DateTime), CAST(N'2024-11-06T13:54:29.407' AS DateTime), 0, N'083200')
INSERT [dbo].[招生目录条目] ([招生目录条目ID], [年份], [学院ID], [创建时间], [更新时间], [是否招收同等学力], [学科ID]) VALUES (21, 2024, 7, CAST(N'2024-11-06T13:54:29.407' AS DateTime), CAST(N'2024-11-06T13:54:29.407' AS DateTime), 0, N'083200')
INSERT [dbo].[招生目录条目] ([招生目录条目ID], [年份], [学院ID], [创建时间], [更新时间], [是否招收同等学力], [学科ID]) VALUES (22, 2024, 8, CAST(N'2024-11-06T13:54:29.407' AS DateTime), CAST(N'2024-11-06T13:54:29.407' AS DateTime), 0, N'080200')
INSERT [dbo].[招生目录条目] ([招生目录条目ID], [年份], [学院ID], [创建时间], [更新时间], [是否招收同等学力], [学科ID]) VALUES (25, 2024, 8, CAST(N'2024-11-06T13:54:29.407' AS DateTime), CAST(N'2024-11-06T13:54:29.407' AS DateTime), 1, N'080200')
INSERT [dbo].[招生目录条目] ([招生目录条目ID], [年份], [学院ID], [创建时间], [更新时间], [是否招收同等学力], [学科ID]) VALUES (26, 2023, 9, CAST(N'2024-11-06T13:54:29.407' AS DateTime), CAST(N'2024-11-06T13:54:29.407' AS DateTime), 1, N'070503-01')
INSERT [dbo].[招生目录条目] ([招生目录条目ID], [年份], [学院ID], [创建时间], [更新时间], [是否招收同等学力], [学科ID]) VALUES (28, 2023, 4, CAST(N'2024-11-06T13:54:29.407' AS DateTime), CAST(N'2024-11-06T13:54:29.407' AS DateTime), 1, N'090301-02')
INSERT [dbo].[招生目录条目] ([招生目录条目ID], [年份], [学院ID], [创建时间], [更新时间], [是否招收同等学力], [学科ID]) VALUES (29, 2023, 4, CAST(N'2024-11-06T13:54:29.407' AS DateTime), CAST(N'2024-11-06T13:54:29.407' AS DateTime), 1, N'090703-01')
INSERT [dbo].[招生目录条目] ([招生目录条目ID], [年份], [学院ID], [创建时间], [更新时间], [是否招收同等学力], [学科ID]) VALUES (32, 2024, 4, CAST(N'2024-11-07T20:10:33.003' AS DateTime), CAST(N'2024-11-07T20:10:33.003' AS DateTime), 1, N'070503')
GO
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (1, 1)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (3, 2)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (4, 2)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (5, 3)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (6, 3)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (7, 4)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (8, 4)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (9, 5)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (10, 5)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (11, 6)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (12, 6)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (13, 7)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (14, 7)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (15, 8)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (16, 8)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (17, 9)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (18, 9)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (21, 1)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (22, 1)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (23, 2)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (24, 2)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (25, 3)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (26, 3)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (27, 4)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (28, 4)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (29, 5)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (30, 5)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (31, 5)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (32, 5)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (33, 7)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (34, 7)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (35, 8)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (36, 8)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (37, 9)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (38, 9)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (40, 6)
GO
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (3, N'初试', 248.5, CAST(N'2024-11-06T14:52:31.417' AS DateTime), CAST(N'2024-11-06T14:52:31.417' AS DateTime), 2)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (4, N'复试', 189.5, CAST(N'2024-11-06T14:52:31.417' AS DateTime), CAST(N'2024-11-06T14:52:31.417' AS DateTime), 2)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (5, N'初试', 163.5, CAST(N'2024-11-06T14:55:09.270' AS DateTime), CAST(N'2024-11-06T14:55:09.270' AS DateTime), 3)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (6, N'复试', 281.5, CAST(N'2024-11-06T14:55:09.270' AS DateTime), CAST(N'2024-11-06T14:55:09.270' AS DateTime), 3)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (7, N'初试', 176.5, CAST(N'2024-11-06T14:55:09.273' AS DateTime), CAST(N'2024-11-06T14:55:09.273' AS DateTime), 4)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (8, N'复试', 188, CAST(N'2024-11-06T14:55:09.273' AS DateTime), CAST(N'2024-11-06T14:55:09.273' AS DateTime), 4)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (9, N'初试', 171.5, CAST(N'2024-11-06T14:55:09.273' AS DateTime), CAST(N'2024-11-06T14:55:09.273' AS DateTime), 5)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (10, N'复试', 275, CAST(N'2024-11-06T14:55:09.273' AS DateTime), CAST(N'2024-11-06T14:55:09.273' AS DateTime), 5)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (11, N'初试', 173.5, CAST(N'2024-11-06T14:56:01.950' AS DateTime), CAST(N'2024-11-06T14:56:01.950' AS DateTime), 6)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (12, N'复试', 254.5, CAST(N'2024-11-06T14:56:01.950' AS DateTime), CAST(N'2024-11-06T14:56:01.950' AS DateTime), 6)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (13, N'初试', 173, CAST(N'2024-11-06T14:56:01.953' AS DateTime), CAST(N'2024-11-06T14:56:01.953' AS DateTime), 7)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (14, N'复试', 272, CAST(N'2024-11-06T14:56:01.953' AS DateTime), CAST(N'2024-11-06T14:56:01.953' AS DateTime), 7)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (15, N'初试', 23, CAST(N'2024-11-06T14:56:27.693' AS DateTime), CAST(N'2024-11-06T14:56:27.693' AS DateTime), 8)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (16, N'复试', 450, CAST(N'2024-11-06T14:56:27.693' AS DateTime), CAST(N'2024-11-06T14:56:27.693' AS DateTime), 8)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (17, N'初试', 104, CAST(N'2024-11-06T14:56:27.693' AS DateTime), CAST(N'2024-11-06T14:56:27.693' AS DateTime), 9)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (18, N'复试', 188, CAST(N'2024-11-06T14:56:27.693' AS DateTime), CAST(N'2024-11-06T14:56:27.693' AS DateTime), 9)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (19, N'初试', 8, CAST(N'2024-11-06T14:57:54.960' AS DateTime), CAST(N'2024-11-06T14:57:54.960' AS DateTime), 10)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (20, N'复试', 236, CAST(N'2024-11-06T14:57:54.960' AS DateTime), CAST(N'2024-11-06T14:57:54.960' AS DateTime), 10)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (66, N'复试', 85, CAST(N'2024-11-09T16:28:28.157' AS DateTime), CAST(N'2024-11-09T16:28:28.157' AS DateTime), 101)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (204, N'初试', 85.5, CAST(N'2024-11-09T20:56:51.647' AS DateTime), CAST(N'2024-11-09T20:56:51.647' AS DateTime), 102)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (205, N'复试', 253, CAST(N'2024-11-09T21:05:37.450' AS DateTime), CAST(N'2024-11-09T21:05:37.450' AS DateTime), 102)
GO
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (1, 1)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (2, 2)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (4, 4)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (5, 5)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (6, 6)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (7, 7)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (8, 8)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (9, 9)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (10, 10)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (11, 2)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (12, 2)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (13, 2)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (14, 2)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (15, 2)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (16, 2)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (17, 3)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (18, 3)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (19, 3)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (20, 3)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (21, 3)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (22, 3)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (23, 3)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (24, 3)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (25, 3)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (26, 3)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (27, 2)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (28, 2)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (29, 2)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (30, 2)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (31, 2)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (32, 2)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (33, 2)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (34, 2)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (35, 2)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (36, 2)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (37, 1)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (38, 1)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (39, 1)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (42, 2)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__考生__532C171206A1ACC1]    Script Date: 2024/11/10 18:16:14 ******/
ALTER TABLE [dbo].[考生] ADD UNIQUE NONCLUSTERED 
(
	[身份证号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__考生__532C17123C89DFB4]    Script Date: 2024/11/10 18:16:14 ******/
ALTER TABLE [dbo].[考生] ADD UNIQUE NONCLUSTERED 
(
	[身份证号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__考生__532C17124E137063]    Script Date: 2024/11/10 18:16:14 ******/
ALTER TABLE [dbo].[考生] ADD UNIQUE NONCLUSTERED 
(
	[身份证号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__考生__532C1712664FED36]    Script Date: 2024/11/10 18:16:14 ******/
ALTER TABLE [dbo].[考生] ADD UNIQUE NONCLUSTERED 
(
	[身份证号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[复试志愿] ADD  DEFAULT (NULL) FOR [志愿状态]
GO
ALTER TABLE [dbo].[拥有] ADD  DEFAULT ('默认值') FOR [类型]
GO
ALTER TABLE [dbo].[用户] ADD  DEFAULT (getdate()) FOR [创建时间]
GO
ALTER TABLE [dbo].[包含1]  WITH CHECK ADD FOREIGN KEY([学科ID])
REFERENCES [dbo].[学科] ([学科ID])
GO
ALTER TABLE [dbo].[包含1]  WITH CHECK ADD FOREIGN KEY([学科ID])
REFERENCES [dbo].[学科] ([学科ID])
GO
ALTER TABLE [dbo].[包含1]  WITH CHECK ADD FOREIGN KEY([学科ID])
REFERENCES [dbo].[学科] ([学科ID])
GO
ALTER TABLE [dbo].[包含1]  WITH CHECK ADD FOREIGN KEY([学科ID])
REFERENCES [dbo].[学科] ([学科ID])
GO
ALTER TABLE [dbo].[包含1]  WITH CHECK ADD FOREIGN KEY([志愿ID])
REFERENCES [dbo].[复试志愿] ([志愿ID])
GO
ALTER TABLE [dbo].[包含1]  WITH CHECK ADD FOREIGN KEY([志愿ID])
REFERENCES [dbo].[复试志愿] ([志愿ID])
GO
ALTER TABLE [dbo].[包含1]  WITH CHECK ADD FOREIGN KEY([志愿ID])
REFERENCES [dbo].[复试志愿] ([志愿ID])
GO
ALTER TABLE [dbo].[包含1]  WITH CHECK ADD FOREIGN KEY([志愿ID])
REFERENCES [dbo].[复试志愿] ([志愿ID])
GO
ALTER TABLE [dbo].[包含2]  WITH CHECK ADD FOREIGN KEY([考试科目ID])
REFERENCES [dbo].[考试科目] ([考试科目ID])
GO
ALTER TABLE [dbo].[包含2]  WITH CHECK ADD FOREIGN KEY([考试科目ID])
REFERENCES [dbo].[考试科目] ([考试科目ID])
GO
ALTER TABLE [dbo].[包含2]  WITH CHECK ADD FOREIGN KEY([考试科目ID])
REFERENCES [dbo].[考试科目] ([考试科目ID])
GO
ALTER TABLE [dbo].[包含2]  WITH CHECK ADD FOREIGN KEY([考试科目ID])
REFERENCES [dbo].[考试科目] ([考试科目ID])
GO
ALTER TABLE [dbo].[包含2]  WITH CHECK ADD FOREIGN KEY([招生目录条目ID])
REFERENCES [dbo].[招生目录条目] ([招生目录条目ID])
GO
ALTER TABLE [dbo].[包含2]  WITH CHECK ADD FOREIGN KEY([招生目录条目ID])
REFERENCES [dbo].[招生目录条目] ([招生目录条目ID])
GO
ALTER TABLE [dbo].[包含2]  WITH CHECK ADD FOREIGN KEY([招生目录条目ID])
REFERENCES [dbo].[招生目录条目] ([招生目录条目ID])
GO
ALTER TABLE [dbo].[包含2]  WITH CHECK ADD FOREIGN KEY([招生目录条目ID])
REFERENCES [dbo].[招生目录条目] ([招生目录条目ID])
GO
ALTER TABLE [dbo].[包含3]  WITH CHECK ADD FOREIGN KEY([招生目录ID])
REFERENCES [dbo].[招生目录] ([招生目录ID])
GO
ALTER TABLE [dbo].[包含3]  WITH CHECK ADD FOREIGN KEY([招生目录ID])
REFERENCES [dbo].[招生目录] ([招生目录ID])
GO
ALTER TABLE [dbo].[包含3]  WITH CHECK ADD FOREIGN KEY([招生目录ID])
REFERENCES [dbo].[招生目录] ([招生目录ID])
GO
ALTER TABLE [dbo].[包含3]  WITH CHECK ADD FOREIGN KEY([招生目录ID])
REFERENCES [dbo].[招生目录] ([招生目录ID])
GO
ALTER TABLE [dbo].[包含3]  WITH CHECK ADD  CONSTRAINT [FK__包含3__招生目录条目ID__09746778] FOREIGN KEY([招生目录条目ID])
REFERENCES [dbo].[招生目录条目] ([招生目录条目ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[包含3] CHECK CONSTRAINT [FK__包含3__招生目录条目ID__09746778]
GO
ALTER TABLE [dbo].[编制]  WITH CHECK ADD FOREIGN KEY([学院ID])
REFERENCES [dbo].[学院] ([学院ID])
GO
ALTER TABLE [dbo].[编制]  WITH CHECK ADD FOREIGN KEY([学院ID])
REFERENCES [dbo].[学院] ([学院ID])
GO
ALTER TABLE [dbo].[编制]  WITH CHECK ADD FOREIGN KEY([学院ID])
REFERENCES [dbo].[学院] ([学院ID])
GO
ALTER TABLE [dbo].[编制]  WITH CHECK ADD FOREIGN KEY([学院ID])
REFERENCES [dbo].[学院] ([学院ID])
GO
ALTER TABLE [dbo].[编制]  WITH CHECK ADD FOREIGN KEY([招生目录条目ID])
REFERENCES [dbo].[招生目录条目] ([招生目录条目ID])
GO
ALTER TABLE [dbo].[编制]  WITH CHECK ADD FOREIGN KEY([招生目录条目ID])
REFERENCES [dbo].[招生目录条目] ([招生目录条目ID])
GO
ALTER TABLE [dbo].[编制]  WITH CHECK ADD FOREIGN KEY([招生目录条目ID])
REFERENCES [dbo].[招生目录条目] ([招生目录条目ID])
GO
ALTER TABLE [dbo].[编制]  WITH CHECK ADD FOREIGN KEY([招生目录条目ID])
REFERENCES [dbo].[招生目录条目] ([招生目录条目ID])
GO
ALTER TABLE [dbo].[成绩]  WITH CHECK ADD FOREIGN KEY([考生ID])
REFERENCES [dbo].[考生] ([考生ID])
GO
ALTER TABLE [dbo].[成绩]  WITH CHECK ADD FOREIGN KEY([考生ID])
REFERENCES [dbo].[考生] ([考生ID])
GO
ALTER TABLE [dbo].[成绩]  WITH CHECK ADD FOREIGN KEY([考生ID])
REFERENCES [dbo].[考生] ([考生ID])
GO
ALTER TABLE [dbo].[成绩]  WITH CHECK ADD FOREIGN KEY([考生ID])
REFERENCES [dbo].[考生] ([考生ID])
GO
ALTER TABLE [dbo].[成绩]  WITH CHECK ADD FOREIGN KEY([考试科目ID])
REFERENCES [dbo].[考试科目] ([考试科目ID])
GO
ALTER TABLE [dbo].[成绩]  WITH CHECK ADD FOREIGN KEY([考试科目ID])
REFERENCES [dbo].[考试科目] ([考试科目ID])
GO
ALTER TABLE [dbo].[成绩]  WITH CHECK ADD FOREIGN KEY([考试科目ID])
REFERENCES [dbo].[考试科目] ([考试科目ID])
GO
ALTER TABLE [dbo].[成绩]  WITH CHECK ADD FOREIGN KEY([考试科目ID])
REFERENCES [dbo].[考试科目] ([考试科目ID])
GO
ALTER TABLE [dbo].[从属]  WITH CHECK ADD FOREIGN KEY([导师ID])
REFERENCES [dbo].[导师] ([导师ID])
GO
ALTER TABLE [dbo].[从属]  WITH CHECK ADD FOREIGN KEY([导师ID])
REFERENCES [dbo].[导师] ([导师ID])
GO
ALTER TABLE [dbo].[从属]  WITH CHECK ADD FOREIGN KEY([导师ID])
REFERENCES [dbo].[导师] ([导师ID])
GO
ALTER TABLE [dbo].[从属]  WITH CHECK ADD FOREIGN KEY([导师ID])
REFERENCES [dbo].[导师] ([导师ID])
GO
ALTER TABLE [dbo].[从属]  WITH CHECK ADD FOREIGN KEY([学科ID])
REFERENCES [dbo].[学科] ([学科ID])
GO
ALTER TABLE [dbo].[从属]  WITH CHECK ADD FOREIGN KEY([学科ID])
REFERENCES [dbo].[学科] ([学科ID])
GO
ALTER TABLE [dbo].[从属]  WITH CHECK ADD FOREIGN KEY([学科ID])
REFERENCES [dbo].[学科] ([学科ID])
GO
ALTER TABLE [dbo].[从属]  WITH CHECK ADD FOREIGN KEY([学科ID])
REFERENCES [dbo].[学科] ([学科ID])
GO
ALTER TABLE [dbo].[导师]  WITH CHECK ADD FOREIGN KEY([用户ID])
REFERENCES [dbo].[用户] ([用户ID])
GO
ALTER TABLE [dbo].[导师]  WITH CHECK ADD FOREIGN KEY([用户ID])
REFERENCES [dbo].[用户] ([用户ID])
GO
ALTER TABLE [dbo].[导师]  WITH CHECK ADD FOREIGN KEY([用户ID])
REFERENCES [dbo].[用户] ([用户ID])
GO
ALTER TABLE [dbo].[导师]  WITH CHECK ADD FOREIGN KEY([用户ID])
REFERENCES [dbo].[用户] ([用户ID])
GO
ALTER TABLE [dbo].[对应1]  WITH CHECK ADD FOREIGN KEY([导师ID])
REFERENCES [dbo].[导师] ([导师ID])
GO
ALTER TABLE [dbo].[对应1]  WITH CHECK ADD FOREIGN KEY([导师ID])
REFERENCES [dbo].[导师] ([导师ID])
GO
ALTER TABLE [dbo].[对应1]  WITH CHECK ADD FOREIGN KEY([导师ID])
REFERENCES [dbo].[导师] ([导师ID])
GO
ALTER TABLE [dbo].[对应1]  WITH CHECK ADD FOREIGN KEY([导师ID])
REFERENCES [dbo].[导师] ([导师ID])
GO
ALTER TABLE [dbo].[对应1]  WITH CHECK ADD FOREIGN KEY([用户ID])
REFERENCES [dbo].[用户] ([用户ID])
GO
ALTER TABLE [dbo].[对应1]  WITH CHECK ADD FOREIGN KEY([用户ID])
REFERENCES [dbo].[用户] ([用户ID])
GO
ALTER TABLE [dbo].[对应1]  WITH CHECK ADD FOREIGN KEY([用户ID])
REFERENCES [dbo].[用户] ([用户ID])
GO
ALTER TABLE [dbo].[对应1]  WITH CHECK ADD FOREIGN KEY([用户ID])
REFERENCES [dbo].[用户] ([用户ID])
GO
ALTER TABLE [dbo].[对应2]  WITH CHECK ADD FOREIGN KEY([考生ID])
REFERENCES [dbo].[考生] ([考生ID])
GO
ALTER TABLE [dbo].[对应2]  WITH CHECK ADD FOREIGN KEY([考生ID])
REFERENCES [dbo].[考生] ([考生ID])
GO
ALTER TABLE [dbo].[对应2]  WITH CHECK ADD FOREIGN KEY([考生ID])
REFERENCES [dbo].[考生] ([考生ID])
GO
ALTER TABLE [dbo].[对应2]  WITH CHECK ADD FOREIGN KEY([考生ID])
REFERENCES [dbo].[考生] ([考生ID])
GO
ALTER TABLE [dbo].[对应2]  WITH CHECK ADD FOREIGN KEY([用户ID])
REFERENCES [dbo].[用户] ([用户ID])
GO
ALTER TABLE [dbo].[对应2]  WITH CHECK ADD FOREIGN KEY([用户ID])
REFERENCES [dbo].[用户] ([用户ID])
GO
ALTER TABLE [dbo].[对应2]  WITH CHECK ADD FOREIGN KEY([用户ID])
REFERENCES [dbo].[用户] ([用户ID])
GO
ALTER TABLE [dbo].[对应2]  WITH CHECK ADD FOREIGN KEY([用户ID])
REFERENCES [dbo].[用户] ([用户ID])
GO
ALTER TABLE [dbo].[复试结果]  WITH CHECK ADD FOREIGN KEY([考生ID])
REFERENCES [dbo].[考生] ([考生ID])
GO
ALTER TABLE [dbo].[复试结果]  WITH CHECK ADD FOREIGN KEY([考生ID])
REFERENCES [dbo].[考生] ([考生ID])
GO
ALTER TABLE [dbo].[复试结果]  WITH CHECK ADD FOREIGN KEY([考生ID])
REFERENCES [dbo].[考生] ([考生ID])
GO
ALTER TABLE [dbo].[复试结果]  WITH CHECK ADD FOREIGN KEY([考生ID])
REFERENCES [dbo].[考生] ([考生ID])
GO
ALTER TABLE [dbo].[复试结果]  WITH CHECK ADD FOREIGN KEY([最终导师ID])
REFERENCES [dbo].[导师] ([导师ID])
GO
ALTER TABLE [dbo].[复试结果]  WITH CHECK ADD FOREIGN KEY([最终导师ID])
REFERENCES [dbo].[导师] ([导师ID])
GO
ALTER TABLE [dbo].[复试结果]  WITH CHECK ADD FOREIGN KEY([最终导师ID])
REFERENCES [dbo].[导师] ([导师ID])
GO
ALTER TABLE [dbo].[复试结果]  WITH CHECK ADD FOREIGN KEY([最终导师ID])
REFERENCES [dbo].[导师] ([导师ID])
GO
ALTER TABLE [dbo].[复试志愿]  WITH CHECK ADD FOREIGN KEY([导师ID])
REFERENCES [dbo].[导师] ([导师ID])
GO
ALTER TABLE [dbo].[复试志愿]  WITH CHECK ADD FOREIGN KEY([导师ID])
REFERENCES [dbo].[导师] ([导师ID])
GO
ALTER TABLE [dbo].[复试志愿]  WITH CHECK ADD FOREIGN KEY([导师ID])
REFERENCES [dbo].[导师] ([导师ID])
GO
ALTER TABLE [dbo].[复试志愿]  WITH CHECK ADD FOREIGN KEY([导师ID])
REFERENCES [dbo].[导师] ([导师ID])
GO
ALTER TABLE [dbo].[复试志愿]  WITH CHECK ADD FOREIGN KEY([考生ID])
REFERENCES [dbo].[考生] ([考生ID])
GO
ALTER TABLE [dbo].[复试志愿]  WITH CHECK ADD FOREIGN KEY([考生ID])
REFERENCES [dbo].[考生] ([考生ID])
GO
ALTER TABLE [dbo].[复试志愿]  WITH CHECK ADD FOREIGN KEY([考生ID])
REFERENCES [dbo].[考生] ([考生ID])
GO
ALTER TABLE [dbo].[复试志愿]  WITH CHECK ADD FOREIGN KEY([考生ID])
REFERENCES [dbo].[考生] ([考生ID])
GO
ALTER TABLE [dbo].[复试志愿]  WITH CHECK ADD FOREIGN KEY([学科ID])
REFERENCES [dbo].[学科] ([学科ID])
GO
ALTER TABLE [dbo].[复试志愿]  WITH CHECK ADD FOREIGN KEY([学科ID])
REFERENCES [dbo].[学科] ([学科ID])
GO
ALTER TABLE [dbo].[复试志愿]  WITH CHECK ADD FOREIGN KEY([学科ID])
REFERENCES [dbo].[学科] ([学科ID])
GO
ALTER TABLE [dbo].[复试志愿]  WITH CHECK ADD FOREIGN KEY([学科ID])
REFERENCES [dbo].[学科] ([学科ID])
GO
ALTER TABLE [dbo].[获得]  WITH CHECK ADD FOREIGN KEY([复试结果ID])
REFERENCES [dbo].[复试结果] ([复试结果ID])
GO
ALTER TABLE [dbo].[获得]  WITH CHECK ADD FOREIGN KEY([复试结果ID])
REFERENCES [dbo].[复试结果] ([复试结果ID])
GO
ALTER TABLE [dbo].[获得]  WITH CHECK ADD FOREIGN KEY([复试结果ID])
REFERENCES [dbo].[复试结果] ([复试结果ID])
GO
ALTER TABLE [dbo].[获得]  WITH CHECK ADD FOREIGN KEY([复试结果ID])
REFERENCES [dbo].[复试结果] ([复试结果ID])
GO
ALTER TABLE [dbo].[获得]  WITH CHECK ADD FOREIGN KEY([考生ID])
REFERENCES [dbo].[考生] ([考生ID])
GO
ALTER TABLE [dbo].[获得]  WITH CHECK ADD FOREIGN KEY([考生ID])
REFERENCES [dbo].[考生] ([考生ID])
GO
ALTER TABLE [dbo].[获得]  WITH CHECK ADD FOREIGN KEY([考生ID])
REFERENCES [dbo].[考生] ([考生ID])
GO
ALTER TABLE [dbo].[获得]  WITH CHECK ADD FOREIGN KEY([考生ID])
REFERENCES [dbo].[考生] ([考生ID])
GO
ALTER TABLE [dbo].[具有]  WITH CHECK ADD FOREIGN KEY([学科ID])
REFERENCES [dbo].[学科] ([学科ID])
GO
ALTER TABLE [dbo].[具有]  WITH CHECK ADD FOREIGN KEY([学科ID])
REFERENCES [dbo].[学科] ([学科ID])
GO
ALTER TABLE [dbo].[具有]  WITH CHECK ADD FOREIGN KEY([学科ID])
REFERENCES [dbo].[学科] ([学科ID])
GO
ALTER TABLE [dbo].[具有]  WITH CHECK ADD FOREIGN KEY([学科ID])
REFERENCES [dbo].[学科] ([学科ID])
GO
ALTER TABLE [dbo].[具有]  WITH CHECK ADD  CONSTRAINT [fk_具有_招生目录条目ID] FOREIGN KEY([招生目录条目ID])
REFERENCES [dbo].[招生目录条目] ([招生目录条目ID])
GO
ALTER TABLE [dbo].[具有] CHECK CONSTRAINT [fk_具有_招生目录条目ID]
GO
ALTER TABLE [dbo].[考生]  WITH CHECK ADD FOREIGN KEY([用户ID])
REFERENCES [dbo].[用户] ([用户ID])
GO
ALTER TABLE [dbo].[考生]  WITH CHECK ADD FOREIGN KEY([用户ID])
REFERENCES [dbo].[用户] ([用户ID])
GO
ALTER TABLE [dbo].[考生]  WITH CHECK ADD FOREIGN KEY([用户ID])
REFERENCES [dbo].[用户] ([用户ID])
GO
ALTER TABLE [dbo].[考生]  WITH CHECK ADD FOREIGN KEY([用户ID])
REFERENCES [dbo].[用户] ([用户ID])
GO
ALTER TABLE [dbo].[确定]  WITH CHECK ADD FOREIGN KEY([导师ID])
REFERENCES [dbo].[导师] ([导师ID])
GO
ALTER TABLE [dbo].[确定]  WITH CHECK ADD FOREIGN KEY([导师ID])
REFERENCES [dbo].[导师] ([导师ID])
GO
ALTER TABLE [dbo].[确定]  WITH CHECK ADD FOREIGN KEY([导师ID])
REFERENCES [dbo].[导师] ([导师ID])
GO
ALTER TABLE [dbo].[确定]  WITH CHECK ADD FOREIGN KEY([导师ID])
REFERENCES [dbo].[导师] ([导师ID])
GO
ALTER TABLE [dbo].[确定]  WITH CHECK ADD FOREIGN KEY([复试结果ID])
REFERENCES [dbo].[复试结果] ([复试结果ID])
GO
ALTER TABLE [dbo].[确定]  WITH CHECK ADD FOREIGN KEY([复试结果ID])
REFERENCES [dbo].[复试结果] ([复试结果ID])
GO
ALTER TABLE [dbo].[确定]  WITH CHECK ADD FOREIGN KEY([复试结果ID])
REFERENCES [dbo].[复试结果] ([复试结果ID])
GO
ALTER TABLE [dbo].[确定]  WITH CHECK ADD FOREIGN KEY([复试结果ID])
REFERENCES [dbo].[复试结果] ([复试结果ID])
GO
ALTER TABLE [dbo].[填报]  WITH CHECK ADD FOREIGN KEY([考生ID])
REFERENCES [dbo].[考生] ([考生ID])
GO
ALTER TABLE [dbo].[填报]  WITH CHECK ADD FOREIGN KEY([考生ID])
REFERENCES [dbo].[考生] ([考生ID])
GO
ALTER TABLE [dbo].[填报]  WITH CHECK ADD FOREIGN KEY([考生ID])
REFERENCES [dbo].[考生] ([考生ID])
GO
ALTER TABLE [dbo].[填报]  WITH CHECK ADD FOREIGN KEY([考生ID])
REFERENCES [dbo].[考生] ([考生ID])
GO
ALTER TABLE [dbo].[填报]  WITH CHECK ADD FOREIGN KEY([志愿ID])
REFERENCES [dbo].[复试志愿] ([志愿ID])
GO
ALTER TABLE [dbo].[填报]  WITH CHECK ADD FOREIGN KEY([志愿ID])
REFERENCES [dbo].[复试志愿] ([志愿ID])
GO
ALTER TABLE [dbo].[填报]  WITH CHECK ADD FOREIGN KEY([志愿ID])
REFERENCES [dbo].[复试志愿] ([志愿ID])
GO
ALTER TABLE [dbo].[填报]  WITH CHECK ADD FOREIGN KEY([志愿ID])
REFERENCES [dbo].[复试志愿] ([志愿ID])
GO
ALTER TABLE [dbo].[选择]  WITH CHECK ADD FOREIGN KEY([导师ID])
REFERENCES [dbo].[导师] ([导师ID])
GO
ALTER TABLE [dbo].[选择]  WITH CHECK ADD FOREIGN KEY([导师ID])
REFERENCES [dbo].[导师] ([导师ID])
GO
ALTER TABLE [dbo].[选择]  WITH CHECK ADD FOREIGN KEY([导师ID])
REFERENCES [dbo].[导师] ([导师ID])
GO
ALTER TABLE [dbo].[选择]  WITH CHECK ADD FOREIGN KEY([导师ID])
REFERENCES [dbo].[导师] ([导师ID])
GO
ALTER TABLE [dbo].[选择]  WITH CHECK ADD FOREIGN KEY([志愿ID])
REFERENCES [dbo].[复试志愿] ([志愿ID])
GO
ALTER TABLE [dbo].[选择]  WITH CHECK ADD FOREIGN KEY([志愿ID])
REFERENCES [dbo].[复试志愿] ([志愿ID])
GO
ALTER TABLE [dbo].[选择]  WITH CHECK ADD FOREIGN KEY([志愿ID])
REFERENCES [dbo].[复试志愿] ([志愿ID])
GO
ALTER TABLE [dbo].[选择]  WITH CHECK ADD FOREIGN KEY([志愿ID])
REFERENCES [dbo].[复试志愿] ([志愿ID])
GO
ALTER TABLE [dbo].[拥有]  WITH CHECK ADD  CONSTRAINT [FK_拥有_考生ID] FOREIGN KEY([考生ID])
REFERENCES [dbo].[考生] ([考生ID])
GO
ALTER TABLE [dbo].[拥有] CHECK CONSTRAINT [FK_拥有_考生ID]
GO
ALTER TABLE [dbo].[拥有]  WITH CHECK ADD  CONSTRAINT [FK_拥有_总成绩ID] FOREIGN KEY([总成绩ID])
REFERENCES [dbo].[总成绩] ([总成绩ID])
GO
ALTER TABLE [dbo].[拥有] CHECK CONSTRAINT [FK_拥有_总成绩ID]
GO
ALTER TABLE [dbo].[用户]  WITH CHECK ADD FOREIGN KEY([角色ID])
REFERENCES [dbo].[角色] ([角色ID])
GO
ALTER TABLE [dbo].[用户]  WITH CHECK ADD FOREIGN KEY([角色ID])
REFERENCES [dbo].[角色] ([角色ID])
GO
ALTER TABLE [dbo].[用户]  WITH CHECK ADD FOREIGN KEY([角色ID])
REFERENCES [dbo].[角色] ([角色ID])
GO
ALTER TABLE [dbo].[用户]  WITH CHECK ADD FOREIGN KEY([角色ID])
REFERENCES [dbo].[角色] ([角色ID])
GO
ALTER TABLE [dbo].[招生目录条目]  WITH CHECK ADD FOREIGN KEY([学科ID])
REFERENCES [dbo].[学科] ([学科ID])
GO
ALTER TABLE [dbo].[招生目录条目]  WITH CHECK ADD FOREIGN KEY([学科ID])
REFERENCES [dbo].[学科] ([学科ID])
GO
ALTER TABLE [dbo].[招生目录条目]  WITH CHECK ADD FOREIGN KEY([学科ID])
REFERENCES [dbo].[学科] ([学科ID])
GO
ALTER TABLE [dbo].[招生目录条目]  WITH CHECK ADD FOREIGN KEY([学科ID])
REFERENCES [dbo].[学科] ([学科ID])
GO
ALTER TABLE [dbo].[招生目录条目]  WITH CHECK ADD FOREIGN KEY([学院ID])
REFERENCES [dbo].[学院] ([学院ID])
GO
ALTER TABLE [dbo].[招生目录条目]  WITH CHECK ADD FOREIGN KEY([学院ID])
REFERENCES [dbo].[学院] ([学院ID])
GO
ALTER TABLE [dbo].[招生目录条目]  WITH CHECK ADD FOREIGN KEY([学院ID])
REFERENCES [dbo].[学院] ([学院ID])
GO
ALTER TABLE [dbo].[招生目录条目]  WITH CHECK ADD FOREIGN KEY([学院ID])
REFERENCES [dbo].[学院] ([学院ID])
GO
ALTER TABLE [dbo].[属于]  WITH CHECK ADD FOREIGN KEY([导师ID])
REFERENCES [dbo].[导师] ([导师ID])
GO
ALTER TABLE [dbo].[属于]  WITH CHECK ADD FOREIGN KEY([导师ID])
REFERENCES [dbo].[导师] ([导师ID])
GO
ALTER TABLE [dbo].[属于]  WITH CHECK ADD FOREIGN KEY([导师ID])
REFERENCES [dbo].[导师] ([导师ID])
GO
ALTER TABLE [dbo].[属于]  WITH CHECK ADD FOREIGN KEY([导师ID])
REFERENCES [dbo].[导师] ([导师ID])
GO
ALTER TABLE [dbo].[属于]  WITH CHECK ADD FOREIGN KEY([学院ID])
REFERENCES [dbo].[学院] ([学院ID])
GO
ALTER TABLE [dbo].[属于]  WITH CHECK ADD FOREIGN KEY([学院ID])
REFERENCES [dbo].[学院] ([学院ID])
GO
ALTER TABLE [dbo].[属于]  WITH CHECK ADD FOREIGN KEY([学院ID])
REFERENCES [dbo].[学院] ([学院ID])
GO
ALTER TABLE [dbo].[属于]  WITH CHECK ADD FOREIGN KEY([学院ID])
REFERENCES [dbo].[学院] ([学院ID])
GO
ALTER TABLE [dbo].[总成绩]  WITH CHECK ADD  CONSTRAINT [FK_总成绩_考生] FOREIGN KEY([考生ID])
REFERENCES [dbo].[考生] ([考生ID])
GO
ALTER TABLE [dbo].[总成绩] CHECK CONSTRAINT [FK_总成绩_考生]
GO
ALTER TABLE [dbo].[作为]  WITH CHECK ADD FOREIGN KEY([角色ID])
REFERENCES [dbo].[角色] ([角色ID])
GO
ALTER TABLE [dbo].[作为]  WITH CHECK ADD FOREIGN KEY([角色ID])
REFERENCES [dbo].[角色] ([角色ID])
GO
ALTER TABLE [dbo].[作为]  WITH CHECK ADD FOREIGN KEY([角色ID])
REFERENCES [dbo].[角色] ([角色ID])
GO
ALTER TABLE [dbo].[作为]  WITH CHECK ADD FOREIGN KEY([角色ID])
REFERENCES [dbo].[角色] ([角色ID])
GO
ALTER TABLE [dbo].[作为]  WITH CHECK ADD FOREIGN KEY([用户ID])
REFERENCES [dbo].[用户] ([用户ID])
GO
ALTER TABLE [dbo].[作为]  WITH CHECK ADD FOREIGN KEY([用户ID])
REFERENCES [dbo].[用户] ([用户ID])
GO
ALTER TABLE [dbo].[作为]  WITH CHECK ADD FOREIGN KEY([用户ID])
REFERENCES [dbo].[用户] ([用户ID])
GO
ALTER TABLE [dbo].[作为]  WITH CHECK ADD FOREIGN KEY([用户ID])
REFERENCES [dbo].[用户] ([用户ID])
GO
ALTER TABLE [dbo].[导师]  WITH CHECK ADD CHECK  (([审核状态]='未通过' OR [审核状态]='正在进行' OR [审核状态]='已通过'))
GO
ALTER TABLE [dbo].[导师]  WITH CHECK ADD CHECK  (([审核状态]='未通过' OR [审核状态]='正在进行' OR [审核状态]='已通过'))
GO
ALTER TABLE [dbo].[导师]  WITH CHECK ADD CHECK  (([审核状态]='未通过' OR [审核状态]='正在进行' OR [审核状态]='已通过'))
GO
ALTER TABLE [dbo].[导师]  WITH CHECK ADD CHECK  (([审核状态]='未通过' OR [审核状态]='正在进行' OR [审核状态]='已通过'))
GO
ALTER TABLE [dbo].[导师]  WITH CHECK ADD CHECK  (([职称]='讲师' OR [职称]='教授' OR [职称]='副教授'))
GO
ALTER TABLE [dbo].[导师]  WITH CHECK ADD CHECK  (([职称]='讲师' OR [职称]='教授' OR [职称]='副教授'))
GO
ALTER TABLE [dbo].[导师]  WITH CHECK ADD CHECK  (([职称]='讲师' OR [职称]='教授' OR [职称]='副教授'))
GO
ALTER TABLE [dbo].[导师]  WITH CHECK ADD CHECK  (([职称]='讲师' OR [职称]='教授' OR [职称]='副教授'))
GO
ALTER TABLE [dbo].[复试结果]  WITH CHECK ADD CHECK  (([录取状态]='未录取' OR [录取状态]='待审核' OR [录取状态]='已录取'))
GO
ALTER TABLE [dbo].[复试结果]  WITH CHECK ADD CHECK  (([录取状态]='未录取' OR [录取状态]='待审核' OR [录取状态]='已录取'))
GO
ALTER TABLE [dbo].[复试结果]  WITH CHECK ADD CHECK  (([录取状态]='未录取' OR [录取状态]='待审核' OR [录取状态]='已录取'))
GO
ALTER TABLE [dbo].[复试结果]  WITH CHECK ADD CHECK  (([录取状态]='未录取' OR [录取状态]='待审核' OR [录取状态]='已录取'))
GO
ALTER TABLE [dbo].[复试志愿]  WITH CHECK ADD CHECK  (([志愿顺序]=(3) OR [志愿顺序]=(2) OR [志愿顺序]=(1)))
GO
ALTER TABLE [dbo].[复试志愿]  WITH CHECK ADD CHECK  (([志愿顺序]=(3) OR [志愿顺序]=(2) OR [志愿顺序]=(1)))
GO
ALTER TABLE [dbo].[复试志愿]  WITH CHECK ADD CHECK  (([志愿顺序]=(3) OR [志愿顺序]=(2) OR [志愿顺序]=(1)))
GO
ALTER TABLE [dbo].[复试志愿]  WITH CHECK ADD CHECK  (([志愿顺序]=(3) OR [志愿顺序]=(2) OR [志愿顺序]=(1)))
GO
ALTER TABLE [dbo].[角色]  WITH CHECK ADD CHECK  (([角色权限]>=(0) AND [角色权限]<=(15)))
GO
ALTER TABLE [dbo].[角色]  WITH CHECK ADD CHECK  (([角色权限]>=(0) AND [角色权限]<=(15)))
GO
ALTER TABLE [dbo].[角色]  WITH CHECK ADD CHECK  (([角色权限]>=(0) AND [角色权限]<=(15)))
GO
ALTER TABLE [dbo].[角色]  WITH CHECK ADD CHECK  (([角色权限]>=(0) AND [角色权限]<=(15)))
GO
ALTER TABLE [dbo].[考生]  WITH CHECK ADD CHECK  (([本科毕业学校类型]='开放大学' OR [本科毕业学校类型]='成人教育学院' OR [本科毕业学校类型]='独立学院' OR [本科毕业学校类型]='专科院校' OR [本科毕业学校类型]='普通本科大学'))
GO
ALTER TABLE [dbo].[考生]  WITH CHECK ADD CHECK  (([本科毕业学校类型]='开放大学' OR [本科毕业学校类型]='成人教育学院' OR [本科毕业学校类型]='独立学院' OR [本科毕业学校类型]='专科院校' OR [本科毕业学校类型]='普通本科大学'))
GO
ALTER TABLE [dbo].[考生]  WITH CHECK ADD CHECK  (([本科毕业学校类型]='开放大学' OR [本科毕业学校类型]='成人教育学院' OR [本科毕业学校类型]='独立学院' OR [本科毕业学校类型]='专科院校' OR [本科毕业学校类型]='普通本科大学'))
GO
ALTER TABLE [dbo].[考生]  WITH CHECK ADD CHECK  (([本科毕业学校类型]='开放大学' OR [本科毕业学校类型]='成人教育学院' OR [本科毕业学校类型]='独立学院' OR [本科毕业学校类型]='专科院校' OR [本科毕业学校类型]='普通本科大学'))
GO
ALTER TABLE [dbo].[考生]  WITH CHECK ADD CHECK  (([考生类别]='非定向考生' OR [考生类别]='定向生' OR [考生类别]='同等学力' OR [考生类别]='往届生' OR [考生类别]='应届生'))
GO
ALTER TABLE [dbo].[考生]  WITH CHECK ADD CHECK  (([考生类别]='非定向考生' OR [考生类别]='定向生' OR [考生类别]='同等学力' OR [考生类别]='往届生' OR [考生类别]='应届生'))
GO
ALTER TABLE [dbo].[考生]  WITH CHECK ADD CHECK  (([考生类别]='非定向考生' OR [考生类别]='定向生' OR [考生类别]='同等学力' OR [考生类别]='往届生' OR [考生类别]='应届生'))
GO
ALTER TABLE [dbo].[考生]  WITH CHECK ADD CHECK  (([考生类别]='非定向考生' OR [考生类别]='定向生' OR [考生类别]='同等学力' OR [考生类别]='往届生' OR [考生类别]='应届生'))
GO
ALTER TABLE [dbo].[考生]  WITH CHECK ADD CHECK  (([性别]='女' OR [性别]='男'))
GO
ALTER TABLE [dbo].[考生]  WITH CHECK ADD CHECK  (([性别]='女' OR [性别]='男'))
GO
ALTER TABLE [dbo].[考生]  WITH CHECK ADD CHECK  (([性别]='女' OR [性别]='男'))
GO
ALTER TABLE [dbo].[考生]  WITH CHECK ADD CHECK  (([性别]='女' OR [性别]='男'))
GO
ALTER TABLE [dbo].[考试科目]  WITH CHECK ADD CHECK  (([类别]='复试' OR [类别]='初试'))
GO
ALTER TABLE [dbo].[考试科目]  WITH CHECK ADD CHECK  (([类别]='复试' OR [类别]='初试'))
GO
ALTER TABLE [dbo].[考试科目]  WITH CHECK ADD CHECK  (([类别]='复试' OR [类别]='初试'))
GO
ALTER TABLE [dbo].[考试科目]  WITH CHECK ADD CHECK  (([类别]='复试' OR [类别]='初试'))
GO
ALTER TABLE [dbo].[学科]  WITH CHECK ADD CHECK  (([学科等级]='二级学科' OR [学科等级]='一级学科'))
GO
ALTER TABLE [dbo].[学科]  WITH CHECK ADD CHECK  (([学科等级]='二级学科' OR [学科等级]='一级学科'))
GO
ALTER TABLE [dbo].[学科]  WITH CHECK ADD CHECK  (([学科等级]='二级学科' OR [学科等级]='一级学科'))
GO
ALTER TABLE [dbo].[学科]  WITH CHECK ADD CHECK  (([学科等级]='二级学科' OR [学科等级]='一级学科'))
GO
ALTER TABLE [dbo].[招生目录]  WITH CHECK ADD CHECK  (([招生年度]>=(1900) AND [招生年度]<=(2100)))
GO
ALTER TABLE [dbo].[招生目录]  WITH CHECK ADD CHECK  (([招生年度]>=(1900) AND [招生年度]<=(2100)))
GO
ALTER TABLE [dbo].[招生目录]  WITH CHECK ADD CHECK  (([招生年度]>=(1900) AND [招生年度]<=(2100)))
GO
ALTER TABLE [dbo].[招生目录]  WITH CHECK ADD CHECK  (([招生年度]>=(1900) AND [招生年度]<=(2100)))
GO
ALTER TABLE [dbo].[招生目录条目]  WITH CHECK ADD CHECK  (([年份]>=(1900) AND [年份]<=(2100)))
GO
ALTER TABLE [dbo].[招生目录条目]  WITH CHECK ADD CHECK  (([年份]>=(1900) AND [年份]<=(2100)))
GO
ALTER TABLE [dbo].[招生目录条目]  WITH CHECK ADD CHECK  (([年份]>=(1900) AND [年份]<=(2100)))
GO
ALTER TABLE [dbo].[招生目录条目]  WITH CHECK ADD CHECK  (([年份]>=(1900) AND [年份]<=(2100)))
GO
/****** Object:  StoredProcedure [dbo].[sp_导师操作]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_导师操作]
    @操作类型 NVARCHAR(20),         -- 操作类型，'更新简介' 或 '确认学生' 或 '查看选择结果'
    @导师ID INT,                     -- 导师ID
    @简介 VARCHAR(1000) = NULL,      -- 导师简介，更新简介时使用
    @考生ID INT = NULL               -- 考生ID，确认选择时使用
AS
BEGIN
    -- 判断操作类型
    IF @操作类型 = '更新简介'
    BEGIN
        -- 更新导师简介
        UPDATE 导师
        SET 简介 = @简介,
            更新时间 = GETDATE()
        WHERE 导师ID = @导师ID;
        
        PRINT '导师简介已更新';
    END

    ELSE IF @操作类型 = '确认学生'
    BEGIN
        -- 确认选择的学生，将复试志愿的志愿ID插入到选择表中
        IF EXISTS (SELECT 1 FROM 复试志愿 WHERE 导师ID = @导师ID AND 考生ID = @考生ID)
        BEGIN
            INSERT INTO 选择 (志愿ID, 导师ID)
            SELECT 志愿ID, 导师ID 
            FROM 复试志愿
            WHERE 导师ID = @导师ID AND 考生ID = @考生ID;
            
            PRINT '学生已确认选择';
        END
        ELSE
        BEGIN
            PRINT '该学生未选择此导师为志愿';
        END
    END

    ELSE IF @操作类型 = '查看选择结果'
    BEGIN
        -- 查看导师的所有确认选择结果，包括考生信息和录取状态
        SELECT r.志愿ID, 
               c.考生ID, 
               c.性别, 
               c.生源地, 
               r.志愿顺序, 
               fr.录取状态, 
               fr.综合评价 
        FROM 复试志愿 r
        JOIN 考生 c ON r.考生ID = c.考生ID
        LEFT JOIN 复试结果 fr ON fr.考生ID = c.考生ID AND fr.最终导师ID = @导师ID
        WHERE r.导师ID = @导师ID;
    END
    ELSE
    BEGIN
        PRINT '无效的操作类型';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_监督成员]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_监督成员]
    @监督成员ID INT,        -- 当前用户ID，确保具有监督成员权限
    @考生ID INT              -- 考生ID，用于查看特定考生的过程
AS
BEGIN
    -- 检查用户是否为监督成员
    DECLARE @角色名称 VARCHAR(20);

    -- 获取当前用户的角色名称
    SELECT @角色名称 = 角色名称
    FROM 作为
    JOIN 角色 ON 作为.角色ID = 角色.角色ID
    WHERE 作为.用户ID = @监督成员ID;

    -- 确认用户角色为监督成员后执行操作
    IF @角色名称 = '监督成员'
    BEGIN
        -- 查询考生的复试和录取信息全过程
        SELECT 
            考生.考生ID, 
            考生.考生类别,
            复试志愿.导师ID,  
            复试志愿.志愿顺序, 
            复试志愿.是否接受方向调整, 
            复试结果.录取状态, 
            复试结果.综合评价,
            复试结果.更新时间 AS 最后更新时间
        FROM 考生
        LEFT JOIN 复试志愿 ON 考生.考生ID = 复试志愿.考生ID
        LEFT JOIN 导师 ON 复试志愿.导师ID = 导师.导师ID
        LEFT JOIN 复试结果 ON 考生.考生ID = 复试结果.考生ID
        WHERE 考生.考生ID = @考生ID;

        PRINT '考生选择全过程已显示';
    END
    ELSE
    BEGIN
        -- 如果用户角色不是监督成员，返回错误信息
        PRINT '权限不足，只有监督成员可以执行此操作';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_考生业务处理]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_考生业务处理]
    @考生ID INT,                   -- 考生ID
    @业务类型 VARCHAR(50),          -- 业务类型: '填报志愿' 或 '查看录取结果'
	@志愿ID INT,
    @导师ID INT = NULL,             -- 志愿导师ID (仅在填报志愿时使用)
    @学科ID VARCHAR(50) = NULL,     -- 所报学科ID (仅在填报志愿时使用)
    @志愿顺序 INT = NULL,           -- 志愿顺序 (仅在填报志愿时使用)
    @是否接受方向调整 BIT = NULL    -- 是否接受方向调整 (仅在填报志愿时使用)
AS
BEGIN
    -- 判断业务类型
    IF @业务类型 = '填报志愿'
    BEGIN
        -- 检查考生是否已提交该志愿信息，避免重复提交
        IF EXISTS (SELECT 1 FROM 复试志愿 WHERE 考生ID = @考生ID AND 导师ID = @导师ID)
        BEGIN
            PRINT '已提交志愿信息，无法重复填报';
            RETURN;
        END

        -- 插入考生志愿信息
         -- 插入考生志愿信息
        INSERT INTO 复试志愿 (志愿ID, 导师ID, 考生ID,学科ID, 志愿顺序, 是否接受方向调整, 创建时间, 更新时间)
        VALUES (@志愿ID,@导师ID, @考生ID, @学科ID, @志愿顺序, @是否接受方向调整, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


        PRINT '志愿信息已成功提交';
    END
    ELSE IF @业务类型 = '查看录取结果'
    BEGIN
        -- 查询考生的复试和录取结果
        SELECT 
            考生.考生ID AS 考生ID,
            复试志愿.导师ID, 
            导师.导师ID AS 导师ID, 
            复试志愿.学科ID,
            复试志愿.志愿顺序,
            复试结果.录取状态, 
            复试结果.综合评价, 
            复试结果.更新时间 AS 录取更新时间
        FROM 考生
        LEFT JOIN 复试志愿 ON 考生.考生ID = 复试志愿.考生ID
        LEFT JOIN 导师 ON 复试志愿.导师ID = 导师.导师ID
        LEFT JOIN 复试结果 ON 考生.考生ID = 复试结果.考生ID
        WHERE 考生.考生ID = @考生ID;

        PRINT '录取结果已显示';
    END
    ELSE
    BEGIN
        -- 错误处理：无效的业务类型
        PRINT '无效的业务类型，请指定 "填报志愿" 或 "查看录取结果"';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_确定学科研究方向]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_确定学科研究方向]
    @用户ID INT,                     -- 当前用户ID，输入参数
    @学科ID VARCHAR(50),              -- 学科ID，修改为VARCHAR类型
    @研究方向名称 VARCHAR(100),      -- 新的研究方向名称，输入参数
    @描述 VARCHAR(500)               -- 研究方向的描述，输入参数
AS
BEGIN
    -- 声明角色名称变量
    DECLARE @角色名称 VARCHAR(20);
    
    -- 获取当前用户的角色名称
    SELECT @角色名称 = 角色名称
    FROM 作为
    JOIN 角色 ON 作为.角色ID = 角色.角色ID
    WHERE 作为.用户ID = @用户ID;

    -- 判断当前用户是否是学科负责人
    IF @角色名称 = '学科负责人'
    BEGIN
        -- 如果是学科负责人，则进行学科研究方向的更新操作
        IF EXISTS (SELECT 1 FROM 学科 WHERE 学科ID = @学科ID)
        BEGIN
            -- 如果该学科存在，更新学科研究方向
            UPDATE 学科
            SET 学科研究方向 = @研究方向名称, 
                学科概述 = @描述,         -- 也可以更新学科概述或其他字段
                更新时间 = CURRENT_TIMESTAMP
            WHERE 学科ID = @学科ID;
        END
        ELSE
        BEGIN
            -- 如果该学科ID不存在，则返回错误信息
            PRINT '该学科ID不存在，请检查学科ID';
        END
    END
    ELSE
    BEGIN
        -- 如果不是学科负责人，则返回权限不足的提示
        PRINT '权限不足，只有学科负责人可以执行此操作';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_审议考生选择结果]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_审议考生选择结果]
    @主管领导ID INT,          -- 当前用户ID，确保具有主管领导权限
    @考生ID INT,                -- 考生ID
    @复试结果ID INT,            -- 复试结果ID，用于指定审核记录
    @审核状态 VARCHAR(50),      -- 审核状态，例如 '已确认' 或 '未通过'
    @审核意见 NVARCHAR(200) = NULL  -- 审核意见，可选字段，提供审核说明
AS
BEGIN
    -- 检查用户是否为研究生主管领导
    DECLARE @角色名称 VARCHAR(20);

    -- 获取当前用户的角色名称
    SELECT @角色名称 = 角色名称
    FROM 作为
    JOIN 角色 ON 作为.角色ID = 角色.角色ID
    WHERE 作为.用户ID = @主管领导ID;

    -- 确认用户角色为研究生主管领导后执行操作
    IF @角色名称 = '研究生主管领导'
    BEGIN
        -- 更新复试结果，设置审核状态和审核意见
        UPDATE 复试结果
        SET 录取状态 = @审核状态, 
            综合评价 = @审核意见,
            更新时间 = CURRENT_TIMESTAMP
        WHERE 考生ID = @考生ID 
          AND 复试结果ID = @复试结果ID;

        -- 若审核通过，则将最终状态设置为“已录取”，否则视情况修改为其他状态
        IF @审核状态 = '已录取'
        BEGIN
            PRINT '复试审核已确认，录取状态已更新为已录取。';
        END
        ELSE
        BEGIN
            PRINT '复试审核未通过，已记录审核意见。';
        END
    END
    ELSE
    BEGIN
        -- 如果用户角色不是研究生主管领导，返回错误信息
        PRINT '权限不足，只有研究生主管领导可以执行此操作';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_推动导师学生志愿选择过程]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_推动导师学生志愿选择过程]
    @用户ID INT,  -- 当前用户ID，输入参数
    @复试结果ID INT  -- 复试结果ID，指定需要更新的复试结果
AS
BEGIN
    -- 检查用户是否为学科秘书
    DECLARE @角色名称 VARCHAR(20);

    -- 获取当前用户的角色名称
    SELECT @角色名称 = 角色名称
    FROM 作为
    JOIN 角色 ON 作为.角色ID = 角色.角色ID
    WHERE 作为.用户ID = @用户ID;

    -- 如果角色是学科秘书，则执行更新操作
    IF @角色名称 = '学科秘书'
    BEGIN
        -- 更新复试结果状态为待确认
        UPDATE 复试结果
        SET 待确认=1,  -- 将录取状态从其他状态改为待确认
            更新时间 = CURRENT_TIMESTAMP  -- 更新时间为当前时间
        WHERE 复试结果ID = @复试结果ID
            AND 待确认 IS NULL;  -- 只更新状态为 NULL 的记录
    END
    ELSE
    BEGIN
        -- 如果不是学科秘书，返回错误信息
        PRINT '权限不足，只有学科秘书可以执行此操作';
    END
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_研究生管理秘书]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_研究生管理秘书]
    @用户ID INT,  -- 当前用户ID
    @考生ID INT,  -- 考生ID
	@考试地点 VARCHAR(50),
	@科目名称 VARCHAR(50),
	@复试志愿ID INT,
    @考试科目ID INT,  -- 考试科目ID（用于录入初试信息）
    @初试成绩 DECIMAL(10, 2),  -- 初试成绩
	@复试成绩 DECIMAL(10, 2),  -- 复试成绩
    @导师ID INT,  -- 导师ID（用于录入复试信息）
    @学科ID VARCHAR(50),  -- 学科ID（用于录入复试信息）
    @志愿顺序 INT,  -- 复试志愿顺序
    @是否接受方向调整 BIT,  -- 是否接受方向调整
    @复试结果ID INT = NULL,  -- 复试结果ID（可选，若有复试结果，则进行审核和发布）
    @审核状态 VARCHAR(50) = '待确认',  -- 默认审核状态，若复试结果已确认则可更新
    @业务类型 VARCHAR(50)  -- 业务类型：'录入初试信息' 或 '录入复试信息'
AS
BEGIN
    -- 检查用户是否为研究生管理秘书
    DECLARE @角色名称 VARCHAR(20);

    -- 获取当前用户的角色名称
    SELECT @角色名称 = 角色名称
    FROM 作为
    JOIN 角色 ON 作为.角色ID = 角色.角色ID
    WHERE 作为.用户ID = @用户ID;

    -- 如果角色是研究生管理秘书，则执行操作
    IF @角色名称 = '研究生管理秘书'
    BEGIN
        -- 根据业务类型判断执行不同的操作
        IF @业务类型 = '录入初试信息'
        BEGIN
            -- 1. 录入考生初试信息
            

            -- 2. 更新考试科目的类别为 '初试'
            INSERT INTO 考试科目 (考试科目ID, 类别, 名称, 考试时间, 考试地点)
            VALUES (@考试科目ID, '初试', @科目名称, CURRENT_TIMESTAMP, @考试地点);
			INSERT INTO 成绩 (考生ID, 考试科目ID, 数值)
            VALUES (@考生ID, @考试科目ID, @初试成绩);

            PRINT '初试信息录入成功';

        END
        ELSE IF @业务类型 = '录入复试信息'
        BEGIN
            -- 1. 录入考生复试信息
			

            -- 2. 更新考试科目的类别为 '初试'
            INSERT INTO 考试科目 (考试科目ID, 类别, 名称, 考试时间, 考试地点)
            VALUES (@考试科目ID, '复试', @科目名称, CURRENT_TIMESTAMP, @考试地点);
			INSERT INTO 成绩 (考生ID, 考试科目ID, 数值)
            VALUES (@考生ID, @考试科目ID, @复试成绩);
            INSERT INTO 复试志愿 (志愿ID,考生ID, 导师ID, 学科ID, 志愿顺序, 是否接受方向调整, 更新时间, 创建时间)
            VALUES (@复试志愿ID,@考生ID, @导师ID, @学科ID, @志愿顺序, @是否接受方向调整, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

            PRINT '复试信息录入成功';
        END

        -- 3. 收集并审核复试信息（如果复试结果ID不为NULL，进行审核）
        IF @复试结果ID IS NOT NULL
        BEGIN
            -- 获取并审核复试结果
            UPDATE 复试结果
            SET 录取状态 = @审核状态, 
                更新时间 = CURRENT_TIMESTAMP
            WHERE 复试结果ID = @复试结果ID
              AND 录取状态 = '待确认';
        END;

        -- 4. 发布录取公示结果（如果复试结果已确认）
        IF @审核状态 = '已确认'
        BEGIN
            UPDATE 复试结果
            SET 录取状态 = '已录取', 
                更新时间 = CURRENT_TIMESTAMP
            WHERE 复试结果ID = @复试结果ID
              AND 录取状态 = '待审核';

            -- 可选择向外部系统或相关人员发布录取信息
            PRINT '录取公示已发布';
        END;

        PRINT '操作已成功完成';
    END
    ELSE
    BEGIN
        -- 如果用户角色不是研究生管理秘书，返回错误信息
        PRINT '权限不足，只有研究生管理秘书可以执行此操作';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_用户注册]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_用户注册] 
    @用户名 NVARCHAR(20),
    @角色ID INT,
    @邮箱 NVARCHAR(50),
    @手机号 NVARCHAR(50),
    @姓名 NVARCHAR(20),
    @密码 NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @用户ID INT;

    -- 插入用户信息到用户表
    INSERT INTO 用户 (用户名, 创建时间, 角色ID, 邮箱, 手机号, 姓名, 密码)
    VALUES (@用户名, GETDATE(), @角色ID, @邮箱, @手机号, @姓名, @密码);

    -- 获取新插入用户的用户ID
    SET @用户ID = SCOPE_IDENTITY();

    -- 插入角色和用户的关系到作为表
    INSERT INTO 作为 (用户ID, 角色ID)
    VALUES (@用户ID, @角色ID);

END;
GO
/****** Object:  Trigger [dbo].[trg_AfterInsert_成绩]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create TRIGGER [dbo].[trg_AfterInsert_成绩]
ON [education].[dbo].[成绩]
AFTER INSERT
AS
BEGIN
    DECLARE @考生ID INT;
    DECLARE @考试科目ID INT;
    DECLARE @数值 DECIMAL(10, 2);
    DECLARE @类别 VARCHAR(50);
    DECLARE @总成绩ID INT;

    -- 获取插入的数据
    SELECT @考生ID = 考生ID, @考试科目ID = 考试科目ID, @数值 = 数值
    FROM INSERTED;

    -- 获取考试科目类别
    SELECT @类别 = 类别
    FROM [education].[dbo].[考试科目]
    WHERE 考试科目ID = @考试科目ID;

    -- 获取或创建总成绩记录
    SELECT @总成绩ID = 总成绩ID
    FROM [education].[dbo].[总成绩]
    WHERE 考生ID = @考生ID AND 类别 = @类别;

    IF @总成绩ID IS NULL
    BEGIN
        SET @总成绩ID = CASE WHEN @类别 = '初试' THEN @考生ID * 2 ELSE @考生ID * 2 + 1 END;
        INSERT INTO [education].[dbo].[总成绩] (总成绩ID, 考生ID, 类别, 总分数值, 创建时间, 更新时间)
        VALUES (@总成绩ID, @考生ID, @类别, @数值, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
    END
    ELSE
    BEGIN
        -- 更新总成绩分数
        UPDATE [education].[dbo].[总成绩]
        SET 总分数值 = (SELECT SUM(数值) FROM [education].[dbo].[成绩]
                        WHERE 考生ID = @考生ID AND 考试科目ID IN (SELECT 考试科目ID FROM [education].[dbo].[考试科目] WHERE 类别 = @类别))
        WHERE 总成绩ID = @总成绩ID;
    END
END;
GO
ALTER TABLE [dbo].[成绩] ENABLE TRIGGER [trg_AfterInsert_成绩]
GO
/****** Object:  Trigger [dbo].[trg_AfterUpdate_成绩]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_AfterUpdate_成绩]
ON [education].[dbo].[成绩]
AFTER UPDATE
AS
BEGIN
    -- 更新 初试 总成绩
    UPDATE [education].[dbo].[总成绩]
    SET [总分数值] = ISNULL(初试总分, 0)
    FROM [education].[dbo].[总成绩] AS t
    INNER JOIN [education].[dbo].[拥有] AS h
        ON t.[总成绩ID] = h.[总成绩ID]
    INNER JOIN (
        -- 计算初试总分
        SELECT c.[考生ID], SUM(c.[数值]) AS 初试总分
        FROM [education].[dbo].[成绩] AS c
        INNER JOIN [education].[dbo].[考试科目] AS k
            ON c.[考试科目ID] = k.[考试科目ID]
        WHERE k.[类别] = '初试'
        GROUP BY c.[考生ID]
    ) AS 初试分数
        ON h.[考生ID] = 初试分数.[考生ID]
    WHERE t.[类别] = '初试';

    -- 更新 复试 总成绩
    UPDATE [education].[dbo].[总成绩]
    SET [总分数值] = ISNULL(复试总分, 0)
    FROM [education].[dbo].[总成绩] AS t
    INNER JOIN [education].[dbo].[拥有] AS h
        ON t.[总成绩ID] = h.[总成绩ID]
    INNER JOIN (
        -- 计算复试总分
        SELECT c.[考生ID], SUM(c.[数值]) AS 复试总分
        FROM [education].[dbo].[成绩] AS c
        INNER JOIN [education].[dbo].[考试科目] AS k
            ON c.[考试科目ID] = k.[考试科目ID]
        WHERE k.[类别] = '复试'
        GROUP BY c.[考生ID]
    ) AS 复试分数
        ON h.[考生ID] = 复试分数.[考生ID]
    WHERE t.[类别] = '复试';
END;
GO
ALTER TABLE [dbo].[成绩] ENABLE TRIGGER [trg_AfterUpdate_成绩]
GO
/****** Object:  Trigger [dbo].[trg_After_Insert_导师]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 创建触发器：当导师表插入数据时，自动插入对应1、用户和属于表的记录
CREATE TRIGGER [dbo].[trg_After_Insert_导师]
ON [education].[dbo].[导师]
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @导师ID INT, @用户ID INT, @学院ID INT;

    -- 获取插入的导师ID
    SELECT @导师ID = [导师ID], @用户ID=[用户ID],@学院ID =[学院ID]
	FROM INSERTED;

    -- 假设用户ID和学院ID是根据某些逻辑生成的
    -- 向用户表插入一条记录
INSERT INTO [education].[dbo].[用户] ([用户ID],[用户名],[创建时间], [角色ID], [密码])
    VALUES (@用户ID,'@导师ID',GETDATE(), 2, '123456');

	    INSERT INTO [education].[dbo].[导师] ([导师ID], [用户ID], [学院ID])
    VALUES (@导师ID, @用户ID, @学院ID);

    -- 向对应1表插入一条记录，关联导师ID和用户ID
    INSERT INTO [education].[dbo].[对应1] ([导师ID], [用户ID])
    VALUES (@导师ID, @用户ID);

    INSERT INTO [education].[dbo].[属于] ([导师ID], [学院ID])
    VALUES (@导师ID, @学院ID);
END;
GO
ALTER TABLE [dbo].[导师] ENABLE TRIGGER [trg_After_Insert_导师]
GO
/****** Object:  Trigger [dbo].[trg_InsteadOf_Delete_导师]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_InsteadOf_Delete_导师]
ON [education].[dbo].[导师]
INSTEAD OF DELETE
AS
BEGIN
    -- 1. 删除 填报 表中与被删除导师相关的记录
    DELETE FROM [education].[dbo].[填报]
    WHERE [志愿ID] IN (SELECT [志愿ID] FROM [education].[dbo].[复试志愿]
                             WHERE [导师ID] IN (SELECT [导师ID] FROM DELETED));

    -- 2. 删除 确定 表中与被删除导师相关的记录
    DELETE FROM [education].[dbo].[确定]
    WHERE [导师ID] IN (SELECT [导师ID] FROM DELETED);

    -- 3. 删除 对应1 表中与被删除导师相关的记录
    DELETE FROM [education].[dbo].[对应1]
    WHERE [导师ID] IN (SELECT [导师ID] FROM DELETED);

    -- 4. 删除 从属 表中与被删除导师相关的记录
    DELETE FROM [education].[dbo].[从属]
    WHERE [导师ID] IN (SELECT [导师ID] FROM DELETED);

    -- 5. 删除 属于 表中与被删除导师相关的记录
    DELETE FROM [education].[dbo].[属于]
    WHERE [导师ID] IN (SELECT [导师ID] FROM DELETED);
	    -- 9. 删除 获得 表中与被删除导师相关的记录
    DELETE FROM [education].[dbo].[获得]
    WHERE [复试结果ID] IN (SELECT [复试结果ID] FROM [education].[dbo].[复试结果]
                             WHERE [最终导师ID] IN (SELECT [导师ID] FROM DELETED));

    -- 6. 删除 选择 表中与被删除导师相关的记录
    DELETE FROM [education].[dbo].[选择]
    WHERE [导师ID] IN (SELECT [导师ID] FROM DELETED);

    -- 7. 删除 复试结果 表中与被删除导师相关的记录
    DELETE FROM [education].[dbo].[复试结果]
    WHERE [最终导师ID] IN (SELECT [导师ID] FROM DELETED);

    -- 8. 删除 复试志愿 表中与被删除导师相关的记录
    DELETE FROM [education].[dbo].[复试志愿]
    WHERE [导师ID] IN (SELECT [导师ID] FROM DELETED);



    -- 10. 最后删除 导师 表中的记录
    DELETE FROM [education].[dbo].[导师]
    WHERE [导师ID] IN (SELECT [导师ID] FROM DELETED);
END;
GO
ALTER TABLE [dbo].[导师] ENABLE TRIGGER [trg_InsteadOf_Delete_导师]
GO
/****** Object:  Trigger [dbo].[trg_After_Insert_复试结果]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 创建触发器：当在 复试结果 表中插入记录时，自动插入 获得 和 确认 表中的数据
CREATE TRIGGER [dbo].[trg_After_Insert_复试结果]
ON [education].[dbo].[复试结果]
AFTER INSERT
AS
BEGIN
    DECLARE @考生ID INT, @复试结果ID INT,@最终导师ID INT;

    -- 获取插入的数据
    SELECT @考生ID = [考生ID], @复试结果ID = [复试结果ID],@最终导师ID=[最终导师ID]
    FROM INSERTED;

    -- 向 获得 表中插入相应的记录
    INSERT INTO [education].[dbo].[获得] ([考生ID], [复试结果ID])
    VALUES (@考生ID, @复试结果ID);  -- 这里填入适当的字段值

    -- 向 确认 表中插入相应的记录
    INSERT INTO [education].[dbo].[确定] ([复试结果ID], [导师ID])
    VALUES ( @复试结果ID, @最终导师ID);  -- 这里填入适当的字段值

END;
GO
ALTER TABLE [dbo].[复试结果] ENABLE TRIGGER [trg_After_Insert_复试结果]
GO
/****** Object:  Trigger [dbo].[trg_After_Insert_复试志愿]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 插入触发器
CREATE TRIGGER [dbo].[trg_After_Insert_复试志愿]
ON [education].[dbo].[复试志愿]
AFTER INSERT
AS
BEGIN
    DECLARE @志愿ID INT, @考生ID INT, @学科ID VARCHAR(20),@导师ID INT;

    -- 获取插入的数据
    SELECT @志愿ID = [志愿ID], @考生ID = [考生ID], @学科ID = [学科ID],@导师ID = [导师ID]
	FROM INSERTED;

    -- 在 填报 表中插入对应的记录
    INSERT INTO [education].[dbo].[填报] ([考生ID], [志愿ID])
    VALUES (@考生ID, @志愿ID);

	INSERT INTO [education].[dbo].[选择] ([导师ID], [志愿ID])
    VALUES (@导师ID, @志愿ID);

    -- 在 包含1 表中插入对应的记录
    INSERT INTO [education].[dbo].[包含1] ([志愿ID], [学科ID])
    VALUES (@志愿ID, @学科ID);
END;
GO
ALTER TABLE [dbo].[复试志愿] ENABLE TRIGGER [trg_After_Insert_复试志愿]
GO
/****** Object:  Trigger [dbo].[trg_InsteadOf_Delete_复试志愿]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_InsteadOf_Delete_复试志愿]
ON [education].[dbo].[复试志愿]
INSTEAD OF DELETE
AS
BEGIN
    -- 删除 包含1 表中的记录
    DELETE FROM [education].[dbo].[包含1]
    WHERE [志愿ID] IN (SELECT [志愿ID] FROM DELETED);

    -- 删除 选择 表中的记录
    DELETE FROM [education].[dbo].[选择]
    WHERE [志愿ID] IN (SELECT [志愿ID] FROM DELETED);

    -- 删除 填报 表中的记录
    DELETE FROM [education].[dbo].[填报]
    WHERE [志愿ID] IN (SELECT [志愿ID] FROM DELETED);

    -- 最后删除 复试志愿 表中的记录
    DELETE FROM [education].[dbo].[复试志愿]
    WHERE [志愿ID] IN (SELECT [志愿ID] FROM DELETED);
END;
GO
ALTER TABLE [dbo].[复试志愿] ENABLE TRIGGER [trg_InsteadOf_Delete_复试志愿]
GO
/****** Object:  Trigger [dbo].[trg_InsteadOf_Delete_考生]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_InsteadOf_Delete_考生]
ON [education].[dbo].[考生]
INSTEAD OF DELETE
AS
BEGIN
   DELETE FROM [education].[dbo].[包含1]
    WHERE [志愿ID] IN (SELECT [志愿ID] FROM [education].[dbo].[复试志愿]
                        WHERE [考生ID] IN (SELECT [考生ID] FROM DELETED));
   DELETE FROM [education].[dbo].[选择]
    WHERE [志愿ID] IN (SELECT [志愿ID] FROM [education].[dbo].[复试志愿]
                        WHERE [考生ID] IN (SELECT [考生ID] FROM DELETED));
	    -- 3. 删除 确认 表中与被删除考生相关的记录（考生-复试结果关系）
    DELETE FROM [education].[dbo].[确定]
    WHERE [复试结果ID] IN (SELECT [复试结果ID] FROM [education].[dbo].[复试结果]
                        WHERE [考生ID] IN (SELECT [考生ID] FROM DELETED))
	
    -- 6. 删除 填报 表中与被删除考生相关的记录
    DELETE FROM [education].[dbo].[填报]
	WHERE [考生ID] IN (SELECT [考生ID] FROM DELETED);
	    -- 9. 删除 对应2 表中与被删除考生相关的记录
    DELETE FROM [education].[dbo].[对应2]
    WHERE [考生ID] IN (SELECT [考生ID] FROM DELETED);
    -- 5. 删除 拥有 表中与被删除考生相关的记录
    DELETE FROM [education].[dbo].[拥有]
    WHERE [考生ID] IN (SELECT [考生ID] FROM DELETED);

    -- 2. 删除 复试志愿 表中与被删除考生相关的记录
    DELETE FROM [education].[dbo].[复试志愿]
    WHERE [考生ID] IN (SELECT [考生ID] FROM DELETED);


 -- 7. 删除 获得 表中与被删除考生相关的记录
DELETE FROM [education].[dbo].[获得]
    WHERE [考生ID] IN (SELECT [考生ID] FROM DELETED);

    -- 4. 删除 复试结果 表中与被删除考生相关的记录
    DELETE FROM [education].[dbo].[复试结果]
    WHERE [考生ID] IN (SELECT [考生ID] FROM DELETED);

    -- 8. 删除 成绩 表中与被删除考生相关的记录
    DELETE FROM [education].[dbo].[成绩]
    WHERE [考生ID] IN (SELECT [考生ID] FROM DELETED);

    -- 10. 删除 总成绩 表中与被删除考生相关的记录
    DELETE FROM [education].[dbo].[总成绩]
    WHERE [考生ID] IN (SELECT [考生ID] FROM DELETED);

    -- 最后删除 考生 表中的记录
    DELETE FROM [education].[dbo].[考生]
	WHERE [用户ID] IN (SELECT [用户ID] FROM DELETED)
	   OR [考生ID] IN (SELECT [考生ID] FROM DELETED);
END;
GO
ALTER TABLE [dbo].[考生] ENABLE TRIGGER [trg_InsteadOf_Delete_考生]
GO
/****** Object:  Trigger [dbo].[trg_InsteadOf_Insert_考生]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_InsteadOf_Insert_考生]
ON [education].[dbo].[考生]
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @考生ID INT, @用户ID INT;
    DECLARE @用户名 VARCHAR(50);

    -- 获取插入的考生数据
    SELECT @考生ID = [考生ID], @用户ID = [用户ID]
    FROM INSERTED;

	INSERT INTO [education].[dbo].[用户] ([用户ID],[用户名],[创建时间], [角色ID], [密码])
    VALUES (@用户ID,@考生ID,GETDATE(), 3, '123456');

    -- 在考生表中插入数据
    INSERT INTO [education].[dbo].[考生] ([考生ID], [用户ID])
    VALUES (@考生ID, @用户ID);

    -- 在对应2表中插入相应的考生记录
    INSERT INTO [education].[dbo].[对应2] ([考生ID], [用户ID])
    VALUES (@考生ID, @用户ID);
END;
GO
ALTER TABLE [dbo].[考生] ENABLE TRIGGER [trg_InsteadOf_Insert_考生]
GO
/****** Object:  Trigger [dbo].[trg_InsteadOf_Delete_考试科目]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_InsteadOf_Delete_考试科目]
ON [education].[dbo].[考试科目]
INSTEAD OF DELETE
AS
BEGIN
    -- 1. 删除 成绩 表中与被删除考试科目相关的记录
    DELETE FROM [education].[dbo].[成绩]
    WHERE [考试科目ID] IN (SELECT [考试科目ID] FROM DELETED);

    -- 2. 删除 包含2 表中与被删除考试科目相关的记录
    DELETE FROM [education].[dbo].[包含2]
    WHERE [考试科目ID] IN (SELECT [考试科目ID] FROM DELETED);

    -- 3. 最后删除 考试科目 表中的记录
    DELETE FROM [education].[dbo].[考试科目]
    WHERE [考试科目ID] IN (SELECT [考试科目ID] FROM DELETED);
END;
GO
ALTER TABLE [dbo].[考试科目] ENABLE TRIGGER [trg_InsteadOf_Delete_考试科目]
GO
/****** Object:  Trigger [dbo].[trg_InsteadOf_Delete_学科]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_InsteadOf_Delete_学科]
ON [education].[dbo].[学科]
INSTEAD OF DELETE
AS
BEGIN
    -- 1. 删除 包含1 表中与被删除学科相关的记录
    DELETE FROM [education].[dbo].[包含1]
    WHERE [学科ID] IN (SELECT [学科ID] FROM DELETED);

    -- 2. 删除 具有 表中与被删除学科相关的记录
    DELETE FROM [education].[dbo].[具有]
    WHERE [学科ID] IN (SELECT [学科ID] FROM DELETED);

    -- 3. 删除 从属 表中与被删除学科相关的记录
    DELETE FROM [education].[dbo].[从属]
    WHERE [学科ID] IN (SELECT [学科ID] FROM DELETED);

    -- 4. 删除 复试志愿 表中与被删除学科相关的记录
    DELETE FROM [education].[dbo].[复试志愿]
    WHERE [学科ID] IN (SELECT [学科ID] FROM DELETED);

    -- 5. 删除 招生目录条目 表中与被删除学科相关的记录
    DELETE FROM [education].[dbo].[招生目录条目]
    WHERE [学科ID] IN (SELECT [学科ID] FROM DELETED);

    -- 6. 最后删除 学科 表中的记录
    DELETE FROM [education].[dbo].[学科]
    WHERE [学科ID] IN (SELECT [学科ID] FROM DELETED);
END;
GO
ALTER TABLE [dbo].[学科] ENABLE TRIGGER [trg_InsteadOf_Delete_学科]
GO
/****** Object:  Trigger [dbo].[trg_delete_College]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_delete_College]
ON [education].[dbo].[学院]
INSTEAD OF DELETE
AS
BEGIN
    -- 开启事务，保证数据一致性
    BEGIN TRANSACTION;

    BEGIN TRY
        -- 删除属于表中的相关记录
        DELETE FROM [education].[dbo].[属于]
        WHERE [学院ID] IN (SELECT [学院ID] FROM deleted);

        -- 删除编制表中的相关记录
        DELETE FROM [education].[dbo].[编制]
        WHERE [学院ID] IN (SELECT [学院ID] FROM deleted);

        -- 删除导师表中的相关记录
        DELETE FROM [education].[dbo].[导师]
        WHERE [学院ID] IN (SELECT [学院ID] FROM deleted);

        -- 删除招生目录条目表中的相关记录
        DELETE FROM [education].[dbo].[招生目录条目]
        WHERE [学院ID] IN (SELECT [学院ID] FROM deleted);

        -- 删除学院表中的记录
        DELETE FROM [education].[dbo].[学院]
        WHERE [学院ID] IN (SELECT [学院ID] FROM deleted);

        -- 提交事务
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- 回滚事务，避免删除失败导致的数据不一致
        ROLLBACK TRANSACTION;
        -- 抛出错误信息
        THROW;
    END CATCH;
END;
GO
ALTER TABLE [dbo].[学院] ENABLE TRIGGER [trg_delete_College]
GO
/****** Object:  Trigger [dbo].[trg_InsteadOf_Delete_用户]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_InsteadOf_Delete_用户]
ON [education].[dbo].[用户]
INSTEAD OF DELETE
AS
BEGIN
    DECLARE @角色名称 NVARCHAR(50);
    DECLARE @用户ID INT;
    DECLARE @角色ID INT;

    -- 获取被删除用户的用户ID
    SELECT @用户ID = [用户ID] FROM DELETED;
	select @角色ID= [角色ID] FROM [education].[dbo].[用户] WHERE [用户ID] = @用户ID;

    -- 获取该用户对应的角色名称
    SELECT @角色名称 = [角色名称] FROM [education].[dbo].[角色] WHERE [角色ID] = @角色ID;

    -- 如果角色是导师，先删除对应1表，再删除导师
    IF @角色名称 = '导师'
    BEGIN
        -- 删除 对应1 表中的记录
        DELETE FROM [education].[dbo].[对应1]
        WHERE [导师ID] = @用户ID;

        -- 删除 导师 表中的记录
        DELETE FROM [education].[dbo].[导师]
        WHERE [导师ID] = @用户ID;

		DELETE FROM [education].[dbo].[作为]
		WHERE [用户ID] = @用户ID;
		 -- 删除 用户 表中的记录
        DELETE FROM [education].[dbo].[用户]
        WHERE [用户ID] = @用户ID;

    END

    -- 如果角色是考生，先删除对应2表，再删除考生和用户
    ELSE IF @角色名称 = '考生'
    BEGIN
        -- 删除 对应2 表中的记录
	DELETE FROM [education].[dbo].[对应2]
	WHERE [用户ID] IN (SELECT [用户ID] FROM DELETED)
	   OR [考生ID] IN (SELECT [考生ID] FROM DELETED);

		DELETE FROM [education].[dbo].[作为]
		WHERE [用户ID] = @用户ID;

        -- 删除 考生 表中的记录
        DELETE FROM [education].[dbo].[考生]
        WHERE [用户ID] = @用户ID;
        -- 删除 用户 表中的记录
        DELETE FROM [education].[dbo].[用户]
        WHERE [用户ID] = @用户ID;
    END

    -- 如果角色是其他，则只删除用户记录，不做其他删除操作
    ELSE 
BEGIN
		DELETE FROM [education].[dbo].[作为]
		WHERE [用户ID] = @用户ID;

        DELETE FROM [education].[dbo].[用户]
        WHERE [用户ID] = @用户ID;
    END
	END;
GO
ALTER TABLE [dbo].[用户] ENABLE TRIGGER [trg_InsteadOf_Delete_用户]
GO
/****** Object:  Trigger [dbo].[trg_InsteadOf_Delete_招生目录]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_InsteadOf_Delete_招生目录]
ON [education].[dbo].[招生目录]
INSTEAD OF DELETE
AS
BEGIN
    -- Step 1: 删除包含3表中的相关记录
    DELETE FROM [education].[dbo].[包含3]
    WHERE [招生目录ID] IN (SELECT [招生目录ID] FROM DELETED);
;

    -- Step 3: 删除招生目录表中的记录
    DELETE FROM [education].[dbo].[招生目录]
    WHERE [招生目录ID] IN (SELECT [招生目录ID] FROM DELETED);
END;
GO
ALTER TABLE [dbo].[招生目录] ENABLE TRIGGER [trg_InsteadOf_Delete_招生目录]
GO
/****** Object:  Trigger [dbo].[trg_InsteadOf_Delete_招生目录条目]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_InsteadOf_Delete_招生目录条目]
ON [education].[dbo].[招生目录条目]
INSTEAD OF DELETE
AS
BEGIN
    -- Step 1: 删除 编制 表中的相关记录
    DELETE FROM [education].[dbo].[编制]
    WHERE [招生目录条目ID] IN (SELECT [招生目录条目ID] FROM DELETED);

    -- Step 2: 删除 包含2 表中的相关记录
    DELETE FROM [education].[dbo].[包含2]
    WHERE [招生目录条目ID] IN (SELECT [招生目录条目ID] FROM DELETED);

    -- Step 3: 删除 具有 表中的相关记录
    DELETE FROM [education].[dbo].[具有]
    WHERE [招生目录条目ID] IN (SELECT [招生目录条目ID] FROM DELETED);

    -- Step 4: 删除 招生目录条目 表中的相关记录
    DELETE FROM [education].[dbo].[招生目录条目]
    WHERE [招生目录条目ID] IN (SELECT [招生目录条目ID] FROM DELETED);
END;
GO
ALTER TABLE [dbo].[招生目录条目] ENABLE TRIGGER [trg_InsteadOf_Delete_招生目录条目]
GO
/****** Object:  Trigger [dbo].[trg_After_Update_总成绩]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_After_Update_总成绩]
ON [education].[dbo].[总成绩]
AFTER UPDATE
AS
BEGIN
    DECLARE @考生ID INT, @总成绩ID INT, @新类型 NVARCHAR(50);

    -- 获取更新的数据
    SELECT @考生ID = [考生ID], @总成绩ID = [总成绩ID]
    FROM INSERTED;

    -- 在 拥有 表中更新对应记录
    UPDATE [education].[dbo].[拥有]
    SET [类型] = @新类型
    WHERE [总成绩ID] = @总成绩ID AND [考生ID] = @考生ID;
END;
GO
ALTER TABLE [dbo].[总成绩] ENABLE TRIGGER [trg_After_Update_总成绩]
GO
/****** Object:  Trigger [dbo].[trg_InsteadOf_Insert_总成绩]    Script Date: 2024/11/10 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_InsteadOf_Insert_总成绩]
ON [education].[dbo].[总成绩]
instead of INSERT
AS
BEGIN
    DECLARE @考生ID INT, @总成绩ID INT, @类别 VARCHAR(10);

    -- 获取插入的数据
    SELECT @考生ID = [考生ID], @总成绩ID = [总成绩ID], @类别 = ISNULL(类别, '未分类')
    FROM INSERTED;

    -- 检查 `拥有` 表中是否已有记录，避免重复插入
    IF NOT EXISTS (SELECT 1 FROM [education].[dbo].[拥有] WHERE 考生ID = @考生ID AND 总成绩ID = @总成绩ID)
    BEGIN
        PRINT '插入拥有表: 考生ID=' + CAST(@考生ID AS VARCHAR(50)) + ', 总成绩ID=' + CAST(@总成绩ID AS VARCHAR(50)) + ', 类别=' + ISNULL(@类别, 'NULL');

        -- 插入拥有表记录
        INSERT INTO [education].[dbo].[拥有] (考生ID, 总成绩ID, 类型)
        VALUES (@考生ID, @总成绩ID, @类别);
    END
    ELSE
    BEGIN
        PRINT '记录已存在，跳过插入。';
    END
	INSERT INTO [education].[dbo].[总成绩] (总成绩ID, 考生ID, 类别, 总分数值, 创建时间, 更新时间)
    SELECT 总成绩ID, 考生ID, 类别, 总分数值, 创建时间, 更新时间
    FROM INSERTED;
END;
GO
ALTER TABLE [dbo].[总成绩] ENABLE TRIGGER [trg_InsteadOf_Insert_总成绩]
GO
