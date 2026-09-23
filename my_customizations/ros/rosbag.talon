tag: terminal
-

rosbag reindex:
    "rosbag reindex "

rosbag reindex (this | that):
    text = edit.selected_text()
    "rosbag reindex {text}"

rosbag info:
    "rosbag info "

rosbag info (this | that):
    text = edit.selected_text()
    "rosbag info {text}"
