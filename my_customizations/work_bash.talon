tag: user.bash
-

manip:
    "manip"
    key(enter)

dir manip source:
    "cd ~/manip_ws/src"
    key(enter)

dir talon community:
    "cd ~/talon/user/community"
    key(enter)

start testbed manip:
    "cd ~/manip_ws/src/raven_manip_sw/launch/launch_scripts \n"
    "./start_testbed_manip.sh"

enable testbed:
    "rosservice call /testbed/enable_all 'enable: true'"

disable testbed:
    "rosservice call /testbed/enable_all 'enable: false'"

redirect:
    " 2>&1 | tee -a ~/output.txt && echo `history 1` | cut -d' ' -f2- >> ~/output.txt"

redirect that:
    "!! 2>&1 | tee -a ~/output.txt && echo `history 1` | cut -d' ' -f2- >> ~/output.txt"
    key(enter)

source bashrc:
    "source ~/.bashrc"
    key(enter)

# bash voice commands specifically for use at work that rely on
# bashrc aliases
# Export the AWS keys to access the trisect data
export trisect dvc:
    "trisect_dvc"
    key(enter)
export manip dvc:
    "manip_dvc"
    key(enter)

zerotier join opal:
    "join_zerotier_opal"
    key(enter)

zerotier join desktop:
    "join_zerotier_desktop"
    key(enter)

# TODO: this should use a capture to also support other virtual environments,
#      but for now, doing it the easy way that I know how
activate dvc:
    "source ~/environments/dvc/bin/activate"
    key(enter)

# TODO: this should probably use an environment variable to find the root data directory. For now, this only works on my desktop at home
trisect data:
    "cd /zvol1/trisect_data"
    key(enter)

Lindzey at nansen:
    "lindzey@nansen"

Lindzey at hyenine:
    "lindzey@hyenine"

Lindzey at vespine:
    "lindzey@vespine"

uv run [jupyterlab | jupyter lab | jupiter lab]:
    "uv run --with jupyter jupyter lab"
