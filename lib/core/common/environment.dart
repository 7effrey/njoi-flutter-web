abstract class Environment {
  final String apiEndPoint = '';

  final String dfConfigEndPoint = '';
  final String dbName = 'TestDb';
  final BuildEnv buildEnv = BuildEnv.DEV;
}

enum BuildEnv { DEV, STAGING, PRODUCTION }