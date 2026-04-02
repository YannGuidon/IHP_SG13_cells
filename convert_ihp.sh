
# convert_ihp.sh
# created mer. 01 avril 2026 19:26:37 CEST by whygee@f-cpu.org
# it's not optimised. it just works and is run once or twice...

# for the sims, it's just a bit of cleanup and renaming.
for i in cmos5l_gates/sg13cmos5l_*v; do
  sed 's/[/][/].*//' $i |
  sed 's/sg13cmos5l_/sg13_/'
  echo
done > sg13_cells_sim.v


# do the hard work for cmos5l only
for i in cmos5l_gates/sg13cmos5l_*v; do
  DECL=${
    grep 'module sg' $i |
    sed 's/sg13cmos5l_/sg13_/'
  }

  GATE=${ echo $DECL |
    sed 's/.*sg13_//;s/ .*//'
  }

  ARGS=${ echo $DECL |
    sed 's/.*(//;s/).*//' |
    sed 's/\([A-Z_0-9]\+\)/.\1(\1)/g'
  }

  echo $DECL
  # only copies the ports of the actual cells, not the primitives,
  # and expects the next 2 lines after "module" to be the ports
  grep -A2 'module sg' $i | grep -v 'module'
  echo '  (* keep *) sg13cmos5l_'$GATE' ihp('$ARGS');'
  echo "endmodule"
  echo
done > sg13_cells_sg13cmos5l.v

# instead of copy-paste, just sed the result
sed 's/sg13cmos5l_/sg13g2_/' sg13_cells_sg13cmos5l.v > sg13_cells_sg13g2.v

echo ok
