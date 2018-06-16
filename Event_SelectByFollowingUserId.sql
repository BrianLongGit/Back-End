USE [TeamProspectClone]
GO
/****** Object:  StoredProcedure [dbo].[Events_ProspectEvent_SelectAllEventsFollowingUserId]    Script Date: 6/15/2018 5:44:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Brian Long	
-- Create date: 04/05/2018
-- Description:	Select All Events of Athletes followed by User Id
-- =============================================
ALTER PROCEDURE [dbo].[Events_ProspectEvent_SelectByFollowingUserId]
	-- Add the parameters for the stored procedure here
  
@UserBaseId int 
--@Id int
  
AS
BEGIN

SET NOCOUNT ON;


    
  /* -------------------- Test ------------------------------

	exec dbo.Events_ProspectEvent_SelectAllEventsFollowingUserId
	@UserBaseId=25

	exec dbo.Events_ProspectEvent_SelectAll

	exec dbo.Events_EventAttendance_SelectAll

	exec dbo.Users_UserBase_SelectAll

*/ ---------------------------------------------------------
  
SELECT 
	CONCAT(a.City, ', ', sp.StateProvinceCode) as cityState,
	CONCAT(a.StreetAddress, ', ', a.City) as streetCity,
	p.CreatedById as EventCreator,
	up.AvatarUrl,
	CONCAT(up.FirstName, ' ', up.LastName) as FullName,
	p.Id, 
	p.EventName, 
	et.TypeName as EventTypeName,
	et.Id as EventTypeId,
	p.EventDescription,
	CONCAT(a.StreetAddress, ' ', a.City, ',', sp.StateProvinceCode, ' ', a.PostalCode) as fullAddress,
	a.StreetAddress,
	a.City,
	sp.StateProvinceCode,
	sp.Id as StateProvinceId,
	p.AddressId,
	a.PostalCode,
	p.StartDate,
	p.EndDate,
	p.StartTime,
	p.EndTime,
	p.IsAllDayEvent,
	p.CanRepeat,
	p.TicketPrice,
	p.PhotoUrl,
	p.ExternalSiteUrl,
	p.IsAdminApproved,
	p.CreatedDate,
	p.CreatedById,
	p.ModifiedDate,
	p.ModifiedById,
	ea.UserBaseId,
	ea.Attendance


FROM dbo.Events_ProspectEvent as p

inner join dbo.Address_Address as a

on a.id = p.AddressId

inner join dbo.StateProvince as sp

on sp.Id = a.StateProvinceId

inner join dbo.Events_EventType as et

on et.Id = p.EventTypeId

inner join dbo.Address_AddressType as atype

on atype.Id = a.AddressTypeId

inner join dbo.Users_UserProfile as up

on up.UserBaseId = p.CreatedById

inner join dbo.Events_EventAttendance as ea

on ea.EventId = p.Id

and ea.UserBaseId=@UserBaseId

where (ea.Attendance = 'Yes' or ea.Attendance = 'Maybe') and p.EndDate >= GETDATE()

ORDER BY
p.StartDate ASC

	
END
