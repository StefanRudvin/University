package practicals.rmishout;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface ShoutServiceInterface extends Remote
{
    public String shout( String s ) throws RemoteException;
}