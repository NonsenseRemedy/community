commands for restarting talent taken from zilch42's fork of community:
https://github.com/zilch42/knausj_talon

I've made a few changes:
*  change the order of commands to start with "talon"
*  fix mac os restart function to actually work ( call subprocess before exiting talon,  and use shell=True)

from Aegis on slack:
need to put a disclaimer by actions like this that restarting talon should be considered an exceptional case and
(1) ideally you never need to do this
(2) as a workflow it is likely to break or cause weird issues
(3) you should complain to aegis loudly and regularly if this is part of your workflow for some reason (edited)
