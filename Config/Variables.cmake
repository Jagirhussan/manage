##
# OPENCMISS_COMPONENTS
# --------------------
# 
# List of all OpenCMISS components (used in default config)
set(OPENCMISS_COMPONENTS BLAS BZIP2 CELLML CLANG CSIM FIELDML-API
    FREETYPE FTGL GDCM-ABI GLEW GTEST HDF5 HYPRE IMAGEMAGICK IRON
    ITK JPEG LAPACK LIBCELLML LIBXML2 LLVM MUMPS NETGEN OPTPP
    PARMETIS PASTIX PETSC PLAPACK PNG PTSCOTCH SCALAPACK SCOTCH
    SLEPC SOWING SUITESPARSE SUNDIALS SUPERLU SUPERLU_DIST
    SZIP TIFF ZINC ZLIB
)

# Components using (any) MPI
# Used to determine when MPI compilers etc should be passed down to packages
set(OPENCMISS_COMPONENTS_WITHMPI MUMPS PARMETIS PASTIX PETSC
    PLAPACK SCALAPACK SCOTCH SUITESPARSE
    SUNDIALS SUPERLU_DIST SLEPC HYPRE IRON)

# Components using OPENMP local threading
# Used to determine which dependencies get the WITH_OPENMP flag
set(OPENCMISS_COMPONENTS_WITH_OPENMP HYPRE PARMETIS PASTIX
    PETSC PLAPACK SUITESPARSE SUPERLU_DIST)
    
# Components with Fortran code
set(OPENCMISS_COMPONENTS_WITH_Fortran CELLML HYPRE LAPACK PASTIX
    PLAPACK SCALAPACK SUITESPARSE SUNDIALS SUPERLU SUPERLU_DIST IRON)

# Components that require Fortran 90 support.
# Can be verified using the (internal) CMAKE_Fortran_COMPILER_SUPPORTS_F90 flag.
#
# Hypre has a fortran 90 example, which is not included in the examples build by default as of now. 
set(OPENCMISS_COMPONENTS_WITH_F90 CELLML PASTIX SOWING PETSC SUPERLU_DIST IRON)

# The opencmiss components that are looked for on the local system instead of building it
set(OPENCMISS_COMPONENTS_SYSTEM_BY_DEFAULT BLAS LAPACK LIBXML2 JPEG FREETYPE)
# local ZLIB PNG wont work (too new) with e.g. Imagemagick
# TIFF: older versions wont do with ITK

# Those components are initialized to be build as shared libraries
set(OPENCMISS_COMPONENTS_SHARED_BY_DEFAULT IRON ZINC)

# Disabled components - added but not compiling
# SCOTCH is disabled as PTSCOTCH is usually used.
set(OPENCMISS_COMPONENTS_DISABLED_BY_DEFAULT CSIM LLVM SCOTCH CLANG)
#set(OPENCMISS_COMPONENTS_DISABLED_BY_DEFAULT BLAS LAPACK PLAPACK SCALAPACK PARMETIS SUITESPARSE MUMPS SUPERLU SUPERLU_DIST SUNDIALS SCOTCH SOWING PASTIX HYPRE PETSC LIBCELLML CELLML SLEPC BZIP2 SZIP HDF5 FIELDML-API LIBXML2 IRON CSIM LLVM GTEST)
if (MINGW)
    # On windows the gtest builds currently fail - not crucial
    list(APPEND OPENCMISS_COMPONENTS_DISABLED_BY_DEFAULT GTEST)
endif()
if (MSVC)
    # Sowing builds with visual studio are painful - we just need the bfort
    # executable for petsc anyways, which we included directly into the petsc component for msvc cases!
    # Pastix is currently beyond rescue..
    list(APPEND OPENCMISS_COMPONENTS_DISABLED_BY_DEFAULT SOWING PASTIX)
endif()

set(OC_MANDATORY_COMPONENTS FIELDML-API LIBXML2)

# This is the support email for general enquiries and support about building opencmiss using the new CMake system.
set(OC_BUILD_SUPPORT_EMAIL "users@opencmiss.org")

# This is an email address being displayed for issues regarding (remote) installations.
# This needs to be set in either LocalConfig or Developer (better) in order to be useful.
# If not set, a warning will be issued!
set(OC_INSTALL_SUPPORT_EMAIL FALSE)

# The prefix for opencmiss dependencies external projects
set(OC_EP_PREFIX "OC_")