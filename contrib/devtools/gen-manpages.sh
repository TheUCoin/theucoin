#!/usr/bin/env bash

export LC_ALL=C
TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
BUILDDIR=${BUILDDIR:-$TOPDIR}

BINDIR=${BINDIR:-$BUILDDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

THEUCOIND=${THEUCOIND:-$BINDIR/theucoind}
THEUCOINCLI=${THEUCOINCLI:-$BINDIR/theucoin-cli}
THEUCOINTX=${THEUCOINTX:-$BINDIR/theucoin-tx}
THEUCOINQT=${THEUCOINQT:-$BINDIR/qt/theucoin-qt}

[ ! -x $THEUCOIND ] && echo "$THEUCOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
BTCVER=($($THEUCOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for theucoind if --version-string is not set,
# but has different outcomes for tucoin-qt and theucoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$THEUCOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $THEUCOIND $THEUCOINCLI $THEUCOINTX $THEUCOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${BTCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${BTCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
