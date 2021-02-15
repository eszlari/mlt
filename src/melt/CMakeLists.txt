add_executable(melt melt.c io.c)
target_link_libraries(melt PRIVATE mlt Threads::Threads)
target_compile_definitions(melt PRIVATE VERSION="${MLT_VERSION}")

if(TARGET SDL2::SDL2)
    target_link_libraries(melt PRIVATE SDL2::SDL2)
    target_compile_definitions(melt PRIVATE HAVE_SDL2)
    if(MINGW)
        target_link_libraries(melt PRIVATE mingw32)
    endif()
endif()

install(TARGETS melt RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
