# Generic Makefile for C++ Projects
CPU_VENDOR := $(shell grep vendor_id /proc/cpuinfo | head -n 1 | cut -d ' ' -f 2)

# Compiler
ifeq ($(CPU_VENDOR),AuthenticAMD)
#    CXX = aocc
	CXX = g++
else ifeq ($(CPU_VENDOR),GenuineIntel)
    CXX = icpc
else
	CXX = g++
endif

# Compiler Flags
CXXFLAGS = -Wall -Werror -Wextra -std=c++11

# Flags
DEBUG_FLAGS = -g
OPT_FLAGS = -O3

# Source files
SRCS = $(wildcard *.cpp)

# Object files
OBJS = $(SRCS:.cpp=.o)

# Folders
SRCDIR = src
BUILDDIR = build
INCDIR = include

# Target executable
TARGET = multicell_abm

#Esto esta re de mas pero por ahora queda
# Check if the CPU is an AMD or Intel CPU
#CPU_BITS := $(shell uname -p)
ifeq ($(CPU_VENDOR),AuthenticAMD)
    CXXFLAGS += -march=native
    OPENMP_FLAGS = -fopenmp
else ifeq ($(CPU_VENDOR),GenuineIntel)
    CXXFLAGS += -march=native
    OPENMP_FLAGS = -qopenmp
#else ifeq ($(CPU_BITS),x86_64)
else ifeq ($(shell uname -p),x86_64)
    CFLAGS += -march=native
endif

# Default build type is release build
BUILD_TYPE ?= RELEASE

ifeq ($(BUILD_TYPE),DEBUG)
    CXXFLAGS += $(DEBUG_FLAGS)
else ifeq ($(BUILD_TYPE),RELEASE)
    CXXFLAGS += $(RELEASE_FLAGS) $(OPENMP_FLAGS)
else
    $(error "Unknown build type: $(BUILD_TYPE)")
endif

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) $(OBJS) -o $(TARGET)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)

