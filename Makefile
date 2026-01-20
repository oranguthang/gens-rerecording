# Gens-rr Makefile
# Requires Visual Studio 2022 with MSBuild
# Note: Only Release builds supported (Starscream subprojects lack Debug config)

MSBUILD = "C:/Program Files/Microsoft Visual Studio/2022/Community/MSBuild/Current/Bin/MSBuild.exe"
PROJECT = Gens.vcxproj
PLATFORM = Win32
TOOLSET = v143

.PHONY: all release clean

all: release

release:
	@echo "Building Release..."
	$(MSBUILD) $(PROJECT) -p:Configuration=Release -p:Platform=$(PLATFORM) -p:PlatformToolset=$(TOOLSET) -v:minimal
	@echo "Output: Output/Gens.exe"

clean:
	@echo "Cleaning..."
	$(MSBUILD) $(PROJECT) -t:Clean -p:Configuration=Release -p:Platform=$(PLATFORM) -v:minimal
	-@rmdir /s /q Release 2>nul
	-@rmdir /s /q Debug 2>nul
	-@del /q Output\*.exe Output\*.pdb Output\*.ilk 2>nul
	@echo "Clean complete"
