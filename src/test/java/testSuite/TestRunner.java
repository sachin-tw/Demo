package testSuite;
// Runner File - Karate JUnit 5 Runner, to run using single file

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class TestRunner {

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:testSuite")
                .tags("@Demo1,@Demo2")
                .outputCucumberJson(true)
                .parallel(1);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}

