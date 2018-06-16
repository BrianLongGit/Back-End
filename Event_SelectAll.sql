USE [TeamProspectClone]
GO
/****** Object:  StoredProcedure [dbo].[Events_ProspectEvent_SelectAll]    Script Date: 6/15/2018 11:42:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Brian Long
-- Create date: 3/12/2018
-- Description:	Select All from Events_ProspectEvent
-- =============================================
ALTER PROCEDURE [dbo].[Events_ProspectEvent_SelectAll] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    
  /* ------------ Test ------------------

 exec dbo.Events_ProspectEvent_SelectAll


 */ -------------------------------------
 
 
   
	SELECT
		CONCAT(a.City, ', ', sp.StateProvinceCode) as cityState,
		CONCAT(a.StreetAddress, ', ', a.City) as streetCity,
		p.CreatedById as EventCreator,
		up.AvatarUrl,
		CONCAT(up.FirstName, ' ', up.LastName) as FullName,
		p.Id, 
		p.EventName, 
		et.TypeName as eventTypeName,
		et.Id as EventTypeId,
		p.EventDescription,
		CONCAT(a.StreetAddress, ' ', a.City, ',', sp.StateProvinceCode, ' ', a.PostalCode) as fullAddress,
		a.StreetAddress,
		a.AddressTypeId,
		atype.Id as AddressTypeId,
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
		p.ModifiedById




	from dbo.Events_ProspectEvent as p

	join dbo.Address_Address as a

	on a.id = p.AddressId

	join dbo.StateProvince as sp

	on sp.Id = a.StateProvinceId

	join dbo.Events_EventType as et

	on et.Id = p.EventTypeId

	join dbo.Address_AddressType as atype

	on atype.Id = a.AddressTypeId
	
	join dbo.Users_UserProfile as up

	on up.UserBaseId = p.CreatedById

	
	--on up.Id = u.FollowedByUserId


END
