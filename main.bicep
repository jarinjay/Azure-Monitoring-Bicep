// PARAMETERS
@minLength(2)
@maxLength(10)

param environment string 
param scopeDetails string

// VARIABLE
var env = toLower('${environment}')

// RESOURCES 
module actionGroup 'modules/actionGroup.bicep' = {
  name: 'AG-${env}-deployment'
  params: {
    actionGroupName: 'actionGroup-${env}'
    groupShortName: 'ag-${env}'
  }
}


module alert 'modules/alert.bicep' = {
  name: 'alerts-${env}-deployment'
  params: {
    actionGroupId: actionGroup.outputs.actionGroupId
    scopeDetails: scopeDetails
  }
}
