function(CHECK_MIB)
  if(EXISTS "${CMAKE_CURRENT_BINARY_DIR}/netsnmp/mibs/SNMPv2-SMI.txt")
    if(EXISTS "${CMAKE_SOURCE_DIR}/conf/MIB/SNMPv2-SMI.txt")

    else()
      configure_file(${CMAKE_CURRENT_BINARY_DIR}/netsnmp/mibs/SNMPv2-SMI.txt ${CMAKE_SOURCE_DIR}/conf/MIB/SNMPv2-SMI.txt COPYONLY)
    endif()
    if(EXISTS "${CMAKE_SOURCE_DIR}/SNMPv2-TC.txt")

    else()
      configure_file(${CMAKE_CURRENT_BINARY_DIR}/netsnmp/mibs/SNMPv2-TC.txt ${CMAKE_SOURCE_DIR}/conf/MIB/SNMPv2-TC.txt COPYONLY)
    endif()
  endif()
  if(EXISTS "${CMAKE_SOURCE_DIR}/conf/MIB/WIENER-CRATE-MIB.txt")

  else()
    configure_file(conf/WIENER-CRATE-MIB.txt ${CMAKE_SOURCE_DIR}/conf/MIB/WIENER-CRATE-MIB.txt COPYONLY)
  endif()
endfunction(CHECK_MIB)
