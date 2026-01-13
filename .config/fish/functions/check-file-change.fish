function check-file-change --wraps='auditctl -p wa -k file-change -w' --description 'Monitor file change (wa) using auditctl'

  # Check if the user wants to delete the audit rule
  if test "$argv[1]" = "-d"; or test "$argv[1]" = "--delete"
    # Ensure the second argument is provided (file path)
    if test -z "$argv[2]"
        echo "Error: Please specify the file to delete from audit."
        exit 1
    end

    # Check if the audit rule for the file exists
    set audit_rule (sudo auditctl -l | grep -E "($file_to_audit).*wa")
    if test -z "$audit_rule"
        echo "No audit rule found for '$argv[2]'"
        return 1
    else
        echo "Deleting audit rule for '$argv[2]'"
        sudo auditctl -W $argv[2] -p wa -k "$USER-$key"
    end
    return 0
  end # END_IF

  # Enable auditclt service if not already enabled
  if not systemctl is-active --quiet auditd
    echo "Audit service is not running. Starting it..."
    sudo systemctl enable --now auditd
  end

  # Set the file path to be audited from $argv[1] and key from $argv[2] or default
  set file_to_audit $argv[1]
  set key (if test -n "$argv[2]"; echo "$argv[2]"; else echo "$USER"; end)

  # Check if the file is already being audited
  set audit_rule (sudo auditctl -l | grep -E "($file_to_audit).*wa")

  if test -z "$audit_rule"
    # If the file is not audited, run the auditctl command
    set_color red; echo "Adding audit rule..."; set_color normal;
    sudo auditctl -w $file_to_audit -p wa -k "$USER-$key"
  else
    # If the file is already being audited, show the audit logs
    set_color red; echo "Showing audit logs..."; set_color normal;
    sudo ausearch -k "$USER-$key" -i
  end

  return 0
end
