project('multicell_abm', 'cpp',
		default_options: ['optimization=3',
							'warning_level=3',
							'werror=true',
							'cpp_std=c++11'])

# Define compiler flags
cpp_flags = []

# Add OpenMP as a dependency
omp_dep = dependency('openmp')

# Define debug and optimization flags as options
#debug = get_option('debug')
#optimization = get_option('optimization')

# Set compiler and linker options
#compiler = cc
#linker = cc
compile_args = cpp_flags

# Define project sources
sources = ['Celula.cpp', 'Ciclo.cpp', 'Ciclo_Modelo.cpp',
			'Ciclos_estandares.cpp', 'Contenedor_de_celulas.cpp',
			'Fase.cpp', 'Fase_Link.cpp', 'Fenotipo.cpp', 'Geometria.cpp',
			'Grillado.cpp', 'Main.cpp', 'Mecanica.cpp', 'Microambiente.cpp',
			'Motilidad.cpp', 'Muerte.cpp', 'Muerte_Parametros.cpp',
			'Parametros.cpp', 'Parametros_globales.cpp', 'Random.cpp',
			'Secrecion.cpp', 'Tejido.cpp', 'Vector.cpp', 'Volumen.cpp',
			'Voxel.cpp']
			


# Define the executable target
executable('multicell_abm', sources,
  dependencies: [omp_dep],
  include_directories: ['include'],
  #install: true,
  #install_dir: '/usr/local/bin',
  cpp_args: compile_args,
  #c_link_args: compile_args
)
