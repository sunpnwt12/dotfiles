if status is-interactive
    # Commands to run in interactive sessions can go here
end

function ll
    command exa -la $argv
end

set -x JAVA_HOME "/usr/lib/jvm/java-1.17.0-openjdk-amd64"
