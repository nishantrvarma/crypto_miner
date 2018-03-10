defmodule PROJECT1 do
  def main(args) do
    
    if List.first(args) =~ "." == true do
        Worker.runWorker(List.first(args))
    else      
        temp = String.to_integer(List.first(args))
        Master.runMaster(temp)
    end
    receive do
        {:st} ->
            IO.puts "dummy"
    end
  end
end
