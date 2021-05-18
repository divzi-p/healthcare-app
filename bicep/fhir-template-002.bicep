param services_fhir_healthcareapp_002_name string = 'fhir-healthcareapp-003'
param storageAccounts_fhirstorageacount4may21_name string = 'fhirstorageaccount003'
param workspaces_fhir_loganalytica_name string = 'fhir-loganalytics-003'

resource services_fhir_healthcareapp_002_name_resource 'Microsoft.HealthcareApis/services@2021-01-11' = {
  name: services_fhir_healthcareapp_002_name
  location: 'southeastasia'
  kind: 'fhir-R4'
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    accessPolicies: []
    cosmosDbConfiguration: {
      offerThroughput: 400
    }
    authenticationConfiguration: {
      authority: 'https://login.microsoftonline.com/21a16082-c6a3-45ae-befe-0268dd0f6d15'
      audience: 'https://${services_fhir_healthcareapp_002_name}.azurehealthcareapis.com'
      smartProxyEnabled: true
    }
    corsConfiguration: {
      origins: [
        '*'
      ]
      headers: [
        '*'
      ]
      methods: [
        'DELETE'
        'GET'
        'OPTIONS'
        'PATCH'
        'POST'
        'PUT'
      ]
      maxAge: 100
      allowCredentials: false
    }
    exportConfiguration: {
      storageAccountName: storageAccounts_fhirstorageacount4may21_name
    }
    acrConfiguration: {
      loginServers: []
    }
    privateEndpointConnections: []
    publicNetworkAccess: 'Enabled'
  }
}

resource workspaces_fhir_loganalytica_name_resource 'microsoft.operationalinsights/workspaces@2020-10-01' = {
  name: workspaces_fhir_loganalytica_name
  location: 'southeastasia'
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
    features: {
      legacy: 0
      searchVersion: 1
      enableLogAccessUsingOnlyResourcePermissions: true
    }
    workspaceCapping: {
      dailyQuotaGb: -1
    }
    publicNetworkAccessForIngestion: 'Enabled'
    publicNetworkAccessForQuery: 'Enabled'
  }
}

resource storageAccounts_fhirstorageacount4may21_name_resource 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageAccounts_fhirstorageacount4may21_name
  location: 'southeastasia'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  kind: 'StorageV2'
  properties: {
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: true
    allowSharedKeyAccess: true
    networkAcls: {
      bypass: 'AzureServices'
      virtualNetworkRules: []
      ipRules: []
      defaultAction: 'Allow'
    }
    supportsHttpsTrafficOnly: true
    encryption: {
      services: {
        file: {
          keyType: 'Account'
          enabled: true
        }
        blob: {
          keyType: 'Account'
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    accessTier: 'Hot'
  }
}






