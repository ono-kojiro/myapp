project(myapp)

add_executable(myapp
  myapp.c
)

include_directories(${CMAKE_BINARY_DIR})

install(TARGETS myapp
    EXPORT myapp)



