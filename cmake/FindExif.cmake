find_path(Exif_INCLUDE_DIR
  NAMES
    exif-byte-order.h
    exif-content.h
    exif-data-type.h
    exif-data.h
    exif-entry.h
    exif-format.h
    exif-ifd.h
    exif-loader.h
    exif-log.h
    exif-mem.h
    exif-mnote-data.h
    exif-tag.h
    exif-utils.h
  PATH_SUFFIXES
    libexif
)

find_library(Exif_LIBRARY
  NAMES exif
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Exif
  DEFAULT_MSG
  Exif_LIBRARY Exif_INCLUDE_DIR
)

if(Exif_FOUND AND NOT TARGET Exif::Exif)
  add_library(Exif::Exif UNKNOWN IMPORTED)
  set_target_properties(Exif::Exif PROPERTIES
    IMPORTED_LOCATION "${Exif_LIBRARY}"
    INTERFACE_INCLUDE_DIRECTORIES "${Exif_INCLUDE_DIR}"
  )
endif()

mark_as_advanced(Exif_INCLUDE_DIR Exif_LIBRARY)
