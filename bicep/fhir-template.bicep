param services_fhirapi_healthcare_001_name string = 'fhirapi-healthcare-001'

resource services_fhirapi_healthcare_001_name_resource 'Microsoft.HealthcareApis/services@2021-01-11' = {
  name: services_fhirapi_healthcare_001_name
  location: 'southeastasia'
  kind: 'fhir-R4'
  properties: {
    accessPolicies: []
    cosmosDbConfiguration: {
      offerThroughput: 400
    }
    authenticationConfiguration: {
      authority: 'https://login.microsoftonline.com/72f988bf-86f1-41af-91ab-2d7cd011db47'
      audience: 'https://${services_fhirapi_healthcare_001_name}.azurehealthcareapis.com'
      smartProxyEnabled: false
    }
    corsConfiguration: {
      origins: []
      headers: []
      methods: []
      allowCredentials: false
    }
    exportConfiguration: {}
    acrConfiguration: {
      loginServers: []
    }
    privateEndpointConnections: []
    publicNetworkAccess: 'Enabled'
  }
}
