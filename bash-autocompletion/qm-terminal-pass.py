_qmterminalpass()
{
        local cur="${COMP_WORDS[COMP_CWORD]}"
        COMPREPLY=()
        case $COMP_CWORD in
        1)
                local vmids=$(TERM= qm list|tail -n+2|sed 's/^ \+//'|cut -d' ' -f1)
                COMPREPLY=( $(compgen -W "$vmids" "$cur" ) )
                ;;
        2)
                local passes=$(TERM= pass list|tail -n+2|sed 's/^....//'|sed 's/\x1B\[[0-9;]*[JKmsu]//g')
                COMPREPLY=( $(compgen -W "$passes" "$cur" ) )
                ;;
        *)
                ;;
        esac
        return 0
}

complete -F _qmterminalpass ./qm-terminal-pass.py

