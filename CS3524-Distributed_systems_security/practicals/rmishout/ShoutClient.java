package practicals.rmishout;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import java.rmi.Naming;
import java.rmi.RMISecurityManager;
import java.rmi.RemoteException;


public class ShoutClient
{
    public static void main(String args[]) throws RemoteException
    {
        if (args.length < 2) {
            System.err.println( "Usage:\njava ShoutClient <host> <port>" ) ;
            return;
        }

        // the client must know where the rmiregistry resides that knows the requested
        // remote object - hostname and registryport have to provided as commandline
        // parameters

        String hostname = args[0];
        int registryport = Integer.parseInt( args[1] );

        // Specify the security policy and set the security manager.
        System.setProperty( "java.security.policy", "rmishout.policy" ) ;
        System.setSecurityManager( new RMISecurityManager() ) ;

        try
        {
            // Obtain the service reference from the RMI registry
            // listening at hostname:registryport.

            String regURL = "rmi://" + hostname + ":" + registryport + "/ShoutService";
            System.out.println( "Looking up " + regURL );

            // lookup the remote service, it will return a reference to the stub

            ShoutServiceInterface shoutservice = (ShoutServiceInterface)Naming.lookup( regURL );

            // Prompt the user to type in a message to be sent to the remote service.

            BufferedReader in = new BufferedReader( new InputStreamReader( System.in ));
            System.out.print( "Enter message:" );
            String message = in.readLine() ;

            // ===============================================
            // Invoke the remote method

            String shoutResult = shoutservice.shout ( message ) ;

            // ===============================================
            // and print out the result.
            System.out.println("Your message:");
            System.out.println( shoutResult );

            // ===============================================

        }
        catch (java.io.IOException e) {
            System.err.println( "I/O error." );
            System.err.println( e.getMessage() );
        }
        catch (java.rmi.NotBoundException e) {
            System.err.println( "Server not bound." );
            System.err.println( e.getMessage() );
        }
    }
}
