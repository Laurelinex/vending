include(FetchContent)

FetchContent_Declare(catch2
        GIT_REPOSITORY git@github.com:catchorg/Catch2.git
        GIT_TAG 5c88067bd339465513af4aec606bd2292f1b594a)
FetchContent_GetProperties(catch2)

if(NOT catch2_POPULATED)
    FetchContent_Populate(catch2)
endif()

FetchContent_Declare(trompeloeil
        GIT_REPOSITORY git@github.com:rollbear/trompeloeil.git
        GIT_TAG 83f7d0cdbb08c68fe29b17c6672ae845a301a103)
FetchContent_GetProperties(trompeloeil)

if(NOT trompeloeil_POPULATED)
    FetchContent_Populate(trompeloeil)
    add_subdirectory(${trompeloeil_SOURCE_DIR} ${trompeloeil_BINARY_DIR})
endif()
