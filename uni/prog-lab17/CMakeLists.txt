cmake_minimum_required(VERSION 3.0.0)
project(prog_lab_17 VERSION 0.1.0)

include(CTest)
enable_testing()

link_libraries(sfml-graphics sfml-window sfml-system)
add_executable(prog_lab_17 main.cpp)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
