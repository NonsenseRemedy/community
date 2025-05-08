mode: command
# enabling the facial recognition really ups talon's CPU usage

# mode: command
-
# Aegis says that this is the better way to do it;
# however, I find that the command "I move" from gaze-ocr recognizes better
jump mouse: tracking.jump()

# the list of supported facial expressions can be found in the beta release notes:
# https://talonvoice.com/update/qyO6k0Y0jHOeI94q51eTKV/Talon-115-0.4.0-650-ga789.html
# All raw expressions: brow_down_left, brow_down_right, brow_inner_up, brow_outer_up_left, brow_outer_up_right, blink_left, blink_right, gaze_down_left, gaze_down_right, gaze_in_left, gaze_in_right, gaze_out_left, gaze_out_right, gaze_up_left, gaze_up_right, squint_left, squint_right, eye_wide_left, eye_wide_right, jaw_open, jaw_left, jaw_right, mouth_close, dimple_left, dimple_right, frown_left, frown_right, mouth_funnel, mouth_lower_down_left, mouth_lower_down_right, mouth_press_left, mouth_press_right, mouth_pucker, mouth_right, mouth_left, mouth_roll_lower, mouth_roll_upper, mouth_shrug_lower, mouth_shrug_upper, smile_left, smile_right, mouth_stretch_left, mouth_stretch_right, mouth_upper_up_left, mouth_upper_up_right

# face(jaw_open): print("jaw_open")
# face(jaw_left): print("jaw_left")
# face(jaw_right): print("jaw_right")

# I could not get this one to recognize
# face(scrunch_nose): print("scrunch_nose")

# face(mouth_pucker): print("mouth_pucker")

# this one triggers a lot
# face(smile): print("smile")

# I have trouble triggering this one
# face(frown): print("frown")

# these always seem to trigger as a pair, even if I'm careful to only look in one direction
# face(gaze_down_left): print("gaze_down_left")
# face(gaze_down_right): print("gaze_down_right")

# this recognizes for every eye blink, so isn't particularly useful
# face(eye_blink): print("eye_blink")

# face(raise_eyebrows): print("raise_eyebrows")

face(pucker_lips_right):
    # print("pucker_lips_right")
    user.mouse_scroll_down_continuous(10)
face(pucker_lips_right:stop):
    # print("pucker_lips_right")
    user.mouse_scroll_stop()

face(pucker_lips_left):
    # print("pucker_lips_left")
    user.mouse_scroll_up_continuous(10)
face(pucker_lips_left:stop):
    # print("pucker_lips_left")
    user.mouse_scroll_stop()