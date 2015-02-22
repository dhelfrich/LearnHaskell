import Network
import System.IO
 
server = "irc.freenode.net"
port   = 6667
 
main :: IO ()
main = do
    h <- connectTo server (PortNumber (fromIntegral port))
    hSetBuffering h NoBuffering
    t <- hGetContents h
    print t
