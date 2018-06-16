USE [TeamProspectClone]
GO
/****** Object:  StoredProcedure [dbo].[Events_ProspectEvent_Update]    Script Date: 6/15/2018 11:34:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Brian Long
-- Create date: 3/12/2018
-- Description: Update an item in Events_ProspectEvent
-- =============================================
ALTER PROCEDURE [dbo].[Events_ProspectEvent_Update]

	@AddressTypeId int,
	@StreetAddress nvarchar(250),
	@City nvarchar(100),
	@StateProvinceId int,
	@PostalCode int,

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

	SET NOCOUNT ON;

    
  /* --------------- Test ---------------------------


  declare @OutId int=0;
  declare @FakeDate datetime2(7) = GetUTCDate();

  exec  [dbo].[Events_ProspectEvent_Insert]
    @Id=3,
    @EventName='Q & A',
    @EventTypeId=3, 
    @EventDescription='Get to know your fighter',
    @AddressId = 2 , 
    @StartDate= '05/01/2019', 
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
    @ModifiedById = 2



  select * from dbo.events_prospectevent
  */	------------------------------------------------

exec dbo.Address_Address_Update
	@Id= @AddressId,
	@AddressTypeId = @AddressTypeId,
	@StreetAddress = @StreetAddress,
	@City = @City,
	@StateProvinceId = @StateProvinceId,
	@PostalCode = @PostalCode

update  dbo.Events_ProspectEvent
set 
	EventName=@EventName, 
	EventTypeId=@EventTypeId, 
	EventDescription=@EventDescription,
	StartDate=@StartDate,  
	EndDate=@EndDate,
	StartTime=@StartTime,
	EndTime=@EndTime,
	IsAllDayEvent=@IsAllDayEvent,
	CanRepeat=@CanRepeat, 
	TicketPrice=@TicketPrice,
	PhotoUrl=@PhotoUrl,
	ExternalSiteUrl=@ExternalSiteUrl,
	IsAdminApproved=@IsAdminApproved,
	ModifiedById=@ModifiedById
	where Id=@Id


END
