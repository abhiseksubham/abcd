SELECT H.OpportunityID
	,H.CREATEDDATE
	,H.STAGENAME AS 'Q1-14 Stage'
	,H.CLOSEDATE AS 'Q1-14 Close Date'
FROM (
	SELECT OpportunityID
		,Max(CREATEDDATE) AS MaxDate
	FROM [BVSFWarehouse].[dbo].[sf_OPPORTUNITYHISTORY]
	WHERE CREATEDDATE <= '2013-05-01'
	GROUP BY OpportunityID
	) X
INNER JOIN [BVSFWarehouse].[dbo].[sf_OPPORTUNITYHISTORY] H ON H.OpportunityID = X.OpportunityID
	AND X.MaxDate = H.CREATEDDATE