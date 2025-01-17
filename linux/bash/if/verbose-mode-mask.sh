echo "# \$*: '$*'"
VERBOSE_MODE=$1
echo "# VERBOSE_MODE: '${VERBOSE_MODE}'"

if [ '' == "${VERBOSE_MODE}" ];then
  echo "# Режим verbose НЕ установлен"
elif [[ ${VERBOSE_MODE} =~ ^v+$ ]]; then
    echo "# Режим verbose установлен в несколько букв 'v'"
    if [[ ${VERBOSE_MODE} =~ ^v{1,}$ ]];then
        echo "## 'v*'"
    fi
    if [[ ${VERBOSE_MODE} =~ ^v{2,}$ ]];then
        echo "## 'vv*' "
    fi
    if [[ ${VERBOSE_MODE} =~ ^v{3,}$ ]];then
        echo "## 'vvv*'"
    fi
    if [[ ${VERBOSE_MODE} =~ ^v{4,}$ ]];then
        echo "## слишком много 'v'"
        exit 2
    fi
else
    echo "Режим verbose установлен в ХЗ что"
    exit 1
fi

if [ 'vvvv' == "${VERBOSE_MODE}" ];then
  exit 0
else
  bash $0 "v${VERBOSE_MODE}"
fi
