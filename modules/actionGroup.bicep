// PARAMETERS
param actionGroupName string
param groupShortName string

// RESOURCE
resource actionGroup 'Microsoft.Insights/actionGroups@2021-09-01' = {
  name: actionGroupName
  location: 'global'
//   tags: {
//     tagName1: 'tagValue1'
//     tagName2: 'tagValue2'
//   }
  properties: {
    emailReceivers: [
      {
        emailAddress: 'EMAIL ADDRESS 1'
        name: 'Email Alert'
        useCommonAlertSchema: false
      }
      {
        emailAddress: 'EMAIL ADDRESS 2'
        name: 'Second Email Alert'
        useCommonAlertSchema: false
      }
    ]
    enabled: true
    groupShortName: groupShortName
  }
}

output actionGroupId string =  actionGroup.id
