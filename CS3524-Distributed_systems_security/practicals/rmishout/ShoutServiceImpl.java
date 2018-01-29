package practicals.rmishout;

import java.rmi.RemoteException;

public class ShoutServiceImpl implements ShoutServiceInterface
{
    // the constructor is empty in this example
    public ShoutServiceImpl()    throws RemoteException
    { }

    // this is the implementation of the remote method we
    // want to invoke from a client
    // it receives a String as a parameter and returns this string transformed to the client
    public String shout( String s ) throws RemoteException
    {
        return s.toUpperCase();
    }
}