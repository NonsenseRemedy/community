from talon import Module, actions, ctrl, ui
from talon.screen import Screen
import time
from dataclasses import dataclass
from enum import StrEnum
from typing import Callable

screen: Screen = ui.main_screen()
slow_scroll = True
slow_mouse_move = False

mod = Module()
mod.tag("gamepad", desc="Activate tag to enable gamepad bindings")


class GamepadButtons(StrEnum):
    # DPAD buttons
    DPAD_LEFT = "dpad_left"
    DPAD_UP = "dpad_up"
    DPAD_RIGHT = "dpad_right"
    DPAD_DOWN = "dpad_down"
    # Compass / ABXY buttons
    WEST = "west"
    NORTH = "north"
    EAST = "east"
    SOUTH = "south"
    # Select / Start buttons
    SELECT = "select"  # "options" on PlayStation controllers
    START = "start"  # "create" on PlayStation controllers
    # Shoulder buttons
    LEFT_SHOULDER = "left_shoulder"
    RIGHT_SHOULDER = "right_shoulder"
    # Triggers, treated as binary buttons
    # This is weird because they won't have matching press and release events.
    LEFT_TRIGGER = "left_trigger"
    RIGHT_TRIGGER = "right_trigger"
    # Stick buttons
    LEFT_STICK = "left_stick"
    RIGHT_STICK = "right_stick"


# trying to debounce key presses on the access controller
#
# I will get two to three press events, separated by less than a
# hundredth of a second, followed by their corresponding release
# events, which may be further apart.
#
# So, I will use a time delay to debounce the pressers, and check
# whether a key is currently down to debounce the releases.
# This means that all functionality needs to be implemented here
# rather than in the Talon file, and that everything needs to go
# through the `gamepad_button_up` and `gamepad_button_down` actions.
# TODO: the release logic does not work for holding the key for quite a while, which is important for drag events. Probably need to count the release events and release on the last not the first.
last_press_time = {button: time.time() for button in GamepadButtons}
# This hacky way assumes that only one key is being pressed at once.
# It would be better to track this on a per key basis.
button_press_count = {button: 0 for button in GamepadButtons}


@dataclass
class ButtonActions:
    # TODO: test whether the general buttons actually support repeat
    # the default talon file doesn't seem to use it, but I can imagine wanting
    # it for a binary scroll
    # TODO: get rid of none and use actions.skip instead?
    on_press: Callable = actions.skip
    on_repeat: Callable = actions.skip
    on_release: Callable = actions.skip


