// PARAMETERS

// GENERIC
param actionGroupId string
param scopeDetails string

// KEY VAULT MOITORING
param activityLogAlerts_DeleteKV_name string = 'Delete Key Vault'
param activityLogAlerts_approve_reject_private_end_point_name string = 'Approve reject private endpoint KV'

// RESOURCES

// DELETE KV
resource activityLogAlerts_DeleteKV_name_resource 'microsoft.insights/activityLogAlerts@2020-10-01' = {
  name: activityLogAlerts_DeleteKV_name
  location: 'Global'
  properties: {
    scopes: [ 
      scopeDetails
    ]
    condition: {
      allOf: [
        {
          field: 'category'
          equals: 'Administrative'
        }
        {
          field: 'resourceType'
          equals: 'microsoft.keyvault/vaults'
        }
        {
          field: 'operationName'
          equals: 'Microsoft.KeyVault/vaults/delete'
        }
        {
          field: 'level'
          containsAny: [
            'critical'
            'error'
            'warning'
            'informational'
          ]
        }
      ]
    }
    actions: {
      actionGroups: [
        {
          actionGroupId: actionGroupId
          webhookProperties: {}
        }
      ]
    }
    enabled: true
    description: activityLogAlerts_DeleteKV_name
  }
}


// Approve reject private endpoint 


resource activityLogAlerts_approve_reject_private_end_point_name_resource 'microsoft.insights/activityLogAlerts@2020-10-01' = {
  name: activityLogAlerts_approve_reject_private_end_point_name
  location: 'Global'
  properties: {
    scopes: [ 
      scopeDetails
    ]
    condition: {
      allOf: [
        {
          field: 'category'
          equals: 'Administrative'
        }
        {
          field: 'resourceType'
          equals: 'microsoft.keyvault/vaults'
        }
        {
          field: 'operationName'
          equals: 'Microsoft.KeyVault/vaults/PrivateEndpointConnectionsApproval/action'
        }
        {
          field: 'level'
          containsAny: [
            'critical'
            'error'
            'warning'
          ]
        }
      ]
    }
    actions: {
      actionGroups: [
        {
          actionGroupId: actionGroupId
          webhookProperties: {}
        }
      ]
    }
    enabled: true
  }
}
