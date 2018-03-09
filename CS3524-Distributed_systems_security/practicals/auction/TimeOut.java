package practicals.auction;

import java.rmi.RemoteException;

/**
 * A thread that simply waits until the auction (_duration)
 * is over and completes the auction.
 */
public class TimeOut extends Thread {

    private AuctioneerImpl _parent;

    public TimeOut(AuctioneerImpl parent) {
        _parent = parent;
    }

    public void run() {

        try {
            sleep(_parent.get_timeout() * 6000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (RemoteException e) {
            e.printStackTrace();
        }

        System.out.println("Auction time expired.");

        // Then issue the callback to bidders.
        _parent.callbackToBidders();

    }


}

