USE [TeamProspectClone]
GO
/****** Object:  StoredProcedure [dbo].[Events_Delete]    Script Date: 6/15/2018 5:22:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Brian Long
-- Create date: 3/13/2018
-- Description:	Delete an item from Events at Id.
-- =============================================
ALTER PROCEDURE [dbo].[Events_Delete]

@Id int
  
AS
BEGIN

	SET NOCOUNT ON;
  
  /* ------- Test Code ---------
  
	exec dbo.Events
	@Id=29

 */----------------------------

	Delete dbo.Events
	where Id=@Id


END
