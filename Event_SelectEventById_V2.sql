USE [TeamProspectClone]
GO
/****** Object:  StoredProcedure [dbo].[Events_ProspectEvent_SelectEventById]    Script Date: 6/15/2018 5:38:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Brian Long
-- Create date: 04/16/2018
-- Description:	Get Event by Id with concatenations and joins
-- =============================================
ALTER PROCEDURE [dbo].[Events_ProspectEvent_SelectEventById]

	@Id int, --event id
	@UserBaseId int
AS
BEGIN

	SET NOCOUNT ON;
  
  /* ---------------- Test --------------------
	
	exec dbo.events_prospectevent_selecteventbyid
	@Id =33,  @UserBaseId = 21
	
	*/ ------------------------------------------

	declare @attendance nvarchar(10) = (select top 1 Attendance from Events_EventAttendance
	where UserBaseId=@UserBaseId and EventId=@Id)

	SELECT
	IsNull(@attendance, 'Maybe') as Attendance, 
		CONCAT(a.City, ', ', sp.StateProvinceCode) as cityState,
		CONCAT(a.StreetAddress, ', ', a.City) as streetCity,
        p.id as EventId, 
        p.CreatedById as EventCreator,
        up.AvatarUrl,
        CONCAT(up.FirstName, ' ', up.LastName) as FullName,
        p.Id as EventId,
        p.EventName, 
        et.TypeName as EventTypeName,
        et.Id as EventTypeId,
        p.EventDescription,
        CONCAT(a.StreetAddress, ' ', a.City, ', ', sp.StateProvinceCode, ' ', a.PostalCode) as fullAddress,
        a.StreetAddress,
        a.AddressTypeId,
       -- atype.Id as AddressTypeId,
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
		case 
			when charindex('http:', p.ExternalSiteUrl) > 0 then p.ExternalSiteUrl
			when (p.ExternalSiteUrl is null or p.ExternalSiteUrl = '') then null
			else CONCAT('http://', p.ExternalSiteUrl) end
        as ExternalSiteUrl,
        p.IsAdminApproved,
        p.CreatedDate,
        p.CreatedById,
        p.ModifiedDate,
        p.ModifiedById
        --u.FollowingUserId,
        --u.FollowedByUserId,
        --u.CreatedDate,
       -- ea.Attendance

from dbo.Events_ProspectEvent as p
inner join dbo.Address_Address as a
on p.AddressId = a.Id
inner join dbo.StateProvince as sp 
on sp.Id = a.StateProvinceId 
inner join dbo.Events_EventType as et 
on et.Id = p.EventTypeId
inner join Address_AddressType as at
on at.Id = a.AddressTypeId
inner join dbo.Users_UserProfile as up
on up.UserBaseId = p.CreatedById
-- join dbo.Events_EventAttendance as ea 
--on ea.EventId = p.Id 
where p.id = @Id-- and  ea.UserBaseId = @UserBaseId




END
