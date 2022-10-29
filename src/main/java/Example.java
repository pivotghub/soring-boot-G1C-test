import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.*;
import org.springframework.web.bind.annotation.*;

@RestController
@EnableAutoConfiguration
public class Example {

	@Value("${welcome.message}")
	private String welcomeMessage;
	
    @RequestMapping("/")
    String home() {
        return welcomeMessage;
    }

    public static void main(String[] args) throws Exception {
    	
    	String s = null;
    	for(int i=0 ; i < 10000000; i++) {
    		 s = new String("OOOOO-NIHAAAAAAAAAAAAAAARRRRRRRRRRRRRR");
    	}
        SpringApplication.run(Example.class, args);
    }

}
