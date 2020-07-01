cmake_minimum_required(VERSION 3.14.3)

project(triangle)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

add_subdirectory(3rd_party/glfw 3rd_party/glfw EXCLUDE_FROM_ALL)
add_subdirectory(3rd_party/glm 3rd_party/glm EXCLUDE_FROM_ALL)


add_library(vulkan SHARED IMPORTED)
target_include_directories(vulkan INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/vulkan/include)
set_target_properties(vulkan PROPERTIES
  IMPORTED_LOCATION "${CMAKE_CURRENT_SOURCE_DIR}/vulkan/lib/libvulkan.so"
  )



add_executable(triangle)
target_link_libraries(triangle PRIVATE
  glfw
  glm
  vulkan
  )
target_include_directories(triangle PRIVATE
  ${CMAKE_CURRENT_SOURCE_DIR}/src
  )

file(GLOB SYNE_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp ${CMAKE_CURRENT_SOURCE_DIR}/src/**/*.cpp)
target_sources(triangle PRIVATE ${SYNE_SOURCES})
