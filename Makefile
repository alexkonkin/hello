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
