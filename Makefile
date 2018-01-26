CC      = gcc
CFLAGS  = -g
RM      = rm -f

PROJECT_NAME ?= test

default: all

all: Hello

Hello: Hello.c
	@echo PROJECT_NAME is $(PROJECT_NAME)
	@echo "-----------------------------"
	$(CC) -DPROJECT_NAME=$(PROJECT_NAME) $(CFLAGS) -o Hello Hello.c

clean veryclean:
	$(RM) Hello

BINARY_OUTPUT := $(shell ./Hello | awk '{print $$3}'| sed 's/[][]//g')
CONFIG_FILE := $(shell cat job_parameters_setup.sh | grep PROJECT_NAME | awk '{print $$2}' | awk -F'=' '{print $$2}')
test:
	if [ $(CONFIG_FILE) = $(BINARY_OUTPUT) ];then echo "TEST PASSED"; exit 0;else exit 1;fi
