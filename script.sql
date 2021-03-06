USE [master]
GO
/****** Object:  Database [ExamVerificationDb]    Script Date: 22/07/2019 11:02:15 PM ******/
CREATE DATABASE [ExamVerificationDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExamVerificationDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\ExamVerificationDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ExamVerificationDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\ExamVerificationDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ExamVerificationDb] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExamVerificationDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExamVerificationDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExamVerificationDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExamVerificationDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExamVerificationDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExamVerificationDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExamVerificationDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ExamVerificationDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExamVerificationDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExamVerificationDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExamVerificationDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExamVerificationDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExamVerificationDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExamVerificationDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExamVerificationDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExamVerificationDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ExamVerificationDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExamVerificationDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExamVerificationDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExamVerificationDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExamVerificationDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExamVerificationDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ExamVerificationDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExamVerificationDb] SET RECOVERY FULL 
GO
ALTER DATABASE [ExamVerificationDb] SET  MULTI_USER 
GO
ALTER DATABASE [ExamVerificationDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExamVerificationDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExamVerificationDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExamVerificationDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ExamVerificationDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ExamVerificationDb', N'ON'
GO
ALTER DATABASE [ExamVerificationDb] SET QUERY_STORE = OFF
GO
USE [ExamVerificationDb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [ExamVerificationDb]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 22/07/2019 11:02:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [nvarchar](50) NOT NULL,
	[Middlename] [nvarchar](50) NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Username] [nvarchar](15) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[DOB] [date] NOT NULL,
	[Gender] [int] NOT NULL,
	[Usertype] [int] NOT NULL,
	[FacultyorDept] [int] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Biometrics]    Script Date: 22/07/2019 11:02:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Biometrics](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MatricNo] [char](14) NOT NULL,
	[FingerPrint] [varbinary](max) NOT NULL,
	[Image] [varbinary](max) NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Biometrics] PRIMARY KEY CLUSTERED 
