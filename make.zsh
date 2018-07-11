#! /usr/bin/zsh

if [[ ! -d html ]]; then
  mkdir html
fi

for I in ??.mkdn; do
  J=html/${I%.mkdn}.html
  if [[ ( ! -a $J ) || ( $I -nt $J ) ]]; then
    pandoc -M "title=chapter ${I%.mkdn}" -sH style.html -o $J $I
  fi
done
