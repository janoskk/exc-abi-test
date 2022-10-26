md build
del /q /f build\*.*
cl /nologo /Fo:"build/main_func.obj" /TP /DWIN32 /D_WINDOWS /GR /EHsc /Zi /DNDEBUG -MD /Zm512 /W4 /EHsc /experimental:external /external:W0 /bigobj /GL /Gy /Ox /Ob2 /Oi /Ot /Oy- /WX /wd4100 /wd4244 /wd4101 /wd4505 /wd4706 /wd4702 /wd4458 /wd4456 /wd4457 /wd4459 /wd4099 /wd4127 /wd4251 /wd4267 -std:c++20 /FS -c main_func.cpp
cl /nologo /Fo:"build/func_1.obj" /Fd:"build/func_1.pdb" /TP /Gy /Oy- /Zi /GL  /DWIN32 /D_WINDOWS /GR /EHsc /EHsc /O1 /Ob1 /DNDEBUG -MD /Zi -D_CRT_SECURE_NO_WARNINGS -DU_STATIC_IMPLEMENTATION=1 -DWINVER=0x0601 -D_WIN32_WINNT=0x0601 -std:c++14 /FS /Zc:__cplusplus -c func_1.cpp
cl /nologo /Fo:"build/func_2.obj" /Fd:"build/func_2.pdb" /TP /Gy /Oy- /Zi /GL  /DWIN32 /D_WINDOWS /GR /EHsc /EHsc /O1 /Ob1 /DNDEBUG -MD /Zi -D_CRT_SECURE_NO_WARNINGS -DU_STATIC_IMPLEMENTATION=1 -DWINVER=0x0601 -D_WIN32_WINNT=0x0601 -std:c++14 /FS /Zc:__cplusplus -c func_2.cpp

link.exe /nologo /out:"build/func_1.dll" /implib:"build/func_1.lib" /pdb:"build/func_1.pdb" /dll /version:0.0 /machine:x64 /LTCG /DEBUG /INCREMENTAL:NO build/func_1.obj
link.exe /nologo /out:"build/func_2.dll" /implib:"build/func_2.lib" /pdb:"build/func_2.pdb" /dll /version:0.0 /machine:x64 /LTCG /DEBUG /INCREMENTAL:NO build/func_1.lib build/func_2.obj
link.exe /nologo /out:"build/main.exe" /pdb:"build/main.pdb" /version:0.0 /machine:x64 /DEBUG /LTCG /subsystem:console  /SAFESEH:NO /OPT:REF /IGNORE:4099 build/main_func.obj build/func_1.lib build/func_2.lib