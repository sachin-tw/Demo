package performance

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._

import scala.concurrent.duration._
import scala.language.postfixOps

class Performance_Demo extends Simulation {

  val protocol = karateProtocol()

  protocol.nameResolver = (req, ctx) => req.getHeader("karate-name")
  val createDemo0 = scenario("Performance : Demo1").exec(karateFeature("classpath:testSuite/Demo1.feature", "@perf"))
//  val createDemo1 = scenario("Performance : Demo2").exec(karateFeature("classpath:testSuite/Demo2.feature", "@perf"))

  setUp(

    //    Load for given time period
    createDemo0.inject(rampUsers(200) during (60 seconds)).protocols(protocol)

    //    Spike with given no of users
//    createDemo0.inject(atOnceUsers(System.getenv("TEST_NO_OF_USERS").toInt)).protocols(protocol),
//    createDemo1.inject(atOnceUsers(System.getenv("TEST_NO_OF_USERS").toInt)).protocols(protocol)

//    Refer to this link for more customizations: https://github.com/intuit/karate/tree/master/karate-gatling
  )


}