cmake_minimum_required(VERSION 3.10)
project(MySDBusApp)

set(CMAKE_CXX_STANDARD 17)

find_package(sdbus-c++ REQUIRED)

add_executable(main test.cpp)

target_link_libraries(main sdbus-c++)
