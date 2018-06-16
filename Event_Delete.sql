USE [TeamProspectClone]
GO
/****** Object:  StoredProcedure [dbo].[Events_ProspectEvent_Delete]    Script Date: 6/15/2018 5:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Brian Long
-- Create date: 3/13/2018
-- Description:	Delete an item from Events_ProspectEvent at Id.
-- =============================================
ALTER PROCEDURE [dbo].[Events_ProspectEvent_Delete]
	-- Add the parameters for the stored procedure here
	
	@Id int
  
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
  /* ------- Test Code ---------
  
	exec dbo.Events_ProspectEvent
	@Id=29

	*/----------------------------


		Delete dbo.Events_ProspectEvent
		where Id=@Id



END
