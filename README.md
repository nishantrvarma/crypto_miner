# Crypto Miner


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `project1` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:project1, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/project1](https://hexdocs.pm/project1).




Bitcoins are the most popular crypto-currency in common use. At their heart, bitcoins use the hardness of cryptographic hashing (SHA-256) to ensure a limited “supply” of coins. 
The goal of this first project is to use Elixir and the actor model to build a good solution to this problem that runs well on multi-core machines. 
In this project, I implemented a server which has a miner and a listener module. The miner module keeps mining for bitcoins while the listener module waits to see if any other workers (hosts) make their presence available. If available, the server assigns the worker to start mining by providing it with a random seed value to begin mining from. Once the worker finds bitcoins, it notifies the server which subsequently prints the bitcoin as output.

•	Size of the work unit that results in best performance 

	The server assigns each worker with a new random seed appended with a counter. 
	This counter ticks from 0 to infinity and prevents any of the workers from having a 
	collision with any one else by mining the same bitcoins. In this way the entire space of minable
  	coins are covered. In this scheme, each worker can proceed upto a limit of 2^32 work units in
  	total.
•	Result of running the program for ./project1 4

	vgoyalICCFCUYE2800      	000088906B627E733CDCA836019C97B6B36B13A843A069BF567CEF9376EA857E
	vgoyalZHWAJQMT2016      	0000DA312CE0CF9D879A47DB4E09B4A18C11957E243C8B0CBDB61D36969C3DAC
	vgoyalICCFCUYE11640     	000015EFABA3F84A795FA33A5337D39F166FB3504C94B76D06CB4AAB0585BBDE
	vgoyalZHWAJQMT13488     	0000836C5F9333CFCCD4F0F4AC06B8DADDCA69DA6134732BE3A636917D11BFC4
	vgoyalICCFCUYE57766     	00006BBDE1401FC82A3879C2741B2D75185478A761A66D5DA96C8151362BAA74
	vgoyalQIHZSUE41995      	00008EBD5EDE5C8844CF692BB05DACE39CA3E583CF4D49B38CD2DA3FDEF083B9
	vgoyalQIHZSUE78027      	0000F7208CB30ECE99B68F935C75893D70393832C49536EB9CBE20365EB338AA
	vgoyalICCFCUYE169164    	0000A0A8914C38CBFE8988D2072B2A4BC6F2948894ABFFA7612C1561E049497D
	vgoyalMEHGXLXI87371     	000042C1B1506EF338C60908E5742AA33BFFF2545ACA1BE20B178468AD6ABBB8
	vgoyalQIHZSUE100942     	000077563AC13758A1038C1FDA02813CB601E6C5E227F7B0FC9BFB709754897D
	vgoyalMEHGXLXI102882    	00000CF297156FF68981BC52C450DBF3B127E688F24122C53EA62F2A59F7B9F8
	vgoyalZHWAJQMT126351    	00000972EB56DFC7AC4B9AE923BC7EA176FBA7582792238DA0C3DA1AA7127B7C
	vgoyalICCFCUYE278604    	00005BCFC29C06DF2BE5F9574E3A42C93BA6BD7D01C1B12139188D4A56E6EF52
	vgoyalMEHGXLXI161270    	0000F83FA708B5A1609D0CBE0B83C3E2F36163509998BECD8384047CDC04B035
	vgoyalZHWAJQMT186260    	00006BAA94E5DEAFA8BA2E4B2166928D68E3ACEB048E2D3C3A3AF3C3E6D28516
	vgoyalMEHGXLXI199887    	00005B4019C1BC9938A6D040B2E7524146E330486BF6A6E2D9E14E8EED73C943
•	Running time on ./project1 5

	On running time ./project1 5, the ratio of CPU time to Real time obtained was observed as 3.2 . This can be seen as a 320% CPU 		utilization on a 4-core machine.  

•	  Coin with the most 0s

	The coin with most zeroes that was mined had 7 zeroes. 
	Coin : vgoyalCLCITLN29268264	Hash:000000059D20F6D6522140277649106A990C771C80775BE212C687B04048EEAB
•	  Largest number of working machines able to run code with	

	The code was able to handle being run by 4 machines. It could be more if we could manage to
   	arrange 4 machines to run the code at once.
