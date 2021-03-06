USE [TeamProspectClone]
GO
/****** Object:  StoredProcedure [dbo].[Events_SelectById]    Script Date: 6/15/2018 5:44:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Brian Long
-- Create date: 3/12/018
-- Description:	Select Events By Id
-- =============================================
ALTER PROCEDURE [dbo].[Events_SelectById]

  
@Id int

AS
BEGIN

SET NOCOUNT ON;

  /* ------------ Test -------------------

exec dbo.Events_SelectById
@Id=5

*/ -------------------------------------

SELECT [Id], [EventName], [EventTypeId], [EventDescription], [AddressId], [StartDate],
[EndDate], [StartTime], [EndTime], [IsAllDayEvent], [CanRepeat], [TicketPrice], [PhotoUrl], [ExternalSiteUrl],
[IsAdminApproved], [CreatedDate], [CreatedById], [ModifiedDate], [ModifiedById] from dbo.Events

where Id=@Id

END
