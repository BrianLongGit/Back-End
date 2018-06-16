USE [TeamProspectClone]
GO
/****** Object:  StoredProcedure [dbo].[Events_ProspectEvent_Insert]    Script Date: 6/15/2018 11:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Brian Long
-- Create date: 3/12/2018
-- Description:	Insert an item into Events_ProspectEvent
-- =============================================
ALTER PROCEDURE [dbo].[Events_ProspectEvent_Insert]
	-- Add the parameters for the stored procedure here
	@Id int output,
	@EventName nvarchar(250),
	@EventTypeId int, 
	@EventDescription nvarchar(2000),
	@AddressId int, 
	@StartDate date, 
	@EndDate date,
	@StartTime time=null,
	@EndTime time=null, 
	@IsAllDayEvent bit, 
	@CanRepeat bit, 
	@TicketPrice money=null, 
	@PhotoUrl nvarchar(128)=null, 
	@ExternalSiteUrl nvarchar(128)=null,
	@IsAdminApproved bit,
	@CreatedById int, 
	@ModifiedById int=null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
  
/* -------------- Test ------------------------------
declare @OutId int=0;

exec  [dbo].[Events_ProspectEvent_Insert]
	@EventName='Ultimate MMA Match',
	@EventTypeId=1, 
	@EventDescription='The competition you have been waiting for',
	@AddressId = 2 , 
	@StartDate= '02/01/2019', 
	@EndDate='04/06/2019',
	@StartTime='05:30:00',
	@EndTime='08:00:00', 
	@IsAllDayEvent=1, 
	@CanRepeat=0, 
	@TicketPrice=31.48, 
	@PhotoUrl='test.url.website', 
	@ExternalSiteUrl='external.site',
	@IsAdminApproved=0,
	@CreatedById = 5, 
	@ModifiedById = 2,


@Id=@OutId output
select * from dbo.events_prospectevent

*/----------------------------------------------------

    

-- Insert statements for procedure here
insert into dbo.Events_ProspectEvent
	  (EventName,
		EventTypeId, 
		EventDescription,
		AddressId, 
		StartDate, 
		EndDate,
		StartTime,
		EndTime, 
		IsAllDayEvent, 
		CanRepeat, 
		TicketPrice, 
		PhotoUrl, 
		ExternalSiteUrl,
		IsAdminApproved,
		CreatedById, 
		ModifiedById
		)

values (
		@EventName,
		@EventTypeId, 
		@EventDescription,
		@AddressId, 
		@StartDate, 
		@EndDate,
		@StartTime,
		@EndTime, 
		@IsAllDayEvent, 
		@CanRepeat, 
		@TicketPrice, 
		@PhotoUrl, 
		@ExternalSiteUrl,
		@IsAdminApproved,
		@CreatedById, 
		@ModifiedById
		)

	set @Id=SCOPE_IDENTITY()

				
END
