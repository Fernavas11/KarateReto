package booker;


import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

public class ManagementTest {

    @Test
    void testParallel(){

        Runner.path("classpath:booker").outputCucumberJson(true).tags().parallel(2);

    }

}
