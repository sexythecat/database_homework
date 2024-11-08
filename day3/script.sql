USE [education]
GO
/****** Object:  Table [dbo].[包含1]    Script Date: 2024/11/6 21:29:44 ******/
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
/****** Object:  Table [dbo].[包含2]    Script Date: 2024/11/6 21:29:44 ******/
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
/****** Object:  Table [dbo].[包含3]    Script Date: 2024/11/6 21:29:44 ******/
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
/****** Object:  Table [dbo].[编制]    Script Date: 2024/11/6 21:29:44 ******/
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
/****** Object:  Table [dbo].[成绩]    Script Date: 2024/11/6 21:29:44 ******/
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
/****** Object:  Table [dbo].[从属]    Script Date: 2024/11/6 21:29:44 ******/
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
/****** Object:  Table [dbo].[导师]    Script Date: 2024/11/6 21:29:44 ******/
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
/****** Object:  Table [dbo].[对应1]    Script Date: 2024/11/6 21:29:44 ******/
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
/****** Object:  Table [dbo].[对应2]    Script Date: 2024/11/6 21:29:44 ******/
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
/****** Object:  Table [dbo].[复试结果]    Script Date: 2024/11/6 21:29:44 ******/
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
PRIMARY KEY CLUSTERED 
(
	[复试结果ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[复试志愿]    Script Date: 2024/11/6 21:29:44 ******/
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
PRIMARY KEY CLUSTERED 
(
	[志愿ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[获得]    Script Date: 2024/11/6 21:29:44 ******/
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
/****** Object:  Table [dbo].[角色]    Script Date: 2024/11/6 21:29:44 ******/
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
/****** Object:  Table [dbo].[具有]    Script Date: 2024/11/6 21:29:44 ******/
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
/****** Object:  Table [dbo].[考生]    Script Date: 2024/11/6 21:29:44 ******/
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
/****** Object:  Table [dbo].[考试科目]    Script Date: 2024/11/6 21:29:44 ******/
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
/****** Object:  Table [dbo].[确定]    Script Date: 2024/11/6 21:29:44 ******/
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
/****** Object:  Table [dbo].[填报]    Script Date: 2024/11/6 21:29:44 ******/
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
/****** Object:  Table [dbo].[选择]    Script Date: 2024/11/6 21:29:44 ******/
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
/****** Object:  Table [dbo].[学科]    Script Date: 2024/11/6 21:29:44 ******/
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
/****** Object:  Table [dbo].[学院]    Script Date: 2024/11/6 21:29:44 ******/
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
/****** Object:  Table [dbo].[拥有]    Script Date: 2024/11/6 21:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[拥有](
	[考生ID] [int] NOT NULL,
	[总成绩ID] [int] NOT NULL,
	[类型] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[考生ID] ASC,
	[总成绩ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[用户]    Script Date: 2024/11/6 21:29:44 ******/
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
/****** Object:  Table [dbo].[招生目录]    Script Date: 2024/11/6 21:29:44 ******/
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
/****** Object:  Table [dbo].[招生目录条目]    Script Date: 2024/11/6 21:29:44 ******/
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
/****** Object:  Table [dbo].[属于]    Script Date: 2024/11/6 21:29:44 ******/
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
/****** Object:  Table [dbo].[总成绩]    Script Date: 2024/11/6 21:29:44 ******/
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
/****** Object:  Table [dbo].[作为]    Script Date: 2024/11/6 21:29:44 ******/
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
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (1, N'070503-01')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (2, N'070503-01')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (3, N'070503-01')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (4, N'070503-01')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (5, N'070503-01')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (6, N'070503-01')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (7, N'071001-03')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (8, N'071001-03')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (9, N'071001-03')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (10, N'070503-01')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (11, N'070503-01')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (12, N'070503-01')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (13, N'080200-04')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (14, N'080200-04')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (15, N'080200-04')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (16, N'090301-01')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (17, N'090301-01')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (18, N'090301-01')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (19, N'070503-01')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (20, N'070503-01')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (21, N'070503-01')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (22, N'070503-01')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (23, N'070503-01')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (24, N'070503-01')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (25, N'070503-01')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (26, N'070503-01')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (27, N'090301-02')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (28, N'090301-02')
INSERT [dbo].[包含1] ([志愿ID], [学科ID]) VALUES (29, N'090301-02')
GO
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (1, 1)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (2, 2)
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
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (23, 23)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (24, 24)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (25, 25)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (26, 26)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (27, 27)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (28, 28)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (29, 29)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (30, 30)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (31, 1)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (32, 2)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (33, 3)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (34, 4)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (35, 5)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (36, 6)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (37, 7)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (38, 8)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (39, 9)
INSERT [dbo].[包含2] ([考试科目ID], [招生目录条目ID]) VALUES (40, 10)
GO
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (1, 1)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (1, 23)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (2, 2)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (2, 24)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (3, 3)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (3, 25)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (4, 4)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (4, 26)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (5, 5)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (5, 27)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (6, 6)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (6, 28)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (7, 7)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (7, 29)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (8, 8)
INSERT [dbo].[包含3] ([招生目录ID], [招生目录条目ID]) VALUES (8, 30)
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
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (1, 1)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (2, 2)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (2, 3)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (3, 4)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (3, 5)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (4, 6)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (4, 7)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (4, 8)
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
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (8, 23)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (8, 24)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (8, 25)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (9, 26)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (10, 27)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (10, 28)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (10, 29)
INSERT [dbo].[编制] ([学院ID], [招生目录条目ID]) VALUES (10, 30)
GO
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (85.5, 1, 1)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (3, 1, 2)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (78, 1, 3)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (2, 1, 4)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (2, 1, 5)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (34, 1, 6)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (74.5, 1, 7)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (31, 1, 8)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (81, 1, 9)
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (91.5, 1, 10)
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
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (82, 5, 1)
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
INSERT [dbo].[成绩] ([数值], [考生ID], [考试科目ID]) VALUES (9, 9, 1)
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
GO
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (1, N'070503-01')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (2, N'070503-01')
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
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (19, N'090301-01')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (20, N'090301-01')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (20, N'090301-02')
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
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (39, N'090703-01')
INSERT [dbo].[从属] ([导师ID], [学科ID]) VALUES (40, N'090704-01')
GO
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (1, N'path/to/photo1.jpg', 28, CAST(N'2024-11-06T12:44:34.787' AS DateTime), CAST(N'2024-11-06T12:44:34.787' AS DateTime), 1, N'教授，长期从事地理信息系统和地图学的教学与科研工作。', N'教授', N'博士生导师', N'已通过', N'1')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (2, N'path/to/photo2.jpg', 29, CAST(N'2024-11-06T12:44:34.787' AS DateTime), CAST(N'2024-11-06T12:44:34.787' AS DateTime), 1, N'副教授，研究方向为地理信息系统的应用与发展。', N'副教授', N'硕士生导师', N'已通过', N'1')
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
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (19, N'path/to/photo19.jpg', 14, CAST(N'2024-11-06T12:44:34.787' AS DateTime), CAST(N'2024-11-06T12:44:34.787' AS DateTime), 1, N'教授，专注于食品科学与技术的研究。', N'教授', N'硕士生导师', N'正在进行', N'10')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (20, N'path/to/photo20.jpg', 15, CAST(N'2024-11-06T12:44:34.787' AS DateTime), CAST(N'2024-11-06T12:44:34.787' AS DateTime), 1, N'副教授，研究农产品加工与贮藏工程。', N'副教授', N'博士生导师', N'已通过', N'10')
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
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (39, N'path/to/photo19.jpg', 119, CAST(N'2024-11-06T14:17:28.657' AS DateTime), CAST(N'2024-11-06T14:17:28.657' AS DateTime), 1, N'导师简介19', N'教授', N'学科导师', N'已通过', N'10')
INSERT [dbo].[导师] ([导师ID], [照片路径], [用户ID], [更新时间], [创建时间], [是否具有招生资格], [简介], [职称], [导师类别], [审核状态], [学院ID]) VALUES (40, N'path/to/photo20.jpg', 120, CAST(N'2024-11-06T14:17:28.657' AS DateTime), CAST(N'2024-11-06T14:17:28.657' AS DateTime), 1, N'导师简介20', N'讲师', N'学科导师', N'已通过', N'10')
GO
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (1, 28)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (2, 29)
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
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (19, 14)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (20, 15)
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
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (39, 119)
INSERT [dbo].[对应1] ([导师ID], [用户ID]) VALUES (40, 120)
GO
INSERT [dbo].[对应2] ([考生ID], [用户ID]) VALUES (1, 3)
INSERT [dbo].[对应2] ([考生ID], [用户ID]) VALUES (2, 2)
INSERT [dbo].[对应2] ([考生ID], [用户ID]) VALUES (3, 4)
INSERT [dbo].[对应2] ([考生ID], [用户ID]) VALUES (4, 5)
INSERT [dbo].[对应2] ([考生ID], [用户ID]) VALUES (5, 6)
INSERT [dbo].[对应2] ([考生ID], [用户ID]) VALUES (6, 7)
INSERT [dbo].[对应2] ([考生ID], [用户ID]) VALUES (7, 8)
INSERT [dbo].[对应2] ([考生ID], [用户ID]) VALUES (8, 9)
INSERT [dbo].[对应2] ([考生ID], [用户ID]) VALUES (9, 10)
INSERT [dbo].[对应2] ([考生ID], [用户ID]) VALUES (10, 1)
GO
INSERT [dbo].[复试结果] ([复试结果ID], [考生ID], [更新时间], [创建时间], [最终导师ID], [录取状态], [综合评价]) VALUES (1, 1, CAST(N'2024-11-06T16:07:02.653' AS DateTime), CAST(N'2024-11-06T16:07:02.653' AS DateTime), 1, N'已录取', N'综合表现优秀，符合导师要求')
INSERT [dbo].[复试结果] ([复试结果ID], [考生ID], [更新时间], [创建时间], [最终导师ID], [录取状态], [综合评价]) VALUES (2, 2, CAST(N'2024-11-06T16:07:02.653' AS DateTime), CAST(N'2024-11-06T16:07:02.653' AS DateTime), 2, N'待审核', N'成绩优秀，但还需进一步审核')
INSERT [dbo].[复试结果] ([复试结果ID], [考生ID], [更新时间], [创建时间], [最终导师ID], [录取状态], [综合评价]) VALUES (3, 3, CAST(N'2024-11-06T16:07:02.653' AS DateTime), CAST(N'2024-11-06T16:07:02.653' AS DateTime), NULL, N'未录取', N'未通过复试')
INSERT [dbo].[复试结果] ([复试结果ID], [考生ID], [更新时间], [创建时间], [最终导师ID], [录取状态], [综合评价]) VALUES (4, 4, CAST(N'2024-11-06T16:07:02.653' AS DateTime), CAST(N'2024-11-06T16:07:02.653' AS DateTime), 10, N'待审核', N'面试表现一般，成绩有待提高')
INSERT [dbo].[复试结果] ([复试结果ID], [考生ID], [更新时间], [创建时间], [最终导师ID], [录取状态], [综合评价]) VALUES (5, 5, CAST(N'2024-11-06T16:07:02.653' AS DateTime), CAST(N'2024-11-06T16:07:02.653' AS DateTime), 35, N'已录取', N'优秀的学术背景和研究能力')
INSERT [dbo].[复试结果] ([复试结果ID], [考生ID], [更新时间], [创建时间], [最终导师ID], [录取状态], [综合评价]) VALUES (6, 6, CAST(N'2024-11-06T16:07:02.653' AS DateTime), CAST(N'2024-11-06T16:07:02.653' AS DateTime), 3, N'待审核', N'有潜力，但部分复试环节表现欠佳')
INSERT [dbo].[复试结果] ([复试结果ID], [考生ID], [更新时间], [创建时间], [最终导师ID], [录取状态], [综合评价]) VALUES (7, 7, CAST(N'2024-11-06T16:07:02.653' AS DateTime), CAST(N'2024-11-06T16:07:02.653' AS DateTime), NULL, N'未录取', N'未通过复试，学术能力较弱')
INSERT [dbo].[复试结果] ([复试结果ID], [考生ID], [更新时间], [创建时间], [最终导师ID], [录取状态], [综合评价]) VALUES (8, 8, CAST(N'2024-11-06T16:07:02.653' AS DateTime), CAST(N'2024-11-06T16:07:02.653' AS DateTime), 2, N'已录取', N'学术成绩和面试都很出色')
INSERT [dbo].[复试结果] ([复试结果ID], [考生ID], [更新时间], [创建时间], [最终导师ID], [录取状态], [综合评价]) VALUES (9, 9, CAST(N'2024-11-06T16:07:02.653' AS DateTime), CAST(N'2024-11-06T16:07:02.653' AS DateTime), 1, N'待审核', N'面试过程中展现了很好的问题解决能力')
INSERT [dbo].[复试结果] ([复试结果ID], [考生ID], [更新时间], [创建时间], [最终导师ID], [录取状态], [综合评价]) VALUES (10, 10, CAST(N'2024-11-06T16:07:02.653' AS DateTime), CAST(N'2024-11-06T16:07:02.653' AS DateTime), NULL, N'未录取', N'录取名额已满')
GO
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间]) VALUES (1, 1, 1, N'070503-01', 1, 1, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime))
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间]) VALUES (2, 2, 1, N'070503-01', 2, 0, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime))
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间]) VALUES (3, 21, 1, N'070503-01', 3, 1, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime))
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间]) VALUES (4, 21, 2, N'070503-01', 1, 0, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime))
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间]) VALUES (5, 22, 2, N'070503-01', 2, 1, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime))
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间]) VALUES (6, 2, 2, N'070503-01', 3, 0, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime))
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间]) VALUES (7, 31, 3, N'071001-03', 1, 1, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime))
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间]) VALUES (8, 30, 3, N'071001-03', 2, 0, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime))
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间]) VALUES (9, 29, 3, N'071001-03', 3, 1, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime))
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间]) VALUES (10, 10, 4, N'070503-01', 1, 0, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime))
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间]) VALUES (11, 1, 4, N'070503-01', 2, 1, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime))
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间]) VALUES (12, 2, 4, N'070503-01', 3, 0, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime))
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间]) VALUES (13, 36, 5, N'080200-04', 1, 1, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime))
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间]) VALUES (14, 35, 5, N'080200-04', 2, 0, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime))
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间]) VALUES (15, 34, 5, N'080200-04', 3, 1, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime))
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间]) VALUES (16, 19, 6, N'090301-01', 1, 0, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime))
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间]) VALUES (17, 20, 6, N'090301-01', 2, 1, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime))
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间]) VALUES (18, 3, 6, N'090301-01', 3, 0, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime))
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间]) VALUES (19, 1, 7, N'070503-01', 1, 1, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime))
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间]) VALUES (20, 2, 7, N'070503-01', 2, 0, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime))
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间]) VALUES (21, 1, 8, N'070503-01', 1, 0, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime))
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间]) VALUES (22, 2, 8, N'070503-01', 2, 1, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime))
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间]) VALUES (23, 3, 8, N'070503-01', 3, 0, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime))
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间]) VALUES (24, 1, 9, N'070503-01', 1, 1, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime))
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间]) VALUES (25, 2, 9, N'070503-01', 2, 0, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime))
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间]) VALUES (26, 3, 9, N'070503-01', 3, 1, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime))
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间]) VALUES (27, 23, 10, N'090301-02', 1, 0, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime))
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间]) VALUES (28, 24, 10, N'090301-02', 2, 1, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime))
INSERT [dbo].[复试志愿] ([志愿ID], [导师ID], [考生ID], [学科ID], [志愿顺序], [是否接受方向调整], [更新时间], [创建时间]) VALUES (29, 4, 10, N'090301-02', 3, 0, CAST(N'2024-11-06T16:03:14.443' AS DateTime), CAST(N'2024-11-06T16:03:14.443' AS DateTime))
GO
INSERT [dbo].[获得] ([考生ID], [复试结果ID]) VALUES (1, 1)
INSERT [dbo].[获得] ([考生ID], [复试结果ID]) VALUES (2, 2)
INSERT [dbo].[获得] ([考生ID], [复试结果ID]) VALUES (3, 3)
INSERT [dbo].[获得] ([考生ID], [复试结果ID]) VALUES (4, 4)
INSERT [dbo].[获得] ([考生ID], [复试结果ID]) VALUES (5, 5)
INSERT [dbo].[获得] ([考生ID], [复试结果ID]) VALUES (6, 6)
INSERT [dbo].[获得] ([考生ID], [复试结果ID]) VALUES (7, 7)
INSERT [dbo].[获得] ([考生ID], [复试结果ID]) VALUES (8, 8)
INSERT [dbo].[获得] ([考生ID], [复试结果ID]) VALUES (9, 9)
INSERT [dbo].[获得] ([考生ID], [复试结果ID]) VALUES (10, 10)
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
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'070503', 1)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'070503-01', 1)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'071001', 2)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'071001-01', 2)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'071001-02', 2)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'071001-03', 2)
INSERT [dbo].[具有] ([学科ID], [招生目录条目ID]) VALUES (N'071001-04', 2)
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
INSERT [dbo].[考生] ([考生ID], [考生类别], [性别], [生源地], [个人简历], [更新时间], [创建时间], [用户ID], [身份证号], [毕业时间], [出生日期], [本科毕业学校名称], [本科专业], [本科毕业学校类型]) VALUES (1, N'应届生', N'男', N'北京市', N'具有较强的学习能力和团队合作精神。', NULL, CAST(N'2024-11-06T10:44:11.330' AS DateTime), 3, N'110101199001011234', CAST(N'2024-06-30' AS Date), CAST(N'1990-01-01' AS Date), N'北京大学', N'计算机科学与技术', N'普通本科大学')
INSERT [dbo].[考生] ([考生ID], [考生类别], [性别], [生源地], [个人简历], [更新时间], [创建时间], [用户ID], [身份证号], [毕业时间], [出生日期], [本科毕业学校名称], [本科专业], [本科毕业学校类型]) VALUES (2, N'往届生', N'女', N'上海市', N'工作经验丰富，曾参与多个项目。', NULL, CAST(N'2024-11-06T10:44:11.330' AS DateTime), 2, N'310101199002022345', CAST(N'2023-06-30' AS Date), CAST(N'1990-02-02' AS Date), N'复旦大学', N'电子工程', N'普通本科大学')
INSERT [dbo].[考生] ([考生ID], [考生类别], [性别], [生源地], [个人简历], [更新时间], [创建时间], [用户ID], [身份证号], [毕业时间], [出生日期], [本科毕业学校名称], [本科专业], [本科毕业学校类型]) VALUES (3, N'同等学力', N'男', N'广东省', N'本科成绩优异，拥有相关职业资格证书。', NULL, CAST(N'2024-11-06T10:44:11.330' AS DateTime), 4, N'440101199003033456', CAST(N'2022-06-30' AS Date), CAST(N'1990-03-03' AS Date), N'中山大学', N'土木工程', N'普通本科大学')
INSERT [dbo].[考生] ([考生ID], [考生类别], [性别], [生源地], [个人简历], [更新时间], [创建时间], [用户ID], [身份证号], [毕业时间], [出生日期], [本科毕业学校名称], [本科专业], [本科毕业学校类型]) VALUES (4, N'定向生', N'女', N'北京市', N'在校期间担任班级干部，表现突出。', NULL, CAST(N'2024-11-06T10:44:11.330' AS DateTime), 5, N'110101199004044567', CAST(N'2025-06-30' AS Date), CAST(N'1990-04-04' AS Date), N'北京师范大学', N'教育学', N'普通本科大学')
INSERT [dbo].[考生] ([考生ID], [考生类别], [性别], [生源地], [个人简历], [更新时间], [创建时间], [用户ID], [身份证号], [毕业时间], [出生日期], [本科毕业学校名称], [本科专业], [本科毕业学校类型]) VALUES (5, N'非定向考生', N'男', N'江苏省', N'多次获得学术奖项，有良好的科研基础。', NULL, CAST(N'2024-11-06T10:44:11.330' AS DateTime), 6, N'320101199005055678', CAST(N'2021-06-30' AS Date), CAST(N'1990-05-05' AS Date), N'合肥技术大学', N'化学工程', N'开放大学')
INSERT [dbo].[考生] ([考生ID], [考生类别], [性别], [生源地], [个人简历], [更新时间], [创建时间], [用户ID], [身份证号], [毕业时间], [出生日期], [本科毕业学校名称], [本科专业], [本科毕业学校类型]) VALUES (6, N'应届生', N'女', N'浙江省', N'热衷于创新和技术实践，参与过多个项目。', NULL, CAST(N'2024-11-06T10:44:11.330' AS DateTime), 7, N'330101199006066789', CAST(N'2024-06-30' AS Date), CAST(N'1990-06-06' AS Date), N'浙江大学', N'机械工程', N'普通本科大学')
INSERT [dbo].[考生] ([考生ID], [考生类别], [性别], [生源地], [个人简历], [更新时间], [创建时间], [用户ID], [身份证号], [毕业时间], [出生日期], [本科毕业学校名称], [本科专业], [本科毕业学校类型]) VALUES (7, N'往届生', N'男', N'天津市', N'有过跨行业经验，适应能力强。', NULL, CAST(N'2024-11-06T10:44:11.330' AS DateTime), 8, N'120101199007077890', CAST(N'2023-06-30' AS Date), CAST(N'1990-07-07' AS Date), N'私立大学', N'金融学', N'独立学院')
INSERT [dbo].[考生] ([考生ID], [考生类别], [性别], [生源地], [个人简历], [更新时间], [创建时间], [用户ID], [身份证号], [毕业时间], [出生日期], [本科毕业学校名称], [本科专业], [本科毕业学校类型]) VALUES (8, N'同等学力', N'女', N'山东省', N'有较强的语言表达能力，喜欢公共事务。', NULL, CAST(N'2024-11-06T10:44:11.330' AS DateTime), 9, N'370101199008088901', CAST(N'2022-06-30' AS Date), CAST(N'1990-08-08' AS Date), N'信息科技大学', N'公共管理', N'专科院校')
INSERT [dbo].[考生] ([考生ID], [考生类别], [性别], [生源地], [个人简历], [更新时间], [创建时间], [用户ID], [身份证号], [毕业时间], [出生日期], [本科毕业学校名称], [本科专业], [本科毕业学校类型]) VALUES (9, N'定向生', N'男', N'河南省', N'在校期间多次获得奖学金，成绩优秀。', NULL, CAST(N'2024-11-06T10:44:11.330' AS DateTime), 10, N'410101199009099012', CAST(N'2025-06-30' AS Date), CAST(N'1990-09-09' AS Date), N'郑州大学', N'环境科学', N'普通本科大学')
INSERT [dbo].[考生] ([考生ID], [考生类别], [性别], [生源地], [个人简历], [更新时间], [创建时间], [用户ID], [身份证号], [毕业时间], [出生日期], [本科毕业学校名称], [本科专业], [本科毕业学校类型]) VALUES (10, N'非定向考生', N'女', N'湖北省', N'具备丰富的社会实践经验，关注社会热点。', NULL, CAST(N'2024-11-06T10:44:11.330' AS DateTime), 1, N'420101199010101234', CAST(N'2021-06-30' AS Date), CAST(N'1990-10-10' AS Date), N'武汉大学', N'法学', N'普通本科大学')
GO
INSERT [dbo].[考试科目] ([考试科目ID], [类别], [名称], [考试时间], [考试地点]) VALUES (1, N'初试', N'101 思想政治理论', CAST(N'2024-01-01' AS Date), N'地点A')
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
GO
INSERT [dbo].[确定] ([复试结果ID], [导师ID]) VALUES (1, 1)
INSERT [dbo].[确定] ([复试结果ID], [导师ID]) VALUES (2, 2)
INSERT [dbo].[确定] ([复试结果ID], [导师ID]) VALUES (3, 10)
INSERT [dbo].[确定] ([复试结果ID], [导师ID]) VALUES (4, 35)
INSERT [dbo].[确定] ([复试结果ID], [导师ID]) VALUES (5, 3)
INSERT [dbo].[确定] ([复试结果ID], [导师ID]) VALUES (6, 2)
INSERT [dbo].[确定] ([复试结果ID], [导师ID]) VALUES (7, 1)
GO
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (1, 1)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (1, 2)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (1, 3)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (2, 4)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (2, 5)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (2, 6)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (3, 7)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (3, 8)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (3, 9)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (4, 10)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (4, 11)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (4, 12)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (5, 13)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (5, 14)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (5, 15)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (6, 16)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (6, 17)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (6, 18)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (7, 19)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (7, 20)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (8, 21)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (8, 22)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (8, 23)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (9, 24)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (9, 25)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (9, 26)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (10, 27)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (10, 28)
INSERT [dbo].[填报] ([考生ID], [志愿ID]) VALUES (10, 29)
GO
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (1, 1)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (2, 2)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (3, 21)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (4, 21)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (5, 22)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (6, 2)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (7, 31)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (8, 30)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (9, 29)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (10, 10)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (11, 1)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (12, 2)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (13, 36)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (14, 35)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (15, 34)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (16, 19)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (17, 20)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (18, 3)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (19, 1)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (20, 2)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (21, 1)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (22, 2)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (23, 3)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (24, 1)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (25, 2)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (26, 3)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (27, 23)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (28, 24)
INSERT [dbo].[选择] ([志愿ID], [导师ID]) VALUES (29, 4)
GO
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'070503', N'地图学与地理信息系统', N'一级学科', N'与地图及信息系统相关', N'学术型学科', N'地理信息学', NULL, CAST(N'2024-11-06T12:08:28.047' AS DateTime), CAST(N'2024-11-06T12:08:28.047' AS DateTime), N'80', N'15')
INSERT [dbo].[学科] ([学科ID], [学科名称], [学科等级], [学科概述], [学科类型], [学科研究方向], [上级学科], [更新时间], [创建时间], [年度总招生指标], [增补指标]) VALUES (N'070503-01', N'3S 技术集成开发与应用', N'二级学科', N'与地图及信息系统相关', N'学术型学科', N'地理信息学', N'地图学与地理信息系统', CAST(N'2024-11-06T12:36:55.693' AS DateTime), CAST(N'2024-11-06T12:36:55.693' AS DateTime), N'6', N'3')
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
INSERT [dbo].[学院] ([学院ID], [学院名称]) VALUES (10, N'人文学院')
INSERT [dbo].[学院] ([学院ID], [学院名称]) VALUES (11, N'外语学院')
INSERT [dbo].[学院] ([学院ID], [学院名称]) VALUES (12, N'理学院')
INSERT [dbo].[学院] ([学院ID], [学院名称]) VALUES (13, N'环境科学与工程学院')
INSERT [dbo].[学院] ([学院ID], [学院名称]) VALUES (14, N'艺术设计学院')
INSERT [dbo].[学院] ([学院ID], [学院名称]) VALUES (15, N'马克思主义学院')
INSERT [dbo].[学院] ([学院ID], [学院名称]) VALUES (16, N'草业与草原学院')
GO
INSERT [dbo].[拥有] ([考生ID], [总成绩ID], [类型]) VALUES (1, 1, N'初试')
INSERT [dbo].[拥有] ([考生ID], [总成绩ID], [类型]) VALUES (1, 2, N'复试')
INSERT [dbo].[拥有] ([考生ID], [总成绩ID], [类型]) VALUES (2, 3, N'初试')
INSERT [dbo].[拥有] ([考生ID], [总成绩ID], [类型]) VALUES (2, 4, N'复试')
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
GO
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (1, N'admin', NULL, CAST(N'2024-11-06T10:37:31.993' AS DateTime), 1, N'admin@example.com', N'13800138000', N'张三', N'password123')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (2, N'mentor1', NULL, CAST(N'2024-11-06T10:37:31.993' AS DateTime), 2, N'mentor1@example.com', N'13800138001', N'李四', N'password456')
INSERT [dbo].[用户] ([用户ID], [用户名], [更新时间], [创建时间], [角色ID], [邮箱], [手机号], [姓名], [密码]) VALUES (3, N'candidate1', NULL, CAST(N'2024-11-06T10:37:31.993' AS DateTime), 3, N'candidate1@example.com', N'13800138002', N'王五', N'password789')
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
INSERT [dbo].[招生目录] ([招生目录ID], [招生年度], [是否通过学校审核]) VALUES (1, 2024, 1)
INSERT [dbo].[招生目录] ([招生目录ID], [招生年度], [是否通过学校审核]) VALUES (2, 2023, 1)
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
INSERT [dbo].[招生目录条目] ([招生目录条目ID], [年份], [学院ID], [创建时间], [更新时间], [是否招收同等学力], [学科ID]) VALUES (1, 2024, 1, CAST(N'2024-11-06T13:54:29.407' AS DateTime), CAST(N'2024-11-06T13:54:29.407' AS DateTime), 1, N'070503')
INSERT [dbo].[招生目录条目] ([招生目录条目ID], [年份], [学院ID], [创建时间], [更新时间], [是否招收同等学力], [学科ID]) VALUES (2, 2024, 2, CAST(N'2024-11-06T13:54:29.407' AS DateTime), CAST(N'2024-11-06T13:54:29.407' AS DateTime), 0, N'090301')
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
INSERT [dbo].[招生目录条目] ([招生目录条目ID], [年份], [学院ID], [创建时间], [更新时间], [是否招收同等学力], [学科ID]) VALUES (23, 2024, 8, CAST(N'2024-11-06T13:54:29.407' AS DateTime), CAST(N'2024-11-06T13:54:29.407' AS DateTime), 1, N'080200')
INSERT [dbo].[招生目录条目] ([招生目录条目ID], [年份], [学院ID], [创建时间], [更新时间], [是否招收同等学力], [学科ID]) VALUES (24, 2024, 8, CAST(N'2024-11-06T13:54:29.407' AS DateTime), CAST(N'2024-11-06T13:54:29.407' AS DateTime), 1, N'080200')
INSERT [dbo].[招生目录条目] ([招生目录条目ID], [年份], [学院ID], [创建时间], [更新时间], [是否招收同等学力], [学科ID]) VALUES (25, 2024, 8, CAST(N'2024-11-06T13:54:29.407' AS DateTime), CAST(N'2024-11-06T13:54:29.407' AS DateTime), 1, N'080200')
INSERT [dbo].[招生目录条目] ([招生目录条目ID], [年份], [学院ID], [创建时间], [更新时间], [是否招收同等学力], [学科ID]) VALUES (26, 2023, 9, CAST(N'2024-11-06T13:54:29.407' AS DateTime), CAST(N'2024-11-06T13:54:29.407' AS DateTime), 1, N'070503-01')
INSERT [dbo].[招生目录条目] ([招生目录条目ID], [年份], [学院ID], [创建时间], [更新时间], [是否招收同等学力], [学科ID]) VALUES (27, 2023, 10, CAST(N'2024-11-06T13:54:29.407' AS DateTime), CAST(N'2024-11-06T13:54:29.407' AS DateTime), 0, N'090301-01')
INSERT [dbo].[招生目录条目] ([招生目录条目ID], [年份], [学院ID], [创建时间], [更新时间], [是否招收同等学力], [学科ID]) VALUES (28, 2023, 10, CAST(N'2024-11-06T13:54:29.407' AS DateTime), CAST(N'2024-11-06T13:54:29.407' AS DateTime), 1, N'090301-02')
INSERT [dbo].[招生目录条目] ([招生目录条目ID], [年份], [学院ID], [创建时间], [更新时间], [是否招收同等学力], [学科ID]) VALUES (29, 2023, 10, CAST(N'2024-11-06T13:54:29.407' AS DateTime), CAST(N'2024-11-06T13:54:29.407' AS DateTime), 1, N'090703-01')
INSERT [dbo].[招生目录条目] ([招生目录条目ID], [年份], [学院ID], [创建时间], [更新时间], [是否招收同等学力], [学科ID]) VALUES (30, 2023, 10, CAST(N'2024-11-06T13:54:29.407' AS DateTime), CAST(N'2024-11-06T13:54:29.407' AS DateTime), 0, N'090704-01')
GO
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (1, 1)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (2, 1)
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
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (19, 10)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (20, 10)
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
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (39, 10)
INSERT [dbo].[属于] ([导师ID], [学院ID]) VALUES (40, 10)
GO
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (1, N'初试', 292, CAST(N'2024-11-06T14:52:31.413' AS DateTime), CAST(N'2024-11-06T14:52:31.413' AS DateTime), 1)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (2, N'复试', 270.5, CAST(N'2024-11-06T14:52:31.413' AS DateTime), CAST(N'2024-11-06T14:52:31.413' AS DateTime), 1)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (3, N'初试', 248.5, CAST(N'2024-11-06T14:52:31.417' AS DateTime), CAST(N'2024-11-06T14:52:31.417' AS DateTime), 2)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (4, N'复试', 285, CAST(N'2024-11-06T14:52:31.417' AS DateTime), CAST(N'2024-11-06T14:52:31.417' AS DateTime), 2)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (5, N'初试', 163.5, CAST(N'2024-11-06T14:55:09.270' AS DateTime), CAST(N'2024-11-06T14:55:09.270' AS DateTime), 3)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (6, N'复试', 281.5, CAST(N'2024-11-06T14:55:09.270' AS DateTime), CAST(N'2024-11-06T14:55:09.270' AS DateTime), 3)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (7, N'初试', 176.5, CAST(N'2024-11-06T14:55:09.273' AS DateTime), CAST(N'2024-11-06T14:55:09.273' AS DateTime), 4)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (8, N'复试', 188, CAST(N'2024-11-06T14:55:09.273' AS DateTime), CAST(N'2024-11-06T14:55:09.273' AS DateTime), 4)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (9, N'初试', 253.5, CAST(N'2024-11-06T14:55:09.273' AS DateTime), CAST(N'2024-11-06T14:55:09.273' AS DateTime), 5)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (10, N'复试', 275, CAST(N'2024-11-06T14:55:09.273' AS DateTime), CAST(N'2024-11-06T14:55:09.273' AS DateTime), 5)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (11, N'初试', 165, CAST(N'2024-11-06T14:56:01.950' AS DateTime), CAST(N'2024-11-06T14:56:01.950' AS DateTime), 6)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (12, N'复试', 254.5, CAST(N'2024-11-06T14:56:01.950' AS DateTime), CAST(N'2024-11-06T14:56:01.950' AS DateTime), 6)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (13, N'初试', 173, CAST(N'2024-11-06T14:56:01.953' AS DateTime), CAST(N'2024-11-06T14:56:01.953' AS DateTime), 7)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (14, N'复试', 272, CAST(N'2024-11-06T14:56:01.953' AS DateTime), CAST(N'2024-11-06T14:56:01.953' AS DateTime), 7)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (15, N'初试', 23, CAST(N'2024-11-06T14:56:27.693' AS DateTime), CAST(N'2024-11-06T14:56:27.693' AS DateTime), 8)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (16, N'复试', 184, CAST(N'2024-11-06T14:56:27.693' AS DateTime), CAST(N'2024-11-06T14:56:27.693' AS DateTime), 8)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (17, N'初试', 113, CAST(N'2024-11-06T14:56:27.693' AS DateTime), CAST(N'2024-11-06T14:56:27.693' AS DateTime), 9)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (18, N'复试', 188, CAST(N'2024-11-06T14:56:27.693' AS DateTime), CAST(N'2024-11-06T14:56:27.693' AS DateTime), 9)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (19, N'初试', 8, CAST(N'2024-11-06T14:57:54.960' AS DateTime), CAST(N'2024-11-06T14:57:54.960' AS DateTime), 10)
INSERT [dbo].[总成绩] ([总成绩ID], [类别], [总分数值], [更新时间], [创建时间], [考生ID]) VALUES (20, N'复试', 269, CAST(N'2024-11-06T14:57:54.960' AS DateTime), CAST(N'2024-11-06T14:57:54.960' AS DateTime), 10)
GO
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (1, 1)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (2, 2)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (3, 3)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (4, 4)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (5, 5)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (6, 6)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (7, 7)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (8, 8)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (9, 9)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (10, 2)
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
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (40, 1)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (101, 1)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (102, 1)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (103, 1)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (104, 1)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (105, 1)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (106, 1)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (107, 1)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (108, 1)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (109, 1)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (110, 1)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (111, 1)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (112, 1)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (113, 1)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (114, 1)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (115, 1)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (116, 1)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (117, 1)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (118, 1)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (119, 1)
INSERT [dbo].[作为] ([用户ID], [角色ID]) VALUES (120, 1)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__考生__532C17128579CF72]    Script Date: 2024/11/6 21:29:45 ******/
ALTER TABLE [dbo].[考生] ADD UNIQUE NONCLUSTERED 
(
	[身份证号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__考生__532C1712B5344377]    Script Date: 2024/11/6 21:29:45 ******/
ALTER TABLE [dbo].[考生] ADD UNIQUE NONCLUSTERED 
(
	[身份证号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__考生__532C1712C2636C60]    Script Date: 2024/11/6 21:29:45 ******/
ALTER TABLE [dbo].[考生] ADD UNIQUE NONCLUSTERED 
(
	[身份证号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__考生__532C1712F010CF26]    Script Date: 2024/11/6 21:29:45 ******/
ALTER TABLE [dbo].[考生] ADD UNIQUE NONCLUSTERED 
(
	[身份证号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
ALTER TABLE [dbo].[包含3]  WITH CHECK ADD FOREIGN KEY([招生目录条目ID])
REFERENCES [dbo].[招生目录条目] ([招生目录条目ID])
GO
ALTER TABLE [dbo].[包含3]  WITH CHECK ADD FOREIGN KEY([招生目录条目ID])
REFERENCES [dbo].[招生目录条目] ([招生目录条目ID])
GO
ALTER TABLE [dbo].[包含3]  WITH CHECK ADD FOREIGN KEY([招生目录条目ID])
REFERENCES [dbo].[招生目录条目] ([招生目录条目ID])
GO
ALTER TABLE [dbo].[包含3]  WITH CHECK ADD FOREIGN KEY([招生目录条目ID])
REFERENCES [dbo].[招生目录条目] ([招生目录条目ID])
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
