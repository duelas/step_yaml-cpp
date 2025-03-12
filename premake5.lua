project "yaml-cpp"
	kind "StaticLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"src/**.h",
		"src/**.cpp",
		
		"include/**.h"
	}

	includedirs
	{
		"include"
	}

	postbuildcommands
	{
		"{COPYDIR} \"%{cfg.targetdir}/%{prj.name}.lib\" \"%{wks.location}/projectmodule/Lib\""
	}
	
	filter "system:windows"
		systemversion "latest"
		cppdialect "C++20"
		staticruntime "off"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++20"
		staticruntime "off"
		
	filter "system:macos"
		systemversion "latest"
		cppdialect "C++20"
		staticruntime "off"
		
	filter "configurations:Editor_Debug"
		runtime "Debug"
		symbols "On"		
		
	filter "configurations:Editor_Release"
		runtime "Release"
		optimize "On"
		symbols "off"
		
	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"
		postbuildcommands	{	"{COPYDIR} \"%{cfg.targetdir}/%{prj.name}.lib\" \"%{wks.location}/projectmodule/Lib\""	}
		
	filter "configurations:Release"
		runtime "Release"
		optimize "on"
		postbuildcommands	{	"{COPYDIR} \"%{cfg.targetdir}/%{prj.name}.lib\" \"%{wks.location}/projectmodule/Lib\""	}
		
    filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"		
		postbuildcommands	{	"{COPYDIR} \"%{cfg.targetdir}/%{prj.name}.lib\" \"%{wks.location}/projectmodule/Lib\""	}