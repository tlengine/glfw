project "GLFW"
	language "C"
	kind "StaticLib"
	warnings "Off"
	
	targetdir "%{OutputDir.Binaries}/%{prj.name}"
	objdir    "%{OutputDir.Intermediates}/%{prj.name}"
	
	files
	{
		"include/GLFW/glfw3.h",
		"include/GLFW/glfw3native.h",
		"include/glfw_config.h",
		"src/context.c",
		"src/init.c",
		"src/input.c",
		"src/monitor.c",
		
		"src/null_init.c",
		"src/null_joystick.c",
		"src/null_monitor.c",
		"src/null_window.c",
		
		"src/platform.c",
		"src/vulkan.c",
		"src/window.c"
	}
	
	filter "system:windows"
		systemversion "latest"
		files
		{
			"src/win32_init.c",
			"src/win32_joystick.c",
			"src/win32_module.c",
			"src/win32_monitor.c",
			"src/win32_time.c",
			"src/win32_thread.c",
			"src/win32_window.c",
			"src/wgl_context.c",
			"src/egl_context.c",
			"src/osmesa_context.c"
		}
		defines
		{
			"_GLFW_WIN32",
			"_CRT_SECURE_NO_WARNINGS"
		}
	
	filter "system:linux"
		files
		{
			"src/x11_init.c",
			"src/x11_monitor.c",
			"src/x11_window.c",
			"src/xkb_unicode.c",
			"src/posix_module.c",
			"src/posix_time.c",
			"src/posix_thread.c",
			"src/posix_module.c",
			"src/posix_pull.c",
			"src/glx_context.c",
			"src/egl_context.c",
			"src/osmesa_context.c",
			"src/linux_joystick.c"
		}
		defines
		{
			"_GLFW_X11"
		}
	
	filter "configurations:Development"
		runtime "Debug"
		symbols "On"
	
	filter "configurations:Preview"
		runtime "Release"
		optimize "Speed"
	
	filter "configurations:Shipping"
		runtime "Release"
		optimize "Speed"
	