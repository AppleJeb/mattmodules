GLSock(type)
    Description:
        Creates a new socket.
    Returns:
        Userdata

GLSock.Bind(host, port, callback(handle, errno))
    Description:
        Bindes the socket to the specific host and port
        The host has to be a ip, it will not resolve.
    Returns:
        boolean

GLSock.Listen(backlog, callback(handle, errno))
    Description:
        Sets the socket into listen mode.
		
        Always fails on GLSOCK_TYPE_TCP and GLSOCK_TYPE_UDP
    Returns
        boolean

GLSock.Accept(callback(handle, clienthandle, errno))
    Description:
        Begins an asynchronous accept operation. Whenever a client is accepted
	    it calls the callback. To keep the operation alive, call Accept	on the 
	    callback.
		
		Always fails on GLSOCK_TYPE_TCP and GLSOCK_TYPE_UDP
    Returns:
        boolean
		
GLSock.Connect(host, port, callback(handle, errno))
    Description:
	    Starts a connection to the host. Host will be resolved when its a hostname
		When the connection was established, errno will be GLSOCK_ERROR_SUCCESS
		
		Always fails on GLSOCK_TYPE_ACCEPTOR and GLSOCK_TYPE_TCP and GLSOCK_TYPE_UDP
	Returns:
	    boolean
		
	
GLSock.Send(buffer, callback(handle, bytes_sent, errno))
    Description:
	    Sends the data contained in buffer object to the endpoint. The buffer has to
		be a GLSockBuffer object.
		The outstanding data is not sent all at once, the callback can occour multiple
		times.
		
		Always fails on GLSOCK_TYPE_ACCEPTOR and GLSOCK_TYPE_UDP
	Returns
	    boolean
		
GLSock.SentTo(buffer, host, port, callback(handle, bytes_sent, errno))
    Description:
	    Same as GLSock.Send, hostname will be resolved.
		
		Always fails on GLSOCK_TYPE_ACCETPR and GLSOCK_TYPE_TCP
	Returns
	    boolean
		
GLSock.Read(bytes_to_read, callback(handle, buffer, errno))
    Description:
	    Reads bytes_to_read bytes and calls the callback.
		
		Always fails on GLSOCK_TYPE_ACCEPTOR and GLSOCK_TYPE_UDP
	Returns:
	    boolean
		
GLSock.ReadUntil(delimiter, callback(handle, buffer, errno))
    Description:
	    Reads until the internal buffer holds delimiter and calls the callback.
		
		Always fails on GLSOCK_TYPE_ACCEPTOR and GLSOCK_TYPE_UDP
	Returns:
	    boolean	
		
GLSock.ReadFrom(bytes_to_read, callback(handle, sender_host, sender_port, buffer, errno))
    Description:
	    Same as GLSock.Read
		
		Always fails on GLSOCK_TYPE_ACCETPR and GLSOCK_TYPE_TCP
	Returns:
	    boolean

GLSock.Resolve(...)
    Description:
	    The function is not available at the moment.
	Returns:
		false
		
GLSock.Cancel()
    Description:
	    Cancels all pending asynchronous operations.
	Returns:
		boolean
		
GLSock.Close()
    Description:
	    Closes the socket. After this you will need to create a new instance to use it.
		Also you should call Cancel before calling Close to avoid "possible" crashes.
	Returns:
	    boolean
		
-------------------------------------------------------------------------------------

GLSockBuffer()
    Description:
	    Creates a new buffer object.
    Returns:
	    Userdata
		
GLSockBuffer.Write(data)
    Description:
	    Writes data into current buffer position. Results the bytes written.
	Returns:
	    long
		
GLSockBuffer.Read(count)
    Description:
	    Reads the count of bytes and results string. Keep in mind that u can
		not read data with zeros as it will terminate the string due the 
		limitation of the lua interfaces exposed from Garry's Mod. It is more
		practicable to use the specific function.
	Returns:
	    string

GLSockBuffer.WriteString(string)
GLSockBuffer.ReadString()
GLSockBuffer.WriteDouble(double)
GLSockBuffer.ReadDouble()
GLSockBuffer.WriteFloat(float)
GLSockBuffer.ReadFloat()
GLSockBuffer.WriteLong(long)
GLSockBuffer.ReadLong()
GLSockBuffer.WriteShort(short)
GLSockBuffer.ReadShort()
GLSockBuffer.WriteByte(byte)
GLSockBuffer.ReadByte()
    Description:
	    All of these functions write/read the raw data of its actual representation
		to/from the buffer. Strings are null terminated which also writes it to the
		buffer.
	Returns:
	    count, data

GLSockBuffer.Size()
    Description:
	    Returns the current size of the buffer.
	Returns:
	    long
		
GLSockBuffer.Tell()
    Descriptions:
	    Returns the current position of the buffer.
	Returns:
	    long
		
GLSockBuffer.Seek(pos, method)
    Descriptions:
	    Works like fseek, will set the current buffer positon where
		to write/read.
    Returns:
	    boolean
		
GLSockBuffer.EOB()
    Description:
	    Returns if the buffer is at the end. (Position == Size)
	Returns:
	    boolean
		
GLSockBuffer.Empty()
	Description:
	    Returns if the buffer is currently empty.
	Returns:
	    boolean
		
-------------------------------------------------------------------------------------

Globals:
	GLSOCKBUFFER_SEEK_SET
	GLSOCKBUFFER_SEEK_CUR
	GLSOCKBUFFER_SEEK_END
	
	GLSOCK_TYPE_ACCEPTOR
	GLSOCK_TYPE_TCP
	GLSOCK_TYPE_UDP
	
	GLSOCK_ERROR_SUCCESS
	GLSOCK_ERROR_ACCESSDENIED
	GLSOCK_ERROR_ADDRESSFAMILYNOTSUPPORTED
	GLSOCK_ERROR_ADDRESSINUSE
	GLSOCK_ERROR_ALREADYCONNECTED
	GLSOCK_ERROR_ALREADYSTARTED
	GLSOCK_ERROR_BROKENPIPE
	GLSOCK_ERROR_CONNECTIONABORTED
	GLSOCK_ERROR_CONNECTIONREFUSED
	GLSOCK_ERROR_CONNECTIONRESET
	GLSOCK_ERROR_BADDESCRIPTOR
	GLSOCK_ERROR_BADADDRESS
	GLSOCK_ERROR_HOSTUNREACHABLE
	GLSOCK_ERROR_INPROGRESS
	GLSOCK_ERROR_INTERRUPTED
	GLSOCK_ERROR_INVALIDARGUMENT
	GLSOCK_ERROR_MESSAGESIZE
	GLSOCK_ERROR_NAMETOOLONG
	GLSOCK_ERROR_NETWORKDOWN
	GLSOCK_ERROR_NETWORKRESET
	GLSOCK_ERROR_NETWORKUNREACHABLE
	GLSOCK_ERROR_NODESCRIPTORS
	GLSOCK_ERROR_NOBUFFERSPACE
	GLSOCK_ERROR_NOMEMORY
	GLSOCK_ERROR_NOPERMISSION
	GLSOCK_ERROR_NOPROTOCOLOPTION
	GLSOCK_ERROR_NOTCONNECTED
	GLSOCK_ERROR_NOTSOCKET
	GLSOCK_ERROR_OPERATIONABORTED
	GLSOCK_ERROR_OPERATIONNOTSUPPORTED
	GLSOCK_ERROR_SHUTDOWN
	GLSOCK_ERROR_TIMEDOUT
	GLSOCK_ERROR_TRYAGAIN
	GLSOCK_ERROR_WOULDBLOCK