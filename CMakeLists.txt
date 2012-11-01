# Project setup
PROJECT(entities)
SET(VERSION_MAJOR "0")
SET(VERSION_MINOR "1")
SET(VERSION_PATCH "1")
CMAKE_MINIMUM_REQUIRED(VERSION 2.6.0 FATAL_ERROR) 


# Compiler setup
SET(CMAKE_C_FLAGS "-std=c99")
SET(CMAKE_C_FLAGS_DEBUG "-std=c99 -g -DDEBUG")
SET(CMAKE_C_FLAGS_RELEASE "-std=c99 -O2")


# Build library
ADD_LIBRARY(entities STATIC
	entities.c
)


# Build unit cases
ADD_EXECUTABLE(test-entities
	t-entities.c
)
TARGET_LINK_LIBRARIES(test-entities entities)

