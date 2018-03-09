/*******************************************************************
 * cs3515.examples.auction.BidderMainline                          *
 *******************************************************************/
/* updated to Java 8: RMISecurityManager is deprecated
 * MK, 2016-01-27
 */

package practicals.auction;

import java.rmi.Naming;
import java.lang.SecurityManager;
import java.rmi.server.UnicastRemoteObject;
import java.util.Scanner;

/**
 * The server mainline that generates and registers an instance of
 * BidderImpl for callbacks and then submits a bid to the auctioneer.
 * <p>
 * <p>Usage: java BidderMainline registryhost registryport callbackport bid
 * <p>
 * <p>where the rmiregistry at which the auctioneer remote object is
 * registered is listening at the communication endpoint
 * registryhost:registryport and the callback object is exported to callbackport
 *
 * @author Tim Norman, University of Aberdeen
 * @version 1.0
 */

public class BidderMainline {
    public static void main(String args[]) {
        if (args.length < 4) {
            System.err.println("Usage:\njava BidderMainline <registryhost> <registryport> <callbackport> <bid>");
            return;
        }

        try {
            String hostname = args[0];
            int registryport = Integer.parseInt(args[1]);
            int callbackport = Integer.parseInt(args[2]);

            System.setProperty("java.security.policy", "auction.policy");
            System.setSecurityManager(new SecurityManager());

            // Get the price being bid from the command-line arguments.
            float price = Float.parseFloat(args[3]);

            BidderImpl bidder = new BidderImpl();
            BidderInterface bidderstub = (BidderInterface) UnicastRemoteObject.exportObject(bidder, callbackport);

            String regURL = "rmi://" + hostname + ":" + registryport + "/Auctioneer";

            AuctioneerInterface auc =
                    (AuctioneerInterface) Naming.lookup(regURL);

            Scanner kbd = new Scanner(System.in);

            String decision;

            String item = auc.getItemName();

            Long timeOut = auc.get_timeout();

            Float maxBid = auc.getHighestBid();

            System.out.println("Item " + item + " is being sold for price " + maxBid + " for " + timeOut + " minutes. Do you still want to bid?");
            decision = kbd.nextLine();

            switch (decision) {
                case "yes":
                    System.out.println("You bid on item " + item + " for price " + price);
                    auc.bid(bidderstub, price);
                    break;

                case "no":
                    System.out.println("NO BID!");
                    break;
            }

        } catch (java.rmi.NotBoundException e) {
            System.err.println("Can't find the auctioneer in the registry.");
        } catch (java.io.IOException e) {
            System.out.println("Failed to register.");
        }
    }
}
