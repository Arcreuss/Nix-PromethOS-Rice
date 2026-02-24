{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Font pour Kitty / Starship / icons
    nerd-fonts.jetbrains-mono
    wallust
  ];
  
  # Config Wallust
  xdg.configFile."wallust/config.toml".text = ''
    backend = "full"
    colorspace = "lab"
    check_contrast = true
  '';
  
  # Commande: setwall /chemin/vers/image.jpg
  home.file.".local/bin/setwall".text = ''
    #!/usr/bin/env bash
    set -euo pipefail

    if [[ $# -lt 1 ]]; then
      echo "Usage: setwall /path/to/wallpaper"
      exit 1
    fi

    WALL="$1"

    if [[ ! -f "$WALL" ]]; then
      echo "File not found: $WALL"
      exit 1
    fi
    
    # Convertit en chemin absolu (gère les chemins relatifs comme Pictures/...)
    WALL="$(realpath "$WALL")"

    STATE="''${XDG_CACHE_HOME:-$HOME/.cache}/setwall.last"
    if [[ -f "$STATE" ]] && [[ "$(cat "$STATE")" == "$WALL" ]]; then
      exit 0
    fi
    echo "$WALL" > "$STATE"

    URI="file://$WALL"

    # 1) Change le wallpaper GNOME (clair + dark)
    gsettings set org.gnome.desktop.background picture-uri "$URI"
    gsettings set org.gnome.desktop.background picture-uri-dark "$URI"
    gsettings set org.gnome.desktop.background picture-options "zoom"

    # 2) Génère la palette + thèmes via wallust
    wallust run "$WALL" -q

    # 3) (Optionnel) reload Kitty pour appliquer tout de suite
    kitty @ load-config >/dev/null 2>&1 || true
  '';
  home.file.".local/bin/setwall".executable = true;
  
# Commande: pickwall-preview
home.file.".local/bin/pickwall-preview".text = ''
#!/usr/bin/env bash
set -euo pipefail

img="$1"
[[ -f "$img" ]] || exit 0

cols="''${FZF_PREVIEW_COLUMNS:-80}"
lines="''${FZF_PREVIEW_LINES:-24}"

# Clear du pane preview SANS bouger le curseur (évite de casser fzf)
# 2J: clear screen, 3J: clear scrollback (selon terminal)
printf "\033[2J\033[3J"

# Render en respectant le ratio (PAS de --stretch)
chafa -s "''${cols}x''${lines}" "$img" 2>/dev/null || true
'';
home.file.".local/bin/pickwall-preview".executable = true;

# Commande: pickwall
home.file.".local/bin/pickwall".text = ''
  #!/usr/bin/env bash
  set -euo pipefail

  WALLDIR="$HOME/Pictures/Wallpapers"
  [[ -d "$WALLDIR" ]] || { echo "Wallpaper directory not found: $WALLDIR"; exit 1; }

  # Format: "DISPLAY_NAME<TAB>FULL_PATH"
  list_file="$(mktemp)"
  trap 'rm -f "$list_file"' EXIT

  while IFS= read -r -d "" f; do
    printf "%s\t%s\n" "$(basename -- "$f")" "$f" >> "$list_file"
  done < <(find "$WALLDIR" -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.webp" \) -print0)

  [[ -s "$list_file" ]] || { echo "No images found in: $WALLDIR"; exit 1; }

  selected="$(
    sort -f "$list_file" | fzf \
      --prompt="wallpapers> " \
      --delimiter=$'\t' \
      --with-nth=1 \
      --no-hscroll \
      --ellipsis="…" \
      --preview-window=right:60%:wrap \
      --preview="$HOME/.local/bin/pickwall-preview {2}"
  )"

  [[ -n "$selected" ]] || exit 0
  wall="$(printf "%s" "$selected" | cut -f2-)"
  setwall "$wall"
'';
home.file.".local/bin/pickwall".executable = true;
}