class GamepadHelpers:
    """grouping the variables and functions together that will be used to implement gamepad functionality. These are a separate class from the actions class, since they should not be called directly from a talon file"""

    # TODO: this is getting ugly thanks to the global nature of my map. I really want to move this into a class. It needs to be a separate class from the actions that are allowed to be mapped from a talon file.
    def gamepad_scroll_slow_toggle():
        """Toggle gamepad slow scroll mode"""
        global slow_scroll
        slow_scroll = not slow_scroll

    def gamepad_mouse_move_slow_toggle():
        """Toggle gamepad slow mouse move mode"""
        global slow_mouse_move
        slow_mouse_move = not slow_mouse_move

    def control_click():
        actions.key("ctrl:down")
        actions.mouse_click()
        actions.key("ctrl:up")

    no_action = ButtonActions()

    # TODO: is a lambda really the best way to do this? I think making button actions a proper class might be the right option.
    left_mouse_drag = ButtonActions(
        lambda: actions.mouse_drag(0),
        actions.skip,
        lambda: actions.mouse_release(0),
    )
    right_mouse_drag = ButtonActions(
        lambda: actions.mouse_drag(1),
        actions.skip,
        lambda: actions.mouse_release(1),
    )
    center_mouse_drag = ButtonActions(
        lambda: actions.mouse_drag(2),
        actions.skip,
        lambda: actions.mouse_release(2),
    )

    mouse_jump_left_action = ButtonActions(
        lambda: gamepad_mouse_jump("left"), None, actions.skip
    )

    mouse_jump_right_action = ButtonActions(
        lambda: gamepad_mouse_jump("right"), None, actions.skip
    )

    mouse_jump_up_action = ButtonActions(
        lambda: gamepad_mouse_jump("up"), None, actions.skip
    )

    mouse_jump_down_action = ButtonActions(
        lambda: gamepad_mouse_jump("down"), None, actions.skip
    )

    toggle_mouse_move_slow = ButtonActions(
        gamepad_mouse_move_slow_toggle, None, actions.skip
    )

    toggle_mouse_move_slow = ButtonActions(
        gamepad_mouse_move_slow_toggle, None, actions.skip
    )

    control_click_action = ButtonActions(control_click, None, actions.skip)

    scroll_up = ButtonActions(
        lambda: actions.user.mouse_scroll_up_continuous(10),
        actions.skip,
        actions.user.mouse_scroll_stop,
    )

    scroll_down = ButtonActions(
        lambda: actions.user.mouse_scroll_down_continuous(10),
        actions.skip,
        actions.user.mouse_scroll_stop,
    )

    toggle_talon_speech = ButtonActions(
        actions.speech.toggle,
        actions.skip,
        actions.skip,
    )

    toggle_mute_focusmate = ButtonActions(
        # TODO: a complete implementation of muting focus mate would focus
        # chrome and go to the appropriate tab. I think this is possible with
        # the actions for searching chrome tabs, but this is enough of an
        # improvement for now.
        # TODO: sometimes this toggles chrome to bookmark the page, and I'm not sure what controls where the signal is sent
        # It seems to be an issue the first time I press the key after starting a new focus mate session.
        lambda: actions.key("super-d"),
        actions.skip,
        actions.skip,
    )

    toggle_mute_zoom = ButtonActions(
        # TODO: focus zoom before sending mute key!
        lambda: actions.key("super-shift-a"),
        actions.skip,
        actions.skip,
    )

    go_back = ButtonActions(actions.user.go_back, actions.skip, actions.skip)

    go_forward = ButtonActions(actions.user.go_forward, actions.skip, actions.skip)
    page_up = ButtonActions(lambda: actions.key("pageup"), actions.skip, actions.skip)
    page_down = ButtonActions(
        lambda: actions.key("pagedown"), actions.skip, actions.skip
    )

    # TODO: the goal is to get rid of functions named based on the buttons,
    # and replace them with functions named based on what they do
    gamepad_button_map = {
        # DPAD buttons
        # GamepadButtons.DPAD_LEFT: mouse_jump_left_action,
        # GamepadButtons.DPAD_UP: mouse_jump_up_action,
        # GamepadButtons.DPAD_RIGHT: mouse_jump_right_action,
        # GamepadButtons.DPAD_DOWN: mouse_jump_down_action,
        GamepadButtons.DPAD_LEFT: left_mouse_drag,
        GamepadButtons.DPAD_UP: no_action,
        GamepadButtons.DPAD_RIGHT: no_action,
        GamepadButtons.DPAD_DOWN: no_action,
        # Compass / ABXY buttons
        # GamepadButtons.WEST: left_mouse_drag,
        # GamepadButtons.NORTH: right_mouse_drag,
        # GamepadButtons.EAST: control_click_action,
        # GamepadButtons.SOUTH: center_mouse_drag,
        GamepadButtons.WEST: no_action,
        GamepadButtons.NORTH: toggle_mute_focusmate,
        GamepadButtons.EAST: toggle_mute_zoom,
        GamepadButtons.SOUTH: toggle_talon_speech,
        # Select / Start buttons
        # GamepadButtons.SELECT: no_action,
        # GamepadButtons.START: toggle_talon_speech,
        GamepadButtons.SELECT: right_mouse_drag,
        GamepadButtons.START: no_action,
        # Shoulder buttons
        # GamepadButtons.LEFT_SHOULDER: go_back,
        # GamepadButtons.RIGHT_SHOULDER: go_forward,
        GamepadButtons.LEFT_SHOULDER: page_down,
        GamepadButtons.RIGHT_SHOULDER: page_up,
        GamepadButtons.LEFT_TRIGGER: scroll_down,
        GamepadButtons.RIGHT_TRIGGER: scroll_up,
        # Stick buttons
        # GamepadButtons.LEFT_STICK: gamepad_scroll_slow_toggle,
        # GamepadButtons.RIGHT_STICK: gamepad_mouse_move_slow_toggle,
        GamepadButtons.LEFT_STICK: no_action,
        GamepadButtons.RIGHT_STICK: no_action,
    }


