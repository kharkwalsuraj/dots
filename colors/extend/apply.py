import os
import re
from string import Template

def substitute(template_path, output_path, data):
    with open(template_path, "r", encoding="utf-8") as f:
        text = f.read()

    tpl = Template(text)
    content = tpl.safe_substitute(data)

    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    with open(output_path, "w", encoding="utf-8") as f:
        f.write(content)


def read_scss(file_path):
    colors = {}
    with open(file_path, "r", encoding="utf-8") as file:
        for line in file:
            match = re.match(r"\$(\w+):\s*(#[0-9A-Fa-f]{6});", line.strip())
            if match:
                name, value = match.groups()
                colors[name] = value
    return colors


def main():
    xdg_config_home = os.environ.get("XDG_CONFIG_HOME", os.path.expanduser("~/.config"))
    xdg_state_home = os.environ.get("XDG_STATE_HOME", os.path.expanduser("~/.local/state"))

    scss_file = os.path.join(xdg_state_home, "quickshell", "user", "generated", "material_colors.scss")

    fzf_template_path = os.path.join(xdg_config_home, "quickshell", "ii", "scripts", "colors", "extend", "fzf.fish")
    fzf_output_path = os.path.join(xdg_config_home, "fish", "conf.d", "fzf.fish")

    nvim_template_path = os.path.join(xdg_config_home, "quickshell", "ii", "scripts", "colors", "extend", "colors.lua")
    nvim_output_path = os.path.join(xdg_config_home, "nvim", "lua", "themes", "new_theme.lua")

    color_data = read_scss(scss_file)

    substitute(fzf_template_path, fzf_output_path, color_data)
    substitute(nvim_template_path, nvim_output_path, color_data)


if __name__ == "__main__":
    main()
