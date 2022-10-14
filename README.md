# LocalNCSI
A Local MSFT NCSI Server to return good results with the Windows 10 network connectivity test.

# Why?
Some instances of Windows 10+ machines have a local internet connectivity but either don't have access to or do not allow Microsoft's ping test which results in annoying lockouts or notifications.

# How To Use
- Run `LocalNSCI.exe`
- Edit your hostfile to point `http://www.msftconnecttest.com/` to `127.0.0.1` or the local IP of a computer running said server.

## Dependencies
For license information, please check their website and/or repository page
- [cpp-httplib](https://github.com/yhirose/cpp-httplib) - Single header http(s) request library
