/*******************************************************************
 * cs3515.examples.auction.AuctioneerMainline                      *
 *******************************************************************/
/* updated to Java 8: RMISecurityManager is deprecated
 * MK, 2016-01-27
 */

package practicals.auction;

import java.rmi.Naming;
import java.lang.SecurityManager;
import java.net.InetAddress;
import java.rmi.server.UnicastRemoteObject;

/**
 * The server mainline that generates and registers an instance of
 * AuctioneerImpl.
 * <p>
 * <p>Usage: java AuctioneerMainline registryport serverport item-for-sale
 *
 * @author Tim Norman, University of Aberdeen
 * @version 1.0
 */

public class AuctioneerMainline {
    public static void main(String args[]) {
        if (args.length < 3) {
            System.err.println("Usage:\njava AuctioneerMainline <registryport> <serverport> <item-for-sale>");
            return;
        }

        try {
            String hostname = (InetAddress.getLocalHost()).getCanonicalHostName();
            System.out.println("Hostname: " + hostname);
            int registryPort = Integer.parseInt(args[0]);
            int serverPort = Integer.parseInt(args[1]);

            System.setProperty("java.security.policy", "auction.policy");
            System.setSecurityManager(new SecurityManager());

            // Get the item for sale from the command-line arguments.
            String item = args[2];

            long timeout = Long.parseLong(args[3]);

            AuctioneerImpl serv = new AuctioneerImpl(item, timeout);
            AuctioneerInterface stub = (AuctioneerInterface) UnicastRemoteObject.exportObject(serv, serverPort);
            Naming.rebind("rmi://" + hostname + ":" + registryPort + "/Auctioneer", stub);

        } catch (java.net.UnknownHostException e) {
            System.err.println("It seems that Java can't determine the local host!");
        } catch (java.io.IOException e) {
            System.out.println("Failed to register.");
            System.out.println(e);
        }
    }
}
