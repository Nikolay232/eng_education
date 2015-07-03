#!/bin/sh

pypath="$1"
realpath="$2"
writeto="$3"

cat > $writeto <<EOF
#!/bin/sh
export ENG_EDUCATION_SETTINGS_OVERRIDE_PATH=/etc/eng_education/settings.py
export PYTHONPATH=$pypath
exec $realpath \$@
EOF
chmod +x $writeto
