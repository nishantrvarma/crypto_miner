defmodule Worker do
    def runWorker(arg) do  
        {:ok, addrs} = :inet.getif
        {ipaddr, _, _} = Enum.at(addrs,0)
        {a, b, c, d} = ipaddr
        ip = "#{a}.#{b}.#{c}.#{d}"
        
        if ip == "127.0.0.1" do
            {:ok, addrs}= :inet.getif
            sec = Enum.at(addrs,1)
            {ipaddr, _, _} = sec
            {a, b, c, d} = ipaddr
            ip = "#{a}.#{b}.#{c}.#{d}"
        end

        name = StringGenerator.string_of_length(8) <> "@"
    
        Node.start (String.to_atom(name<>ip))
        Node.set_cookie (:"cookiename")
        Node.connect(String.to_atom("master@"<>arg))
    
    end
    
    def mine(k) do
        receive do
            (str) -> StringGenerator.abc(k)
        end   
        mine(k)
    end  
end