python waf-light \
    --make-waf \
    --tool=swig,boost,use_config

cp waf $PREFIX/bin
