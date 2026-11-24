DragonBloodAudio —— SKSE 插件工程（编译出 DragonBloodAudio.dll）
===============================================================

为什么要它：Magelight 页面是 Ultralight，没有媒体栈放不了声音；
Papyrus 也没有任何播放文件/改音量的接口。所以自定义音效、BGM、
静音本体音乐三件事只能在这个 C++ 插件里做（和天际昆特牌的 Skygwent.dll 同一套思路）。

编出来的 dll 放到模组根目录的 SKSE\Plugins\ 下。

A. GitHub Actions（最省事）
   把本目录推到你的仓库，.github/workflows/build.yml 会自动：
   windows-latest + MSVC + vcpkg + colorglass 的 commonlibsse-ng overlay port
   （triplet x64-windows-static-md），产出 DragonBloodAudio.zip 与 dll。
   前提：仓库里要有 CommonLibSSE-NG 的 vcpkg 端口（workflow 会自动 clone）。

B. 本机 Visual Studio 2022
   1) git clone --depth 1 https://github.com/microsoft/vcpkg C:\vcpkg
      C:\vcpkg\bootstrap-vcpkg.bat -disableMetrics
   2) git clone --depth 1 https://gitlab.com/colorglass/vcpkg-colorglass C:\clports
   3) 在本目录下执行：
      cmake -S . -B build -G "Visual Studio 17 2022" -A x64 ^
        -DCMAKE_TOOLCHAIN_FILE=C:/vcpkg/scripts/buildsystems/vcpkg.cmake ^
        -DVCPKG_TARGET_TRIPLET=x64-windows-static-md ^
        -DVCPKG_OVERLAY_PORTS=C:/clports/ports
      cmake --build build --config Release
   4) build\Release\DragonBloodAudio.dll → SKSE\Plugins\

依赖：SKSE64 + Address Library（编译用 USE_ADDRESS_LIBRARY，运行期靠它找函数地址）
