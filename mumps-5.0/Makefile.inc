#
#  This file is part of MUMPS 5.0.0, released
#  on Fri Feb 20 08:19:56 UTC 2015
#
#Begin orderings

# NOTE that PORD is distributed within MUMPS by default. If you would like to
# use other orderings, you need to obtain the corresponding package and modify
# the variables below accordingly.
# For example, to have Metis available within MUMPS:
#          1/ download Metis and compile it
#          2/ uncomment (suppress # in first column) lines
#             starting with LMETISDIR,  LMETIS
#          3/ add -Dmetis in line ORDERINGSF
#             ORDERINGSF  = -Dpord -Dmetis
#          4/ Compile and install MUMPS
#             make clean; make   (to clean up previous installation)
#
#          Metis/ParMetis and SCOTCH/PT-SCOTCH (ver 6.0 and later) orderings are now available for MUMPS.
#

#SCOTCHDIR  = ${HOME}/scotch_6.0
#ISCOTCH    = -I$(SCOTCHDIR)/include  # Should be provided for pt-scotch (not needed for Scotch)
#
# You have to choose one among the following two lines depending on
# the type of analysis you want to perform. If you want to perform only
# sequential analysis choose the first (remember to add -Dscotch in the ORDERINGSF
# variable below); for both parallel and sequential analysis choose the second 
# line (remember to add -Dptscotch in the ORDERINGSF variable below)

#LSCOTCH    = -L$(SCOTCHDIR)/lib -lesmumps -lscotch -lscotcherr
#LSCOTCH    = -L$(SCOTCHDIR)/lib -lptesmumps -lptscotch -lptscotcherr -lscotch


LPORDDIR = $(topdir)/PORD/lib/
IPORD    = -I$(topdir)/PORD/include/
LPORD    = -L$(LPORDDIR) -lpord

#LMETISDIR = /local/metis/
#IMETIS    = # should be provided if you use parmetis, to access parmetis.h

# You have to choose one among the following two lines depending on
# the type of analysis you want to perform. If you want to perform only
# sequential analysis choose the first (remember to add -Dmetis in the ORDERINGSF
# variable below); for both parallel and sequential analysis choose the second 
# line (remember to add -Dparmetis in the ORDERINGSF variable below)

#LMETIS    = -L$(LMETISDIR) -lmetis
#LMETIS    = -L$(LMETISDIR) -lparmetis -lmetis

# The following variables will be used in the compilation process.
# Please note that -Dptscotch and -Dparmetis imply -Dscotch and -Dmetis respectively.
#ORDERINGSF = -Dscotch -Dmetis -Dpord -Dptscotch -Dparmetis
ORDERINGSF  = -Dpord
ORDERINGSC  = $(ORDERINGSF)

LORDERINGS = $(LMETIS) $(LPORD) $(LSCOTCH)
IORDERINGSF = $(ISCOTCH)
IORDERINGSC = $(IMETIS) $(IPORD) $(ISCOTCH)

#End orderings
########################################################################
################################################################################

PLAT =
LIBEXT  = .a
OUTC    = -o 
OUTF    = -o 
RM      = /bin/rm -f
CC      = gcc
FC = mpif90
FL = mpif90
AR = ar vr 
RANLIB  = echo

SCALAP  = ${CONDADIR}/lib/libscalapack.a
INCPAR = -I${CONDADIR}/include
LIBPAR = $(SCALAP)

INCSEQ = -I$(topdir)/libseq
LIBSEQ  =  -L$(topdir)/libseq -lmpiseq

LIBBLAS = -L$(CONDADIR)/lib -lopenblas -lpthread
LIBOTHERS = -lpthread
#Preprocessor defs for calling Fortran from C (-DAdd_ or -DAdd__ or -DUPPER)
CDEFS   = -DAdd_

#Begin Optimized options
OPTF    = -O -DALLOW_NON_INIT -fPIC
OPTL    = -O 
OPTC    = -O -fPIC
#End Optimized options
INCS = $(INCPAR)
LIBS = $(LIBPAR)
LIBSEQNEEDED =