targetScope='subscription'
param location string


resource rghealthcareApp 'Microsoft.Resources/resourceGroups@2020-10-01' = {
  name: 'rg-healthcareapp1'
  location: location
}

module hcPlanDeploy 'fhir-template.bicep' ={
  name:  'hcPlanDeploy'
  scope: rghealthcareApp
  params:{
    services_fhirapi_healthcare_001_name: 'fhirapi-healthcare-002'
  }
}
