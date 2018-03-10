defmodule Master do
    def runMaster(k) do    
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
        
        Node.start(String.to_atom("master@"<>ip))
        Node.set_cookie(Node.self(), :"cookiename")

        noOfCores = :erlang.system_info(:schedulers_online)
        Master.spawnActors(ip, k, noOfCores)

    end

    def spawnActors(ip, k, cores) do
        if cores>0 do
            pid_miner = Node.spawn(String.to_atom("master@"<>ip), Master, :miner, [k])
            pid_listner = Node.spawn(String.to_atom("master@"<>ip), Master, :clientdetect, [k,0])
            cores=cores-1
        end
        if cores>0 do
            spawnActors(ip, k, cores)
        end
    end
    
    def miner(k) do
        StringGenerator.abc(k)
        miner(k)
    end
    
    def clientdetect(k, count)  do
        clientmachine = Enum.at(Node.list ,count)
        noCores = :erlang.system_info(:schedulers_online)
        if length(Node.list)>count do
            spawnActorsOnWorkers(Enum.at(Node.list ,count), k, noCores)            
            count = count+1
        end
        clientdetect(k, count)
    end

    def spawnActorsOnWorkers(clientMachine, k, noCores) do
        if noCores>0 do
            pid = Node.spawn(clientMachine, Worker, :mine, [k] );
            send pid, {:message, "master"};
            noCores=noCores-1
        end
        if noCores>0 do
            spawnActorsOnWorkers(clientMachine, k, noCores)
        end
    end    
end