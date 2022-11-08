md build
del /q /f build\*.*
cl /nologo /Fo:"build/main_func.obj" /TP /DWIN32 /D_WINDOWS /GR /EHsc /Zi /DNDEBUG -MD /Zm512 /W4 /EHsc /GL /Gy /Ox /Ob2 /Oi /Ot /Oy- /WX -std:c++20 /FS -c main_func.cpp
cl /nologo /Fo:"build/func_1.obj" /Fd:"build/func_1.pdb" /TP /Gy /Oy- /Zi /GL  /DFUNC_1_SOURCE /DWIN32 /D_WINDOWS /GR /EHsc /EHsc /O1 /Ob1 /DNDEBUG -MD /Zi  -std:c++20 /FS /Zc:__cplusplus -c func_1.cpp

link.exe /nologo /out:"build/func_1.dll" /implib:"build/func_1.lib" /pdb:"build/func_1.pdb" /dll /version:0.0 /machine:x64 /LTCG /DEBUG /INCREMENTAL:NO build/func_1.obj
link.exe /nologo /out:"build/main.exe" /pdb:"build/main.pdb" /version:0.0 /machine:x64 /DEBUG /LTCG /subsystem:console  /SAFESEH:NO /OPT:REF /IGNORE:4099 build/main_func.obj build/func_1.lib