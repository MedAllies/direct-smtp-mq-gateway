package org.nhindirect.smtpmq.gateway.component;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import org.subethamail.smtp.server.SMTPServer;

@Component
public class SMTPServerComponent implements CommandLineRunner {

   @Autowired
   protected SMTPServer smtpServer;

   @Override
   public void run(String... args) throws Exception
   {
      smtpServer.start();
   }
}
