function check-file-change --wraps='auditctl -p wa -k file-change -w' --description 'Monitor file change (wa) using auditctl'

  set help_msg "Help page for $(status current-function)
    Usage: `$(status current-function) [Flag] \$full_file_path`

    You can ether specify a flag or give a file path,
    in the latter case this will ether create an audit rule
    or list logs of a matching audit rule

    | SFlag |    LFlag    | Drescription        |
    | ----- | ----------- | ------------------- |
    | -h    | --help      | This help message   |
    | -d *  | --delete *  | Delete audit rule   |
    | -c    | --clear-log | Rotate logs (clear) |
    | -l    | --list      | List active audits  |

    If you set auditctl in "Read only mode" you can reboot to change it
    "

  # Check if the user wants to delete the audit rule
  switch "$argv[1]"
    case "-h" "--help"
      printf $help_msg;
      return 0;
    case "-l" "--list"
      sudo auditctl -l
      return 0
    case "-c" "--clear-log"
      echo "" | sudo tee "/var/log/audit/audit.log"
      return 0;
    case "-d" "--delete"
      set audit_rule (sudo auditctl -l | grep -E "($file_to_audit)")
      set file_to_audit "$(echo $argv[2] | sed "s@^~@$HOME@")"
      set -l key (if test -n "$argv[3]"; echo "$argv[3]"; else echo "$USER"; end)
      set -l audit_rule (sudo auditctl -l | grep --color=never -E "($file_to_audit)")
      # Ensure the second argument is provided (file path)
      if test -z "$argv[2]"
        echo "Error: Please specify the file to delete from audit."
        return 1
      end
      # Check if the audit rule for the file exists
      if test -z "$audit_rule"
        echo "No audit rule found for '$argv[2]'"
        return 1
      else
        echo "Deleting audit rule for '$argv[2]'"
       #sudo auditctl -d $file_to_audit -k "$key"
        sudo auditctl -d exit,always -F "perm=wa" -F "path=$file_to_audit" -k "$key"
        sudo systemctl restart auditd.service >/dev/null 2>/dev/null
      end
      return 0;
    case '*'
      set audit_rule (sudo auditctl -l | grep -E "($file_to_audit)")
      set file_to_audit "$(echo $argv[1] | sed "s@^~@$HOME@")"
      set key (if test -n "$argv[2]"; echo "$argv[2]"; else echo "$USER"; end)
  end

  # Enable auditclt service if not already enabled
  if not systemctl is-active --quiet auditd
    echo "Audit service is not running. Starting it..."
    sudo systemctl enable --now auditd
  end

  # Check if the file is already being audited
  if test "$audit_rule" = "No rules" || test -z "$audit_rule"
    # If the file is not audited, run the auditctl command
    set_color red; echo "Adding audit rule..."; set_color normal;
    sudo auditctl -a exit,always -F "perm=wa" -F "path=$file_to_audit" -k "$key"
    sudo systemctl restart auditd.service >/dev/null 2>/dev/null
  else
    # If the file is already being audited, show the audit logs
    set_color red; echo "Showing audit logs..."; set_color normal;
    sudo ausearch -k "$key" -i
  end

  return 0
end
