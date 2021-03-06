function asp -d 'Switches AWS profile' -a 'aws_profile'
    set -x CONFIG_FILE ~/.aws/config
    set -x CREDENTIAL_FILE ~/.aws/credentials

    if test -n "$aws_profile"
        if fgrep -q "[profile $aws_profile]" $CONFIG_FILE
            echo Setting AWS_DEFAULT_PROFILE to $aws_profile
            set -gx AWS_DEFAULT_PROFILE $aws_profile
        else
            echo "Could NOT find profile $aws_profile in config file ($CONFIG_FILE). No profile set"
        end
    end
end