(
	[MatricNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Course]    Script Date: 22/07/2019 11:02:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CourseTitle] [nvarchar](50) NOT NULL,
	[CourseCode] [char](6) NOT NULL,
	[Semester] [int] NOT NULL,
	[Level] [int] NOT NULL,
	[FacultyId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[Description] [nvarchar](50) NULL,
	[Unit] [int] NOT NULL,
	[CourseType] [int] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourseRange]    Script Date: 22/07/2019 11:02:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseRange](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NoOfCourse] [int] NOT NULL,
 CONSTRAINT [PK_CourseRange] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourseReg]    Script Date: 22/07/2019 11:02:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseReg](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MatricNo] [char](14) NOT NULL,
	[CourseId] [int] NOT NULL,
	[Session] [int] NOT NULL,
	[DeptId] [int] NOT NULL,
	[Semester] [int] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[SiginDate] [datetime2](7) NULL,
	[SiginBy] [nvarchar](50) NULL,
	[IsPresent] [bit] NULL,
 CONSTRAINT [PK_CourseReg] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourseType]    Script Date: 22/07/2019 11:02:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ShortName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CourseType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourseUnit]    Script Date: 22/07/2019 11:02:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseUnit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Unit] [int] NOT NULL,
 CONSTRAINT [PK_CourseUnit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 22/07/2019 11:02:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ShortName] [char](3) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[FacultyId] [int] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ErrorImages]    Script Date: 22/07/2019 11:02:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorImages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[BaseString] [varbinary](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExamReportSummary]    Script Date: 22/07/2019 11:02:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamReportSummary](
	[Id] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Session] [int] NOT NULL,
	[StudentWithBiometrics] [int] NOT NULL,
	[StudentWithoutBiometrics] [int] NOT NULL,
	[Attempts] [int] NOT NULL,
	[StudentVerified] [int] NOT NULL,
	[StartTime] [datetime2](7) NOT NULL,
	[StopTime] [datetime2](7) NOT NULL,
	[Lecturer] [nvarchar](50) NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Faculty]    Script Date: 22/07/2019 11:02:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculty](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ShortName] [char](3) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gender]    Script Date: 22/07/2019 11:02:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Level]    Script Date: 22/07/2019 11:02:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Level](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [int] NOT NULL,
 CONSTRAINT [PK_Level] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LGA]    Script Date: 22/07/2019 11:02:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LGA](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[StateId] [int] NOT NULL,
 CONSTRAINT [PK_LGA] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Semester]    Script Date: 22/07/2019 11:02:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semester](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Semester] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Session]    Script Date: 22/07/2019 11:02:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [char](9) NOT NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[State]    Script Date: 22/07/2019 11:02:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 22/07/2019 11:02:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [nvarchar](50) NOT NULL,
	[Middlename] [nvarchar](50) NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[Gender] [int] NOT NULL,
	[StateOfOrigin] [int] NOT NULL,
	[LGA] [int] NOT NULL,
	[MatricNo] [char](14) NOT NULL,
	[Faculty] [int] NOT NULL,
	[Department] [int] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[MatricNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Admin] ADD  CONSTRAINT [DF_Admin_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Biometrics] ADD  CONSTRAINT [DF_Biometrics_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Course] ADD  CONSTRAINT [DF_Course_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[CourseReg] ADD  CONSTRAINT [DF_CourseReg_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[CourseReg] ADD  CONSTRAINT [DF_CourseReg_IsPresent]  DEFAULT ((0)) FOR [IsPresent]
GO
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [DF_Department_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Faculty] ADD  CONSTRAINT [DF_Faculty_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [DF_Student_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  StoredProcedure [dbo].[AddAdmin]    Script Date: 22/07/2019 11:02:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddAdmin]
@Firstname nvarchar(50), @Middlename nvarchar(50), @Lastname nvarchar(50),@Address nvarchar(50),
@Username nvarchar(50),@Password nvarchar(50),@DOB date, @UserType int, @FacultyorDept int,@Gender int,@Createdby nvarchar(50), @ret nvarchar(50) out

as
begin
if not exists(select * from Admin where username=@Username)
begin
insert into Admin (Firstname,Middlename,lastname,Address,Username,Password,DOB,Usertype,FacultyorDept,Gender,CreatedBy)
values (@Firstname,@Middlename,@Lastname,@Address,@Username,@Password,@DOB,@Gender,@UserType,@FacultyorDept,@Createdby)

set @ret= @Firstname +' '+ @Lastname +' successfully added'

end
else
begin
set @ret= @Username + ' already exist'
end

end

--declare @ret nvarchar(50)
--exec AddAdmin 'Emmanuel','O','Malieze','Ago-Iwoye','imanoel','system','2019/06/14',iman
GO
/****** Object:  StoredProcedure [dbo].[AddCourse]    Script Date: 22/07/2019 11:02:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddCourse]
@CourseTitle nvarchar(50),@Coursecode char(6),@Semester int,@Level int, @FacultyId int,@DepartmentId int,@Description nvarchar(50),
@Unit int,@CourseType int,@CreatedBy nvarchar(50), @ret nvarchar(50) out

as
begin
if not exists (select * from course where coursetitle=@CourseTitle or coursecode=@coursecode)
begin
insert into course(coursetitle,coursecode,semester,[level],facultyid,departmentid,description,unit,coursetype,createdby)
values(@CourseTitle,@Coursecode,@Semester,@Level,@FacultyId,@DepartmentId,@Description,@Unit,@CourseType,@CreatedBy)

set @ret= 1

end
else
begin
set @ret=0
end
end
GO
/****** Object:  StoredProcedure [dbo].[AddDepartment]    Script Date: 22/07/2019 11:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[AddDepartment] --'SCIENCE','SCI','AGO-IWOYE','imanoel',
@Name nvarchar(50), @ShortName char(3), @Description nvarchar(50),@FacultyId int, @CreatedBy nvarchar(50),@ret nvarchar(50) output

as
begin

if not exists (select * from Department where Name =@Name)
begin
insert into Department (Name,ShortName,Description,FacultyId,CreatedBy)
values (@Name,@ShortName,@Description,@FacultyId,@CreatedBy)

set @ret=@Name +' Department was successfully added' 
end
else
begin

set @ret= @Name + ' Department already exist'

end
end
--declare @ret nvarchar(50)
--execute AddFaculty 'SCIENCE','SCI','AGO-IWOYE','imanoel',@ret out

--print @ret
GO
/****** Object:  StoredProcedure [dbo].[AddFaculty]    Script Date: 22/07/2019 11:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[AddFaculty] --'SCIENCE','SCI','AGO-IWOYE','imanoel',
@Name nvarchar(50), @ShortName char(3), @Description nvarchar(50), @CreatedBy nvarchar(50),@ret nvarchar(50) output

as
begin

if not exists (select * from Faculty where Name =@Name or ShortName=@ShortName)
begin
insert into Faculty (Name,ShortName,Description,CreatedBy)
values (@Name,@ShortName,@Description,@CreatedBy)

set @ret=@Name +' was successfully added' 
end
else
begin

set @ret= @Name + ' already exist'

end
end
GO
/****** Object:  StoredProcedure [dbo].[AddStudent]    Script Date: 22/07/2019 11:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddStudent]
@Firstname nvarchar(50),@Middlename nvarchar(50),@Lastname nvarchar(50),@StateofOrigin int,@LGA int,@Faculty int, @Department int, 
@MatricNo char(14), @Gender int,@createdBy nvarchar(50), @ret int out

as
begin
if not exists (select * from student where matricno=@MatricNo)
begin
insert into student(firstname,middlename,lastname,stateoforigin,lga,faculty,department,matricno,gender,createdby)
values(@Firstname,@Middlename,@Lastname,@StateofOrigin,@lga,@Faculty,@Department,@MatricNo,@gender,@createdBy)

set @ret=1
end 
else
begin
set @ret=0
end
end
GO
/****** Object:  StoredProcedure [dbo].[AddStudentCourse]    Script Date: 22/07/2019 11:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[AddStudentCourse]
@MatricNo char(14),@CourseId int,@Session int, @deptid int,@Semester int,@CreatedBy nvarchar(50)

as

begin
if exists(select * from student where matricno=@matricno)
begin
if not exists ( Select * from coursereg where matricno=@matricno and courseid=@courseid and session =@session)
begin
insert into coursereg(matricno,courseid,session,deptid,semester,createdby)
values(@MatricNo,@CourseId,@Session,@deptid,@Semester,@CreatedBy)
end
end
end
GO
/****** Object:  StoredProcedure [dbo].[CheckEnrollment]    Script Date: 22/07/2019 11:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CheckEnrollment]
 @Departmentid int --,@FacultyId int,

as
begin

select MatricNo, (Firstname +' '+Lastname )as Name from student where Department=@departmentid and MatricNo not in
(select MatricNo from Biometrics)
end

GO
/****** Object:  StoredProcedure [dbo].[checkexamreport]    Script Date: 22/07/2019 11:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[checkexamreport]
@Session int,@Courseid int, @ret int out

as
begin
	if exists (select * from examreportsummary where session=@session and courseid=@courseid)
		begin
		set @ret=1
		end
	else
		begin
		set @ret=0
		end
	end
GO
/****** Object:  StoredProcedure [dbo].[getAllCourseType]    Script Date: 22/07/2019 11:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getAllCourseType]
as
begin

SELECT Id,ShortName FROM COURSETYPE
end
GO
/****** Object:  StoredProcedure [dbo].[getAllCourseUnit]    Script Date: 22/07/2019 11:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getAllCourseUnit]
as
begin

select Id,Unit from courseunit
end
GO
/****** Object:  StoredProcedure [dbo].[GetAllFacultty]    Script Date: 22/07/2019 11:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetAllFacultty]
as
begin
select ID,Name from Faculty
end
GO
/****** Object:  StoredProcedure [dbo].[getAllLevel]    Script Date: 22/07/2019 11:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getAllLevel]
as
begin

select Id,Name from level
end
GO
/****** Object:  StoredProcedure [dbo].[getAllSemester]    Script Date: 22/07/2019 11:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getAllSemester]
as
begin


select Id,Name from semester
end
GO
/****** Object:  StoredProcedure [dbo].[getAllSession]    Script Date: 22/07/2019 11:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getAllSession]

as
begin

select Id,Name from Session order by id  desc

end
GO
/****** Object:  StoredProcedure [dbo].[getAllState]    Script Date: 22/07/2019 11:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getAllState]
as
begin
select Id,Name  from State
end
GO
/****** Object:  StoredProcedure [dbo].[getcouresrange]    Script Date: 22/07/2019 11:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getcouresrange]
as
begin

select Id,NoofCourse from courserange
end
GO
/****** Object:  StoredProcedure [dbo].[getCoursebyDepartmentSemester]    Script Date: 22/07/2019 11:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getCoursebyDepartmentSemester]
@Department int,@semester int

as
begin
select ID,Coursetitle from course where Departmentid=@Department and Semester=@semester
end
GO
/****** Object:  StoredProcedure [dbo].[GetCoursebyFacSem]    Script Date: 22/07/2019 11:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetCoursebyFacSem]
@faculty int,@semester int

as
begin

select Id, (coursecode+'  '+coursetitle) as coursetitle from course where facultyid=@faculty and Semester=@semester
end

GO
/****** Object:  StoredProcedure [dbo].[getCourseregNoBiometric]    Script Date: 22/07/2019 11:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getCourseregNoBiometric]
@session int,@courseid int, @ret nvarchar(50) out

as
 begin
	if exists (select * from coursereg where session=@session and CourseId=@courseid)
	begin
	set @ret= (select count(*) from CourseReg where session=@session and CourseId=@courseid and MatricNo in
	(select MatricNo from Biometrics))
	end
 end
 
GO
/****** Object:  StoredProcedure [dbo].[getDepartmentbyFaculty]    Script Date: 22/07/2019 11:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getDepartmentbyFaculty]
@FacultyId int
as
begin
select Id,Name from Department where FacultyId=@FacultyId
end
GO
/****** Object:  StoredProcedure [dbo].[getErrorImage]    Script Date: 22/07/2019 11:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getErrorImage]

as
begin
 select top 1 id, BaseString from   ErrorImages
 end
GO
/****** Object:  StoredProcedure [dbo].[getFingerPrintCourse]    Script Date: 22/07/2019 11:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getFingerPrintCourse]
@session int,@semester int,@course int

as
begin

select matricno,FingerPrint,image from Biometrics where matricno in (select matricno from coursereg where session=@session
and Semester=@semester and CourseId=@course)
end
GO
/****** Object:  StoredProcedure [dbo].[getGender]    Script Date: 22/07/2019 11:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getGender]

as
begin
select Id,Name from Gender order by id
end
GO
/****** Object:  StoredProcedure [dbo].[getlgabystate]    Script Date: 22/07/2019 11:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getlgabystate]
@stateid int
as
begin

select id,name from lgA where stateid=@stateid
end
GO
/****** Object:  StoredProcedure [dbo].[getNonRegStudent]    Script Date: 22/07/2019 11:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getNonRegStudent] --1,1
@session int,@deptid int,@semester int
as
begin


(select Matricno,(Firstname + ' '+Lastname)as Name from student where department=@deptid and matricno  not in (select matricno no from coursereg where (session=@session and semester=@semester) and deptid=@deptid  ))
--select Firstname as name,matricno from Student 
--where not exists
--(select * from coursereg where  session=@session and deptid=@deptid and semester=@semester)
end



--select * from student s left outer join coursereg c on s.matricno=c.matricno
--where c.matricno=null

--select * from student where department=1 

GO
/****** Object:  StoredProcedure [dbo].[getStudentReg]    Script Date: 22/07/2019 11:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getStudentReg]
@session int , @courseid int, @ret nvarchar(50) out
as
begin

set @ret= (select count(*) from biometrics where  MatricNo  in (select MatricNo from coursereg where session =@session and courseid=@courseid))

end
GO
/****** Object:  StoredProcedure [dbo].[getverifiedStudent]    Script Date: 22/07/2019 11:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getverifiedStudent]
 @session int, @courseid int, @ret nvarchar(50) out
as
begin
	if exists (select * from coursereg where session=@session and courseid=@courseid)
		begin
	set @ret=(	select count(*) from CourseReg where courseid=@courseid and Session=@session and IsPresent is not null and MatricNo in
				(select matricno from Biometrics ))
	
	
		end
end

select * from course
GO
/****** Object:  StoredProcedure [dbo].[InsertErrorImage]    Script Date: 22/07/2019 11:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsertErrorImage]
@Name nvarchar(50),@BaseString varbinary(max)

as
begin
insert into ErrorImages(name,basestring)
values(@Name,@BaseString)
end
GO
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 22/07/2019 11:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Login]
@username nvarchar(50), @password nvarchar(50) --, @ret int out,@usertype int out,@FacorDept int out

as

if exists (select * from admin where username=@username and Password =@password)
begin
select  usertype as AccountType,FacultyorDept as FacDept from Admin where username=@username and Password=@password


end
GO
/****** Object:  StoredProcedure [dbo].[NewExamReport]    Script Date: 22/07/2019 11:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[NewExamReport]
@Courseid int,@session int,@StudentwithBiometrics int, @StudentwithoutBiometrics int,@studentverified int, @Attempts int,@startTime datetime2(7),@stopTime dateTime2(7), @Lecturer nvarchar(50),
@createdBy nvarchar(50), @ret nvarchar(50) out

as 
begin
	if not exists (select * from examreportsummary where session=@session and CourseId=@courseid)
	begin
		insert into examreportsummary (courseid,Session,studentwithbiometrics,studentwithoutbiometrics,studentverified,attempts,starttime,stoptime,lecturer,CreatedBy)
		values(@Courseid,@session,@StudentwithBiometrics,@StudentwithoutBiometrics,@studentverified,@Attempts,@startTime,@stopTime,@Lecturer,@createdBy)

		set @ret=1
	end
	else
	begin
	set @ret=0;
	end
end



GO
/****** Object:  StoredProcedure [dbo].[NewFingerData]    Script Date: 22/07/2019 11:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[NewFingerData]

@MatricNo char(14),@FingerData varbinary(max),@ImageData varbinary(max),@CreatedBy nvarchar(50),@ret nvarchar(50) out

as
begin
	if exists(select * from student where matricno=@matricno)
		begin
			if not exists (select * from biometrics where MatricNo=@matricno)
				begin
				insert into biometrics(MatricNo,FingerPrint,Image,CreatedBy)
				values(@MatricNo,@FingerData,@ImageData,@CreatedBy)
				set @ret='1'
				end
			else
				begin
				set @ret='0'
				end
		end
	else
		begin
		set @ret='0'
		end
	end
GO
/****** Object:  StoredProcedure [dbo].[studentSearch]    Script Date: 22/07/2019 11:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[studentSearch] --joe
@searchvalue nvarchar(50)

as
begin

select * from student where firstname ='% @searchvalue' or Middlename like @searchvalue or lastname like @searchvalue or MatricNo like @searchvalue

end
GO
/****** Object:  StoredProcedure [dbo].[updateStudentExamAttendance]    Script Date: 22/07/2019 11:02:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[updateStudentExamAttendance] 
@Semester int, @matricno char(14), @Courseid int, @session int,@SigninBy nvarchar(50), @ret nvarchar(50) out

as
begin
	if  exists  (select * from CourseReg where MatricNo=@matricno and Semester=@Semester and Session=@session and courseid=@Courseid and ispresent is null)
		begin
		update CourseReg 
		set SiginBy=@SigninBy , Ispresent=1, SiginDate=getdate()  where matricno=@matricno and semester=@semester and @session=@session and @courseid=@courseid;
		set @ret=1;
		end
	else
	begin
		set @ret =0;
	end
end



GO
USE [master]
GO
ALTER DATABASE [ExamVerificationDb] SET  READ_WRITE 
GO
