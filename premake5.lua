project "PDCurses"
    kind "StaticLib"
    language "C"
    cdialect "C11"

    configurations {
        "Debug",
        "Release"
    }

    files {
        "Source/**.c",
        "Source/**.h",
        "Source/pdcurses.rc"
    }

    includedirs {
        "Source"
    }

    vpaths {
        ["Header Files"] = "Source/**.h",
        ["Source Files/*"] = "Source/**.c",
        ["Resource Files"] = "Source/pdcurses.rc"
    }

    defines {
        "WINDOWS"
    }

    filter { "configurations:Debug" }
        defines {
            "_CRT_SECURE_NO_WARNINGS",
            "HAVE_VSNPRINTF",
            "_DEBUG",
            "PDC_WIDE",
            "_LIB"
        }
        buildoptions "/MTd"
        runtime "Debug"
        symbols "on"
    
    filter { "configurations:Release" }
        defines {
            "_CRT_SECURE_NO_WARNINGS",
            "HAVE_VSNPRINTF",
            "NDEBUG",
            "PDC_WIDE",
            "_LIB"
        }
        buildoptions "/MT"
        runtime "Release"
        optimize "on"