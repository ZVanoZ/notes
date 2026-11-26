# Взять переменные из родительского каталога
#. "$(dirname "${BASH_SOURCE[0]}")"/../set-up.sh

DEMOS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

env_path="${DEMOS_DIR}/.env"
echo "env_path: '${env_path}'"
if [ ! -f "${env_path}" ];then
  echo '- .env'
else
  echo '+ .env'
fi

set -a
source "${env_path}"
set +a

