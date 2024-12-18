#!/usr/bin/env bashio

SERVER_PROPERTIES_PATH="server.properties"
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
BIN_PATH="${SCRIPT_DIR}/bedrock_server"
SERVER_FOLDERS=("behavior_packs" "definitions" "resource_packs")
INSTANCE_DIR="instance"

main() {
  bashio::log.debug "Working directory is ${PWD}"

  mkdir -p "$INSTANCE_DIR"
  cd "$INSTANCE_DIR" || exit 1

  write_server_properties "${SERVER_PROPERTIES_PATH}"
  copy_folders_to_working_dir "$SCRIPT_DIR" "${SERVER_FOLDERS[@]}"

  bashio::log.debug "Starting bedrock server..."
  exec "$BIN_PATH"
}

write_server_properties() {
  local path config port portv6
  path="$1"
  config=$(bashio::addon.config)
  port=$(bashio::addon.port 19132)
  portv6=$(bashio::addon.port 19133)

  bashio::jq "${config}" 'to_entries|map("\(.key)=\(.value)")|join("\n")' >"${path}"
  echo "server-port=${port}" >>"$path"
  echo "server-portv6=${portv6}" >>"$path"
  bashio::log.debug "Updated ${path} with config"
}

copy_folders_to_working_dir() {
  local src item
  src="$1"
  for item in "${@:1}"; do
    bashio::log.debug "Checking if working directory has ${item}..."
    if [ ! -d "$item" ]; then
      bashio::log.debug "Copying ${item} to working directory"
      cp -r "${src}/${item}" .
    fi
  done
}

main "$@"
