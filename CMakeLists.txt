cmake_minimum_required(VERSION 3.24)

project(DragonBloodAudio VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

find_package(CommonLibSSE CONFIG REQUIRED)

# add_commonlibsse_plugin 由 CommonLibSSE-NG 的 cmake/CommonLibSSE.cmake 提供：
# 它会生成 SKSEPluginInfo（版本/兼容运行时）并链接 CommonLibSSE::CommonLibSSE。
add_commonlibsse_plugin(${PROJECT_NAME}
	NAME "DragonBloodAudio"
	AUTHOR "DragonBlood"
	EMAIL "noreply@localhost"
	SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/src/main.cpp
	USE_ADDRESS_LIBRARY
)

# NG 必须用这两个预编译头，RTTI / RE::stl 的宏都在里面
target_precompile_headers(${PROJECT_NAME} PRIVATE <SKSE/SKSE.h> <RE/Skyrim.h>)
