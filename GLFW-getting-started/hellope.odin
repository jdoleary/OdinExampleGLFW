package main

import "core:fmt"
import "vendor:glfw"
import "core:runtime"

main :: proc() {
	fmt.println("Hellope!")
	if glfw.Init() == 0 {
		glfw.Terminate()
	}
	error_callback :: proc "cdecl" (error: i32, description: cstring) {
		context = runtime.default_context()
		fmt.printf("Error: %s\n", description)
	}
	glfw.SetErrorCallback(error_callback)
	window: glfw.WindowHandle = glfw.CreateWindow(640, 480, "My Title", nil, nil)
	glfw.MakeContextCurrent(window)
	glfw.SwapInterval(1)
	for !glfw.WindowShouldClose(window) {
		glfw.SwapBuffers(window)
		glfw.PollEvents()

	}
	glfw.DestroyWindow(window)
	glfw.Terminate()
}