#!/usr/bin/env bash

set -o pipefail

# Main Menu
menu() {
    printf "======= Man Navigator =======\n"
    printf "\t1. Browse Sections\n"
    printf "\t2. Help\n"
    printf "\t3. Quit\n"
}

# Page indexing
browse() {
    clear

    printf "======= Choose a section (1-9) =======\n"
    printf "\t1. User commands & executables\n"
    printf "\t2. Syscalls\n"
    printf "\t3. Library calls\n"
    printf "\t4. Device files, special files\n"
    printf "\t5. File formats & conventions\n"
    printf "\t6. Games\n"
    printf "\t7. Misc.\n"
    printf "\t8. System administration commands\n"
    printf "\t9. Non-standard kernel routines\n"

    read -rp "> " section
    
    case "$section" in
        1) description="User commands & executables" ;;
        2) description="Syscalls" ;;
        3) description="Library calls" ;;
        4) description="Device/special files" ;;
        5) description="File formats and conventions" ;;
        6) description="Games" ;;
        7) description="Misc." ;;
        8) description="Sysadmin commands" ;;
        9) description="Non-standard kernel routines" ;;
    esac

    if [[ $section -gt 9 ]]; then
        printf "There are only 9 sections."
        return
    elif [[ $section -lt 1 ]]; then
        printf "There are no sections less than 1."
        return
    else
        page=$(fdfind -t f . "/usr/share/man/man$section" | sed "s|.*/||; s/\.$section.*//" | fzf \
            --preview='man {} | col -b' \
            --preview-window='right:70%' \
            --header="Section $section" \
            --header-label="$description" \
            --header-border \
            --border
            )
        man "$page"
    fi
}

main() {
    while true; do
        clear
        menu

        read -rp "> " choice
        
        case "$choice" in
           1) browse ;;
           2) man man ;;
           3) exit 0 ;;
        esac

    done
}

main
