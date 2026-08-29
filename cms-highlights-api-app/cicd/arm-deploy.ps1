Get-Content ./cicd/environments/env.dev | Where-Object { $_ -notmatch '^#' -and $_ -match '=' } | ForEach-Object {
    $key, $value = $_.Split('=', 2)
    [System.Environment]::SetEnvironmentVariable($key.Trim(), $value.Trim())
}

mvn clean deploy -DmuleDeploy `
  "-Denv=dev" `
  "-Dsecurity.key=$env:SECURITY_KEY" `
  "-Danypoint.clientId=$env:ANYPOINT_CLIENT_ID" `
  "-Danypoint.clientSecret=$env:ANYPOINT_CLIENT_SECRET" `
  "-Danypoint.uri=$env:ANYPOINT_URI" `
  "-Danypoint.analytics.uri=$env:ANYPOINT_ANALYTICS_URI" `
  "-Darm.target=$env:ARM_TARGET" `
  "-Darm.targetType=$env:ARM_TARGET_TYPE" `
  "-Darm.environment=$env:ARM_ENVIRONMENT" `
  "-Darm.applicationName=$env:ARM_APPLICATION_NAME"