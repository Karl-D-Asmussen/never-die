#! /usr/bin/zsh

if [[ ! -d html ]]; then
  mkdir html
  git add html
fi

for I in ??.mkdn; do
  J=html/${I%.mkdn}.html
  if [[ ( ! -a $J ) || ( $I -nt $J ) || ( style.html -nt $J ) ]]; then
    pandoc -M "title=chapter ${I%.mkdn}" -sH style.html -o $J $I
    git add $J
  fi
done

git commit -m "Ran make.zsh"
