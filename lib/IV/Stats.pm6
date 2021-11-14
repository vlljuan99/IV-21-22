use IO::Glob;

unit class IV::Stats;

has %!students;
has @!objetivos;

method new( Str $file = "proyectos/usuarios.md") {
    my @students = $file.IO.slurp.lines.grep( /"<!--"/ )
        .map( *.split( "--" )[1].split(" ")[3]);
    my %students;
    @students.map: { %students{$_} = { :objetivo(0), :entrega(0) } };
    for glob( "proyectos/objetivo-*.md" ).sort: { $^a cmp $^b} -> $f {
        my ($objetivo) := $f ~~ /(\d+)/;
        my @contenido = $f.IO.lines.grep(/"|"/);
        for @students.kv -> $index, $usuario {
            if ( @contenido[$index + 2] ~~ /"✓"/ ) {
                %students{$usuario}<objetivo> = +$objetivo;
            }
            %students{$usuario}<entrega>++ if @contenido[$index + 2] ~~
                    /"github.com"/;
        }
    }
    self.bless( :%students );
}

submethod BUILD( :%!students) {}

method objetivos-de( Str $user  ) {
    return %!students{$user}<objetivo>;
}

method entregas-de( Str $user ) {
    return %!students{$user}<entrega>;
}