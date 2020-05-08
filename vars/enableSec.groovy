import hudson.security.FullControlOnceLoggedInAuthorizationStrategy
import hudson.security.HudsonPrivateSecurityRealm
import javaposse.jobdsl.plugin.GlobalJobDslSecurityConfiguration
import jenkins.model.GlobalConfiguration
import jenkins.model.Jenkins
import jenkins.security.ApiTokenProperty

def realm = new HudsonPrivateSecurityRealm(
        false, false, null)

def account = realm.createAccount('admin', args[0])

def tokenProp = account.getProperty(ApiTokenProperty)

println tokenProp.tokenStore.generateNewToken('scripts').plainValue

Jenkins.instance.setSecurityRealm(
        realm)

Jenkins.instance.setAuthorizationStrategy(
        FullControlOnceLoggedInAuthorizationStrategy.newInstance())

GlobalConfiguration.all().get(GlobalJobDslSecurityConfiguration.class).useScriptSecurity = false
