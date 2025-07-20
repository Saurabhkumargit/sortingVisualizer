@echo off
setlocal

echo === Building Sorting Visualizer ===

:: Set SDL2 paths
set SDL_INCLUDE=C:\Users\saura\libraries\SDL2-devel-2.28.5-mingw\SDL2-2.28.5\x86_64-w64-mingw32\include\SDL2
set SDL_LIB=C:\Users\saura\libraries\SDL2-devel-2.28.5-mingw\SDL2-2.28.5\x86_64-w64-mingw32\lib
set SDL_BIN=C:\Users\saura\libraries\SDL2-devel-2.28.5-mingw\SDL2-2.28.5\x86_64-w64-mingw32\bin

:: Compile the project
g++ "Sorting Visualizer.cpp" -I%SDL_INCLUDE% -L%SDL_LIB% -lmingw32 -lSDL2main -lSDL2 -o SortingVisualizer.exe

if errorlevel 1 (
    echo ❌ Build failed.
    pause
    exit /b
)

echo ✅ Build successful.

:: Copy SDL2.dll if not already present
if not exist "SDL2.dll" (
    echo Copying SDL2.dll...
    copy "%SDL_BIN%\SDL2.dll" . >nul
)

:: Run the program
echo Launching Sorting Visualizer...
SortingVisualizer.exe

endlocal
pause
