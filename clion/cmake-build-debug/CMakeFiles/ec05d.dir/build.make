# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = "/Users/noahcardoza/Library/Application Support/JetBrains/Toolbox/apps/CLion/ch-0/183.5429.37/CLion.app/Contents/bin/cmake/mac/bin/cmake"

# The command to remove a file.
RM = "/Users/noahcardoza/Library/Application Support/JetBrains/Toolbox/apps/CLion/ch-0/183.5429.37/CLion.app/Contents/bin/cmake/mac/bin/cmake" -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/noahcardoza/projects/c/cis26b/clion

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/noahcardoza/projects/c/cis26b/clion/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/ec05d.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/ec05d.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/ec05d.dir/flags.make

CMakeFiles/ec05d.dir/ec05/_4_va_arg_avg.c.o: CMakeFiles/ec05d.dir/flags.make
CMakeFiles/ec05d.dir/ec05/_4_va_arg_avg.c.o: ../ec05/_4_va_arg_avg.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/noahcardoza/projects/c/cis26b/clion/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/ec05d.dir/ec05/_4_va_arg_avg.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ec05d.dir/ec05/_4_va_arg_avg.c.o   -c /Users/noahcardoza/projects/c/cis26b/clion/ec05/_4_va_arg_avg.c

CMakeFiles/ec05d.dir/ec05/_4_va_arg_avg.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ec05d.dir/ec05/_4_va_arg_avg.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/noahcardoza/projects/c/cis26b/clion/ec05/_4_va_arg_avg.c > CMakeFiles/ec05d.dir/ec05/_4_va_arg_avg.c.i

CMakeFiles/ec05d.dir/ec05/_4_va_arg_avg.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ec05d.dir/ec05/_4_va_arg_avg.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/noahcardoza/projects/c/cis26b/clion/ec05/_4_va_arg_avg.c -o CMakeFiles/ec05d.dir/ec05/_4_va_arg_avg.c.s

# Object files for target ec05d
ec05d_OBJECTS = \
"CMakeFiles/ec05d.dir/ec05/_4_va_arg_avg.c.o"

# External object files for target ec05d
ec05d_EXTERNAL_OBJECTS =

ec05d: CMakeFiles/ec05d.dir/ec05/_4_va_arg_avg.c.o
ec05d: CMakeFiles/ec05d.dir/build.make
ec05d: CMakeFiles/ec05d.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/noahcardoza/projects/c/cis26b/clion/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ec05d"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ec05d.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/ec05d.dir/build: ec05d

.PHONY : CMakeFiles/ec05d.dir/build

CMakeFiles/ec05d.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ec05d.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ec05d.dir/clean

CMakeFiles/ec05d.dir/depend:
	cd /Users/noahcardoza/projects/c/cis26b/clion/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/noahcardoza/projects/c/cis26b/clion /Users/noahcardoza/projects/c/cis26b/clion /Users/noahcardoza/projects/c/cis26b/clion/cmake-build-debug /Users/noahcardoza/projects/c/cis26b/clion/cmake-build-debug /Users/noahcardoza/projects/c/cis26b/clion/cmake-build-debug/CMakeFiles/ec05d.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ec05d.dir/depend
