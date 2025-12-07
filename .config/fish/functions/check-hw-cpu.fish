function check-hw-cpu --wraps='cpuid -i | grep uarch | head -n 1' --description 'alias check-hw-cpu=cpuid -i | grep uarch | head -n 1'
    cpuid -i | grep uarch | head -n 1 $argv
end
