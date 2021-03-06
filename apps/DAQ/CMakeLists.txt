root_generate_dictionary(G__Channel "include/Channel.hpp" LINKDEF "include/ChannelLinkDef.hpp")
add_library(Channel OBJECT "src/Channel.cpp" G__Channel.cxx)
add_dependencies(Channel ROOT)
target_include_directories(Channel PRIVATE "${YAODAQ_INCLUDE}" PRIVATE "./include")
target_link_libraries(Channel INTERFACE ROOT)
add_library(Channel_static STATIC $<TARGET_OBJECTS:Channel>)
target_link_libraries(Channel_static INTERFACE ROOT)
target_include_directories(Channel_static PUBLIC $<BUILD_INTERFACE:${YAODAQ_INCLUDE}> PUBLIC $<INSTALL_INTERFACE:${INCLUDE_OUTPUT_DIR}>)
add_library(Channel_shared SHARED $<TARGET_OBJECTS:Channel>)
target_link_libraries(Channel_shared PUBLIC ROOT)
target_include_directories(Channel_shared PUBLIC $<BUILD_INTERFACE:${YAODAQ_INCLUDE}> PUBLIC $<INSTALL_INTERFACE:${INCLUDE_OUTPUT_DIR}>)
add_custom_target(CopyChannel DEPENDS ALL COMMAND ${CMAKE_COMMAND} -E copy libChannel_rdict.pcm "${RUNTIME_OUTPUT_DIRECTORY}/libChannel_rdict.pcm")
set_target_properties(Channel PROPERTIES PUBLIC_HEADER "include/Channel.hpp")
install(TARGETS Channel RUNTIME DESTINATION bin LIBRARY DESTINATION ${LIBRARY_OUTPUT_DIR} ARCHIVE DESTINATION ${ARCHIVE_OUTPUT_DIR} PUBLIC_HEADER DESTINATION include)
root_generate_dictionary(G__Event "include/Event.hpp" LINKDEF "include/EventLinkDef.hpp")
add_library(Event OBJECT "src/Event.cpp" G__Event.cxx)
add_dependencies(Event ROOT)
target_include_directories(Event PRIVATE "${YAODAQ_INCLUDE}" PRIVATE "./include")
target_link_libraries(Event INTERFACE ROOT)
add_library(Event_static STATIC $<TARGET_OBJECTS:Event>)
target_include_directories(Event_static PUBLIC $<BUILD_INTERFACE:${YAODAQ_INCLUDE}> PUBLIC $<INSTALL_INTERFACE:${INCLUDE_OUTPUT_DIR}>)
target_link_libraries(Event_static INTERFACE ROOT)
add_library(Event_shared SHARED $<TARGET_OBJECTS:Event>)
target_include_directories(Event_shared PUBLIC $<BUILD_INTERFACE:${YAODAQ_INCLUDE}> PUBLIC $<INSTALL_INTERFACE:${INCLUDE_OUTPUT_DIR}>)
target_link_libraries(Event_shared PUBLIC ROOT PUBLIC Channel_shared)
add_custom_target(CopyEvent DEPENDS ALL COMMAND ${CMAKE_COMMAND} -E copy libEvent_rdict.pcm "${RUNTIME_OUTPUT_DIRECTORY}/libEvent_rdict.pcm")
set_target_properties(Event PROPERTIES PUBLIC_HEADER "include/Event.hpp")
install(TARGETS Event RUNTIME DESTINATION bin LIBRARY DESTINATION ${LIBRARY_OUTPUT_DIR} ARCHIVE DESTINATION ${ARCHIVE_OUTPUT_DIR} PUBLIC_HEADER DESTINATION include)

add_library(DAQFile STATIC "src/DAQFile.cpp")
target_include_directories(DAQFile PRIVATE "${YAODAQ_INCLUDE}" PUBLIC "./include")
add_dependencies(DAQFile RootFile)
target_link_libraries(DAQFile PUBLIC RootFile PUBLIC Event_static PUBLIC Channel_static)
set_target_properties(DAQFile PROPERTIES PUBLIC_HEADER "include/DAQFile.hpp")
install(TARGETS DAQFile RUNTIME DESTINATION bin LIBRARY DESTINATION ${LIBRARY_OUTPUT_DIR} ARCHIVE DESTINATION ${ARCHIVE_OUTPUT_DIR} PUBLIC_HEADER DESTINATION include)

add_executable(DAQFileWritter DAQFileWritter.cpp)
add_dependencies(DAQFileWritter Board CLI11)
target_include_directories(DAQFileWritter PRIVATE ${CMAKE_BINARY_DIR})
target_link_libraries(DAQFileWritter PRIVATE Board PRIVATE DAQFile PRIVATE FileWritter PRIVATE CLI11 PRIVATE Interrupt)
install(TARGETS DAQFileWritter RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX})

add_executable(Digitizer Digitizer.cpp)
add_dependencies(Digitizer CAENBoards Board CLI11)
target_include_directories(Digitizer PRIVATE ${CMAKE_BINARY_DIR})
target_link_libraries(Digitizer PRIVATE CAENBoards PRIVATE Board PRIVATE CLI11 PRIVATE Interrupt)
install(TARGETS Digitizer RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX})

add_executable(Analysis Analysis.cpp)
add_dependencies(Analysis CLI11 fmt::fmt)
target_link_libraries(Analysis PRIVATE Event_static PRIVATE Channel_static PRIVATE CLI11 PRIVATE fmt::fmt)
install(TARGETS Analysis RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX})
target_include_directories(Analysis PUBLIC "include/" PUBLIC $<INSTALL_INTERFACE:${INCLUDE_OUTPUT_DIR}>)

add_executable(TemplateAnalysis TemplateAnalysis.cpp)
add_dependencies(TemplateAnalysis CLI11)
target_link_libraries(TemplateAnalysis PRIVATE Event_static PRIVATE Channel_static PRIVATE CLI11)
install(TARGETS TemplateAnalysis RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX})
target_include_directories(TemplateAnalysis PUBLIC "include/" PUBLIC $<INSTALL_INTERFACE:${INCLUDE_OUTPUT_DIR}>)
