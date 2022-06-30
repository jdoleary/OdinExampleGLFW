package main

import "core:fmt"
import "vendor:raylib"

main :: proc() {
	fmt.println("Hellope!")
    screenWidth:i32 = 800
    screenHeight:i32 = 450
    raylib.InitWindow(screenWidth, screenHeight, "raylib test input")
    raylib.SetTargetFPS(60);               // Set our game to run at 60 frames-per-second
    for {
        // Detect window close button or ESC key
        if raylib.WindowShouldClose(){
            break;
        }
        // NOTE!!! There is currently an issue where IsKeyPressed and GetKeyPressed
        // don't work if there is also a call to BeginDrawing in the loop.
        // https://github.com/raysan5/raylib/issues/2379
        //raylib.BeginDrawing();
        //raylib.ClearBackground(raylib.RAYWHITE);
        //raylib.EndDrawing();
        raylib.PollInputEvents();
        if raylib.IsKeyPressed(raylib.KeyboardKey.ONE){
            fmt.println("Key pressed: 1");
        }
    }

    // De-Initialization
    //--------------------------------------------------------------------------------------
    
    raylib.CloseWindow();                 // Close window and OpenGL context
    //--------------------------------------------------------------------------------------

}