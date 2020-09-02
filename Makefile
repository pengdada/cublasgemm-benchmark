CUDA_HOME?=$(shell echo ~)/local/cuda-10.0
CC := nvcc 
CUDA_ARCH_FLAGS ?= -arch=sm_35
CFLAGS := --std=c++11 -lpthread 
CFLAGS += -I$(CUDA_HOME)/include 
CFLAGS += -L$(CUDA_HOME)/lib64 -lcuda -lcublas
CFLAGS += -L$(CUDA_HOME)/targets/x86_64-linux/lib/stubs/ -lnvidia-ml

TARGET := gemm
SRCS := $(wildcard *.cpp)
OBJS := $(patsubst %cpp,%o,$(SRCS))

all:
	$(CC) $(CFLAGS) *.cpp -o $(TARGET) 
clean:
	rm -rf $(TARGET) *.o

