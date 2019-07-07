# Get-MailTrafficTopReport
# https://docs.microsoft.com/en-us/powershell/module/exchange/reporting/get-mailtraffictopreport?view=exchange-ps


#Get-MailTrafficSummaryReport -Category TopSpamRecipient -StartDate 06/13/2015 -EndDate 06/15/2015

#$EventActions = (Get-MailFilterListReport -SelectionTarget Actions).Value
#$EventTypes = Get-MailFilterListReport -SelectionTarget EventTypes
#$EventTypes | fl *
#$T = Get-MailTrafficTopReport -Direction inbound -AggregateBy Date
#$T
#$T | Group-Object Direction

#$T | Group-Object Name

#$T | Group-Object 'EventType'

#$Date = (Get-Date).AddDays(-1)
#$Date
#$T | Where-Object { $_.Date -eq $Date } #| Group-Object count
#$T | Group-Object count

#Get-MailTrafficReport -StartDate 12/12/2015 -EndDate 12/12/2015 -Direction Outbound -SummarizeBy Domain,EventType | Format-Table Domain,Date,EventType,Action,MessageCount
#Get-MailTrafficReport -StartDate 12/12/2015 -EndDate 12/12/2015 -Direction Outbound | Format-Table Domain,Date,EventType,Action,MessageCount
#Get-MailTrafficReport -Direction Inbound -StartDate 06/13/2015 -EndDate 06/15/2015

#Get-MailTrafficTopReport -StartDate 06/13/2015 -EndDate 06/15/2015