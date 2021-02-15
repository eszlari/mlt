find_path(Frei0r_INCLUDE_DIR
  NAMES frei0r.h
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Frei0r
  DEFAULT_MSG
  Frei0r_INCLUDE_DIR
)

if(Frei0r_FOUND AND NOT TARGET Frei0r::Frei0r)
  add_library(Frei0r::Frei0r INTERFACE IMPORTED)
  set_target_properties(Frei0r::Frei0r PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${Frei0r_INCLUDE_DIR}"
  )
endif()

mark_as_advanced(Frei0r_INCLUDE_DIR)
