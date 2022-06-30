package main

import "core:fmt"
import "vendor:raylib"

main :: proc() {
	fmt.println("Hellope!")
    screenWidth:i32 = 800
    screenHeight:i32 = 450
    MAX_FONTS :: 8

    raylib.InitWindow(screenWidth, screenHeight, "raylib [text] example - raylib fonts")
     // NOTE: Textures MUST be loaded after Window initialization (OpenGL context is required)
    fonts:= [MAX_FONTS]raylib.Font{
        raylib.LoadFont("resources/fonts/alagard.png"),
        raylib.LoadFont("resources/fonts/pixelplay.png"),
        raylib.LoadFont("resources/fonts/mecha.png"),
        raylib.LoadFont("resources/fonts/setback.png"),
        raylib.LoadFont("resources/fonts/romulus.png"),
        raylib.LoadFont("resources/fonts/pixantiqua.png"),
        raylib.LoadFont("resources/fonts/alpha_beta.png"),
        raylib.LoadFont("resources/fonts/jupiter_crash.png"),
    };


    messages := [MAX_FONTS]cstring{ "ALAGARD FONT designed by Hewett Tsoi",
                                "PIXELPLAY FONT designed by Aleksander Shevchuk",
                                "MECHA FONT designed by Captain Falcon",
                                "SETBACK FONT designed by Brian Kent (AEnigma)",
                                "ROMULUS FONT designed by Hewett Tsoi",
                                "PIXANTIQUA FONT designed by Gerhard Grossmann",
                                "ALPHA_BETA FONT designed by Brian Kent (AEnigma)",
                                "JUPITER_CRASH FONT designed by Brian Kent (AEnigma)" };

    spacings:=[MAX_FONTS]i32{ 2, 4, 8, 4, 3, 4, 4, 1 };

    positions:= [MAX_FONTS]raylib.Vector2{ 0,0,0,0,0,0,0,0 };

    for i := 0; i < MAX_FONTS; i+=1 {
        positions[i].x = f32(screenWidth/2.0) - raylib.MeasureTextEx(fonts[i], messages[i], f32(fonts[i].baseSize*2.0), f32(spacings[i])).x/2
        positions[i].y = f32(60) + f32(fonts[i].baseSize) + f32(45.0*i)
    }

    // Small Y position corrections
    positions[3].y += 8;
    positions[4].y += 2;
    positions[7].y -= 8;

    colors:=[MAX_FONTS]raylib.Color { raylib.MAROON, raylib.ORANGE, raylib.DARKGREEN, raylib.DARKBLUE, raylib.DARKPURPLE, raylib.LIME, raylib.GOLD, raylib.RED };

    raylib.SetTargetFPS(60);               // Set our game to run at 60 frames-per-second
    //--------------------------------------------------------------------------------------

    // Main game loop
    for {
        // Detect window close button or ESC key
        if raylib.WindowShouldClose(){
            break;
        }
        // Update
        //----------------------------------------------------------------------------------
        // TODO: Update your variables here
        //----------------------------------------------------------------------------------

        // Draw
        //----------------------------------------------------------------------------------
        raylib.BeginDrawing();

            raylib.ClearBackground(raylib.RAYWHITE);

            raylib.DrawText("free fonts included with raylib", 250, 20, 20, raylib.DARKGRAY);
            raylib.DrawLine(220, 50, 590, 50, raylib.DARKGRAY);

            for i := 0; i < MAX_FONTS; i+=1 {
                raylib.DrawTextEx(fonts[i], messages[i], positions[i], f32(fonts[i].baseSize*2.0), f32(spacings[i]), colors[i]);
            }

        raylib.EndDrawing();
        //----------------------------------------------------------------------------------
    }

    // De-Initialization
    //--------------------------------------------------------------------------------------

    // Fonts unloading
    for i := 0; i < MAX_FONTS; i+=1{
       raylib.UnloadFont(fonts[i]);
    }

    raylib.CloseWindow();                 // Close window and OpenGL context
    //--------------------------------------------------------------------------------------

}