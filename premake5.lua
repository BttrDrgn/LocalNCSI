project_name = io.readfile("./tools/project_name");
print("Project Name: " .. project_name);

app_name = io.readfile("./tools/app_name");
print("App Name: " .. app_name);

workspace(project_name)
	location "./build/"
	startproject(project_name)

	targetdir "%{wks.location}/bin/%{prj.name}/%{cfg.buildcfg}/%{cfg.platform}/"
	objdir "%{wks.location}/obj/%{prj.name}/%{cfg.buildcfg}/%{cfg.platform}/"
	buildlog "%{wks.location}/obj/%{prj.name}/%{cfg.platform}/%{cfg.buildcfg}/%{prj.name}.log"

	largeaddressaware "on"
	editandcontinue "off"
	staticruntime "on"

	systemversion "latest"
	characterset "unicode"
	warnings "extra"

	flags {
		"shadowedvariables",
		"multiprocessorcompile",
		"undefinedidentifiers",
	}

	platforms {
		"Win-x86",
		"Win-x64",
	}

	configurations {
		"Release",
		"Debug",
	}

	--x86
	filter "platforms:Win-x86"
		architecture "x86"
	--end

	--x64
	filter "platforms:Win-x64"
		architecture "x86_64"
	--end

	filter "Release"
		defines "NDEBUG"
		optimize "full"
		runtime "release"
		symbols "off"

	filter "Debug"
		defines "DEBUG"
		optimize "debug"
		runtime "debug"
		symbols "on"

	project(project_name)
		language "c++"
		cppdialect "c++20"
		warnings "off"

		defines {
			"APPNAME=\""..app_name.."\"",
		}

		kind "consoleapp"

		pchheader "stdafx.hpp"
		pchsource "./src/stdafx.cpp"
		forceincludes "stdafx.hpp"

		includedirs {
			"./src/",
			"./deps/cpp-httplib/",
		}

		files {
			"./src/**",
		}
