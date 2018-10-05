#!/bin/bash

# figure out the absolute path to the script being run a bit
# non-obvious, the ${0%/*} pulls the path out of $0, cd's into the
# specified directory, then uses $PWD to figure out where that
# directory lives - and all this in a subshell, so we don't affect
# $PWD

GAMEROOT=$(cd "${0%/*}" && echo $PWD)

#determine platform
UNAME=`uname`
if [ "$UNAME" == "Darwin" ]; then
   # Workaround OS X El Capitan 10.11 System Integrity Protection (SIP) which does not allow
   # DYLD_INSERT_LIBRARIES to be set for system processes.
   if [ "$STEAM_DYLD_INSERT_LIBRARIES" != "" ] && [ "$DYLD_INSERT_LIBRARIES" == "" ]; then
      export DYLD_INSERT_LIBRARIES="$STEAM_DYLD_INSERT_LIBRARIES"
   fi
   # prepend our lib path to LD_LIBRARY_PATH
   export DYLD_LIBRARY_PATH="${GAMEROOT}"/bin:"${GAMEROOT}"/bin/osx64:$DYLD_LIBRARY_PATH
elif [ "$UNAME" == "Linux" ]; then
   # prepend our lib path to LD_LIBRARY_PATH
   export LD_LIBRARY_PATH="${GAMEROOT}"/bin:"${GAMEROOT}"/bin/linux64:$LD_LIBRARY_PATH
fi

if [ -z $GAMEEXE ]; then
	if [ "$UNAME" == "Darwin" ]; then
		GAMEEXE=csgo_osx64
	elif [ "$UNAME" == "Linux" ]; then
		GAMEEXE=csgo_linux64
	fi
fi

ulimit -n 2048

# enable nVidia threaded optimizations
export __GL_THREADED_OPTIMIZATIONS=1
# enable Mesa threaded shader compiles
export multithread_glsl_compiler=1

# and launch the game
cd "$GAMEROOT"

STATUS=42
while [ $STATUS -eq 42 ]; do
	if [ "${DEBUGGER}" == "gdb" ]; then
		ARGSFILE=$(mktemp $USER.hl2.gdb.XXXX)
		echo b main > "$ARGSFILE"
		echo run $@ -game csgo >> "$ARGSFILE"
		echo show args >> "$ARGSFILE"
		primusrun ${DEBUGGER} "${GAMEROOT}"/${GAMEEXE} -x "$ARGSFILE" # Launch through NVIDIA
		# ${DEBUGGER} "${GAMEROOT}"/${GAMEEXE} -x "$ARGSFILE"
		rm "$ARGSFILE"
		${DEBUGGER} "${GAMEROOT}"/${GAMEEXE} "$@"
	elif [ "${DEBUGGER}" == "lldb" ]; then
		ARGSFILE=$(mktemp $USER.hl2.lldb.XXXX)
		echo "b main" > "$ARGSFILE"
		echo "env DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH" > "$ARGSFILE"
		${DEBUGGER} -s "$ARGSFILE" -- "${GAMEROOT}"/${GAMEEXE} "$@"
		rm $ARGSFILE
	else
		primusrun ${DEBUGGER} "${GAMEROOT}"/${GAMEEXE} "$@" # Launch through NVIDIA
		# exec ${DEBUGGER} "${GAMEROOT}"/${GAMEEXE} "$@"
	fi
	STATUS=$?
done
exit $STATUS