@mod.action_class
class Actions:
    # DPAD buttons

    # I have not been able to map any keys to these explicitly;
    # however, there are several keys in the profile editor for the
    # access controller that show up as these in talon
    # touchpad->dpad_left
    # R3->dpad_down

    # Compass / ABXY buttons

    # I was able to map all of these on the access controller

    # Stick buttons

    # I found this too hard to toggle on the access controller
    # so I'm not using it

    # Analog triggers

    # TODO: I'm not sure whether the problem is in the access controller or
    # in talon, but I'm only getting binary data here, not an analog value.
    # if it is pressed, it is a 1, and there is no event with a 0 to detect
    # # that it has been released.

    def gamepad_trigger_left(value: float):
        """Gamepad trigger left movement"""
        # gamepad_scroll(0, value * -1)
        # TODO: this probably won't work because there is not an associated release event
        # actions.print(f"gamepad_trigger_left: {value}")
        # actions.user.mouse_scroll_down_continuous(10)
        actions.skip()

    def gamepad_trigger_right(value: float):
        """Gamepad trigger right movement"""
        # gamepad_scroll(0, value)
        # actions.print(f"gamepad_trigger_right: {value}")
        actions.skip()

    # Analog thumb sticks

    def gamepad_stick_left(x: float, y: float):
        """Gamepad left stick movement"""
        gamepad_scroll(x, y)
        # actions.print(f"gamepad_stick_left. x = {x}, y = {y}")

    def gamepad_stick_right(x: float, y: float):
        """Gamepad right stick movement"""
        # actions.print(f"gamepad_stick_right. x = {x}, y = {y}")
        # gamepad_mouse_move(x, y)
        actions.skip()

    # Scaffolding actions used by the Talon file

    def gamepad_button_down(button: str):
        """Gamepad press button <button>"""
        global last_press_time
        global button_press_count

        if button not in GamepadButtons:
            raise ValueError(f"Unknown button: {button}")

        if button not in GamepadHelpers.gamepad_button_map:
            raise ValueError(f"Unmapped button: {button}")

        button_press_count[button] += 1
        dt = time.time() - last_press_time[button]

        # This delta was chosen to be faster than I can press a key repeatedly.
        if dt <= 0.02:
            actions.print(f"skipping button press for {button}; dt = {dt}")
            return
        actions.print(f"valid button press for {button}; dt = {dt}")

        action = GamepadHelpers.gamepad_button_map[button].on_press

        if action is not None:
            action()

        # Set timestamp after executing the action, so time delta is
        # independent of function called
        last_press_time[button] = time.time()

    def gamepad_button_up(button: str):
        """Gamepad release button <button>"""
        global button_press_count

        if button not in GamepadButtons:
            raise ValueError(f"Unknown button: {button}")

        # we only want to execute the release event on the final release, not
        # the first bouncy one, in case the user is holding the button like for
        # dragging a mouse.
        button_press_count[button] -= 1

        if button_press_count[button] > 0:
            actions.print(
                f"skipping button release for {button}. count = {button_press_count[button]}"
            )
            return
        elif button_press_count[button] < 0:
            actions.print(
                f"button_press_count for button {button} went negative! this is an error."
            )
            button_press_count[button] = 0

        action = GamepadHelpers.gamepad_button_map[button].on_release

        if action is not None:
            action()


def gamepad_scroll(x: float, y: float):
    """Perform gamepad scrolling"""
    actions.print(f"gamepad_scroll. x = {x}, y = {y}")

    # this requires the mouse to be over the window.
    # it appears that the mouse scroll action takes integers,
    # so we need to make sure the input is greater than one for it to move
    # (a multiplier of 1 is insufficient)
    # Unfortunately, even this is too fast if done by lines.
    yy = y * 25
    xx = x * 10

    if xx != 0 or yy != 0:
        actions.mouse_scroll(x=xx, y=yy, by_lines=False)


def gamepad_mouse_move(dx: float, dy: float):
    """Perform gamepad mouse cursor movement"""
    multiplier = 0.1 if slow_mouse_move else 0.2
    x, y = ctrl.mouse_pos()
    screen = get_screen(x, y)
    dx = dx**3 * screen.dpi * multiplier
    dy = dy**3 * screen.dpi * multiplier
    actions.mouse_move(x + dx, y + dy)


def gamepad_mouse_jump(direction: str):
    """Move the mouse cursor to the specified quadrant of the active screen"""
    x, y = ctrl.mouse_pos()
    rect = ui.screen_containing(x, y).rect

    # Half distance between cursor and screen edge
    match direction:
        case "up":
            y = rect.top + (y - rect.top) / 2
        case "down":
            y = rect.bot - (rect.bot - y) / 2
        case "left":
            x = rect.left + (x - rect.left) / 2
        case "right":
            x = rect.right - (rect.right - x) / 2

    actions.mouse_move(x, y)


def get_screen(x: float, y: float) -> Screen:
    global screen
    if not screen.contains(x, y):
        screen = ui.screen_containing(x, y)
    return screen
