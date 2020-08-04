state ("LittleWitchNobeta", "0.1094+ Early Access") 
{
	bool isLoading : 0x108D74D; 
	byte loadScreen : 0x108D6E1;
}

startup
{
	Action<string> DebugOutput = (text) => {
		print ("[LWN Auto Splitter] " + text);
	};
	vars.DebugOutput = DebugOutput;
	
	DebugOutput ("Auto splitter starting...");
}

init 
{
	int moduleSize = modules.First ().ModuleMemorySize;
	vars.DebugOutput ("Current module size: " + moduleSize);
	
	if (moduleSize == 18976768)
	{
		version = "0.1094+ Early Access";
		vars.DebugOutput ("Version set to " + version);
	}
}

exit
{
	timer.IsGameTimePaused = true;
}

isLoading 
{
	return current.isLoading || (current.loadScreen != 153 && current.loadScreen != 151 && current.loadScreen != 92);
}