find_path(Ebur128_INCLUDE_DIR
  NAMES ebur128.h
)

find_library(Ebur128_LIBRARY
  NAMES ebur128
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Ebur128
  DEFAULT_MSG
  Ebur128_LIBRARY Ebur128_INCLUDE_DIR
)

if(Ebur128_FOUND AND NOT TARGET Ebur128::Ebur128)
  add_library(Ebur128::Ebur128 UNKNOWN IMPORTED)
  set_target_properties(Ebur128::Ebur128 PROPERTIES
    IMPORTED_LOCATION "${Ebur128_LIBRARY}"
    INTERFACE_INCLUDE_DIRECTORIES "${Ebur128_INCLUDE_DIR}"
  )
endif()

mark_as_advanced(Ebur128_INCLUDE_DIR Ebur128_LIBRARY)
