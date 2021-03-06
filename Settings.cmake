####################################
# Options for the external package #
####################################


## INCLUDED BY CPM

# doctest
set(DOCTEST_REPOSITORY "onqtam/doctest")
set(DOCTEST_VERSION "master")

# CLI11
set(CLI11_REPOSITORY "CLIUtils/CLI11")
set(CLI11_VERSION "master")

# FlakedTuna
set(FLAKEDTUNA_REPOSITORY "flagarde/FlakedTuna")
set(FLAKEDTUNA_VERSION "master")

##

# OpenSSL
set(OPENSSL_REPOSITORY "https://github.com/flagarde/openssl-cmake.git")
set(OPENSSL_TAG "master")
# option(SYSTEM_OPENSSL "Try to use system OpenSSL" OFF) zlib-ng
set(ZLIB-NG_REPOSITORY "https://github.com/zlib-ng/zlib-ng.git")
set(ZLIB-NG_TAG "develop")
# IXWebSocket
set(IXWEBSOCKET_REPOSITORY "https://github.com/machinezone/IXWebSocket.git")
set(IXWEBSOCKET_TAG "master")
# jsoncpp
set(JSONCPP_REPOSITORY "https://github.com/open-source-parsers/jsoncpp.git")
set(JSONCPP_TAG "master")
# elogpp
set(ELOGPP_REPOSITORY "https://github.com/RPClab/elogpp.git")
set(ELOGPP_TAG "master")

# fmt
set(FMT_REPOSITORY "https://github.com/fmtlib/fmt.git")
set(FMT_VERSION "master")
# spdlog
set(SPDLOG_REPOSITORY "https://github.com/gabime/spdlog.git")
set(SPDLOG_VERSION "v1.x")

set(serial_repository "https://github.com/RPClab/serial")
set(serial_version "master")

# CAENlibs
set(CAENlibs_repository "https://github.com/RPClab/CAENlibs.git")
set(CAENlibs_version "master")


# soci
set(soci_repository "https://github.com/SOCI/soci.git")
set(soci_version "master")
# toml11
set(toml11_repository "https://github.com/ToruNiina/toml11.git")
set(toml11_version "master")

# civet
set(civet_repository "https://github.com/civetweb/civetweb.git")
set(civet_version "master")
# magic_enum
set(magic_enum_repository "https://github.com/sachnk/magic_enum.git")
set(magic_enum_version "master")
# jsroot
set(jsroot_repository "https://github.com/root-project/jsroot.git")
set(jsroot_version "master")

# cereal
set(cereal_repository "https://github.com/USCiLab/cereal.git")
set(cereal_version "master")

set(SNMP_repository "https://github.com/RPClab/net-snmp.git")
set(SNMP_version "master")




# Compiling ROOT can be very long so :
option(USE_ROOT "Try to find a ROOT installation and use it" ON)
option(BUILD_ROOT "Build ROOT Folder" ON)
set(LOOK_FOR_ROOT_VERSION "6.20.06")
# If it fails to find ROOT V${LOOK_FOR_ROOT_VERSION} or greater then Download and Install it !
set(ROOT_repository "https://root.cern/download/root_v${LOOK_FOR_ROOT_VERSION}.source.tar.gz")
# ########################################################################################################################################################################################################################################################

option(ENABLE_TESTS "Include tests folder" ON)
option(ENABLE_DOCS "Include docs folder" ON)
option(BUILD_ANALYSIS "Build the Analysis code" ON)
option(BUILD_WEBSOCKETSERVER "Build the WebSocket Server" ON)
option(BUILD_WEBSERVER "Build the civet webserver" ON)
option(BUILD_CONFIGURATOR "Build Configurator" ON)
option(BUILD_CONTROLLER "Build Controller" ON)
option(BUILD_LOGGER "Build Logger" ON)
option(ENABLE_EXTRAS "Build extras" ON)

option(BUILD_DAQ "Build DAQ" ON)
option(BUILD_SNMP "Build SNMP" OFF)


option(BUILD_LCIO "Build LCIO" OFF)

option(BUILD_OLD_WAVEDUMP "Build the old wavedump to supress in the future" ON)

option(CAEN_HARDWARE "Compile CAEN Hardware library" ON)

option(ENABLE_ALL_WARNINGS "Compile with all warnings for the major compilers" ON)
option(ENABLE_EFFECTIVE_CXX "Enable Effective C++ warnings" OFF)
option(GENERATE_DEPENDENCY_DATA "Generates .d files with header dependencies" ON)

option(ENABLE_DOCTESTS "Include tests in the library. Setting this to OFF will remove all doctest related code.
                        Tests in tests/*.cpp will still be enabled." OFF
       )
