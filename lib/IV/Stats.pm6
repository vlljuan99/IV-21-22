unit class IV::Stats;

has @!students;

method new( IO(Str) $file = "proyectos/usuarios.md") {
    @!students = $file.slurp.lines.grep( /"<!--"/ )
        .map( *.split( "--" )[1].split(" ")[3]);
}