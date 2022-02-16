package org.nhindirect.smtpmq.gateway.boot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;

@ComponentScan({"org.nhindirect.smtpmq.gateway"})
@SpringBootApplication
@EnableScheduling
public class SmtpGatewayApplication
{
	public static void main(String[] args)
	{
      SpringApplication.run(SmtpGatewayApplication.class, args);
    }
}
