# generate a square wave signal

# -----------------------------
# ----- user parameters -------
# -----------------------------

if {$argc != 3} {
	puts "ERROR: wrong number of args provided"
	exit 1
} else {
	set ip_dir [lindex $argv 0]
	set sources_dir [lindex $argv 1]
	set board_name [lindex $argv 2]
}

# -----------------------------
# --------- functions ---------
# -----------------------------

proc concat_str {args} {
	return [join $args ""]
}

# -----------------------------
# ----- local parameters ------
# -----------------------------

# name of this IP
set project_name square_wave

# project directory
set project_dir [concat_str $ip_dir / $project_name]

# sources directory
set build_sources_dir [concat_str $project_dir / $project_name .srcs/sources_1]

# -----------------------------
# --------- create IP ---------
# -----------------------------

file mkdir $project_dir
cd $project_dir

create_project $project_name
set_property board_part $board_name [current_project]

# set simulation time
set_property -name {xsim.simulate.runtime} -value [concat_str [expr 100.0] ms] -objects [get_filesets sim_1]

# create sources directory
file mkdir $build_sources_dir

# copy source files to project
file copy [concat_str $sources_dir /clogb2.vh] $build_sources_dir
file copy [concat_str $sources_dir /square_wave.v] $build_sources_dir

# add source files to project
add_files -norecurse [concat_str $build_sources_dir /clogb2.vh]
add_files -norecurse [concat_str $build_sources_dir /square_wave.v]
# for adding simulation files
#add_files -fileset sim_1 -norecurse [concat_str $build_sources_dir /tb.v]

# -----------------------------
# -------- package IP ---------
# -----------------------------

update_compile_order -fileset sources_1
ipx::package_project -root_dir $build_sources_dir -vendor vendor_name -library library_name -taxonomy /UserIP
set_property company_url "http://www.vendor_website.com" [ipx::current_core]
set_property vendor_display_name "Vendor Name" [ipx::current_core]
ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::save_core [ipx::current_core]