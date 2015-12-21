python waf-light \
    --make-waf \
    --tool=swig,cython,boost,use_config

cp waf $PREFIX/bin
