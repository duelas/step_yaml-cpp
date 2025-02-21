project "yaml-cpp"
	kind "StaticLib"
	language "C++"

	targetdir ("bin/%{cfg.system}-%{cfg.architecture}/%{prj.name}")
	objdir ("bin-int/%{cfg.system}-%{cfg.architecture}/%{prj.name}")
	
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
		runtime "Debug"
		optimize "on"
		
	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

    filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"