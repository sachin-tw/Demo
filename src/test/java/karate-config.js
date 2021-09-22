function fn() {
  // Main file for configurations, useful to execute any code before running anything
  var env = karate.env; // get system property 'karate.env'
  var authentication = java.lang.System.getenv("TEST_AUTH_TYPE");
  karate.log('karate.env system property was:', env);
  karate.log('karate.auth system property was:', authentication);
  var config = {
    env: env,
//    myVarName: 'someValue',
    apiUrlDemo: 'https://reqres.in/api',
    authentication: authentication
  }
  if (env =='sit') {
  config.apiUrl ='https://reqres.in/api'
  }
  else if (env =='uat') {
  config.apiUrl ='https://reqres.in/api'
  }
  else {
   config.apiUrl ='https://reqres.in/api'
  }
  karate.configure('connectTimeout', 15000);
//  karate.configure('readTimeout', 5000);
  return config;
}