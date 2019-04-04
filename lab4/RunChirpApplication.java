import java.sql.*;
import java.io.*;
import java.util.*;

/**
 * A class that connects to PostgreSQL and disconnects.
 * You will need to change your credentials below, to match the usename and password of your account
 * in the PostgreSQL server.
 * The name of your database in the server is the same as your username.
 * You are asked to include code that tests the methods of the ChirpApplication class
 * in a similar manner to the sample RunStoresApplication.java program.
*/


public class RunChirpApplication
{
    public static void main(String[] args) {
    	
    	Connection connection = null;
    	try {
    	    //Register the driver
    		Class.forName("org.postgresql.Driver"); 
    	    // Make the connection.
            // You will need to fill in your real username
            // and password for your Postgres account in the arguments of the
            // getConnection method below.
            connection = DriverManager.getConnection(
                                                     "jdbc:postgresql://cmps182-db.lt.ucsc.edu/username",
                                                     "username",
                                                     "password");
            
            if (connection != null)
                System.out.println("Connected to the database!");

            /* Include your code below to test the methods of the ChirpApplication class
             * as described in Section 6 of the Lab4 pdf.
             * The sample code in RunStoresApplication.java should be useful.
             * That code tests other methods for a different database schema.
             * Your code below: */
            
            /* ChirpApplication app = new ChirpApplication(connection);
            List<Integer> result = app.GetUserIDS();
            for(int i:result){
                System.out.println(i);
            } */
            
            // Getting users by address
            ChirpApplication app = new ChirpApplication(connection);
            
            // Test #1
            List<Integer> result1 = app.getUsersByAddress("4 Privet Drive, Surrey");
            for(int i:result1){
                System.out.println(i);
            }
            
            /* Output of getUsersByAddress when the parameter theAddress is ‘4 Privet Drive,
            Surrey’:
             
                120
                124
             
             */
            
            // Test #2
            List<Integer> result2 = app.getUsersByAddress("Tottenham Court Road, London");
            for(int i:result2){
                System.out.println(i);
            }
            
            /* Output of getUsersByAddress when the parameter theAddress is ‘Tottenham Court
             Road, London’:
             
                103
             
             */
            
            // Making users inactive test
            System.out.println("The number of users set to inactive: " + app.makeUsersInactive());
            
            /* Output of makeUsersInactive
             
                27 ("The number of users set to inactive: 27")
             
             */
            
            /* GIVEN TEST */
            
            /* String ans = app.GetUserName(105);
            System.out.println(ans); */
            
            
            /* Write one test for the purgeBadUsers method. The test should run with censorLimit value
                3. Your code should print the result (number of users that were purged) that was returned
                by purgeBadUsers. */
                
            // Purging users test
            int censorLimit = 3;
            System.out.println("The number of users that were purged: " + app.purgeBadUsers(censorLimit));
            
            /* The number of users that were purged: 5 */
            
            /*******************
            * Your code ends here */
            
    	}
    	catch (SQLException | ClassNotFoundException e) {
    		System.out.println("Error while connecting to database: " + e);
    		e.printStackTrace();
    	}
    	finally {
    		if (connection != null) {
    			// Closing Connection
    			try {
					connection.close();
				} catch (SQLException e) {
					System.out.println("Failed to close connection: " + e);
					e.printStackTrace();
				}
    		}
    	}
    }
}
