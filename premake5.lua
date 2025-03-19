project "glfw"
	language "c"
	kind "staticlib"
	warnings "off"
	
	targetdir "%{outdir.bin}/%{prj.name}"
	objdir    "%{outdir.obj}/%{prj.name}"
	
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
			"src/glx_context.c",
			"src/egl_context.c",
			"src/osmesa_context.c",
			"src/linux_joystick.c"
		}
		defines
		{
			"_GLFW_X11"
		}
	
	filter "configurations:devel"
		runtime "debug"
		symbols "on"
	
	filter "configurations:prev"
		runtime "release"
		optimize "speed"
	
	filter "configurations:ship"
		runtime "release"
		optimize "speed"
	