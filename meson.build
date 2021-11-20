project('nvstat', 'vala', 'c')

vapi_dir = meson.current_source_dir() / 'vapi'
add_project_arguments(['--vapidir', vapi_dir], language: 'vala')

dependencies = [
    dependency('glib-2.0'),
    dependency('gobject-2.0'),
    #dependency('libx11-6'),
    #dependency('libxext6'),
    meson.get_compiler('c').find_library('XNVCtrl'),
    meson.get_compiler('c').find_library('X11'),
    meson.get_compiler('vala').find_library('libxnvctrl0', dirs: vapi_dir),
    meson.get_compiler('vala').find_library('x11', dirs: vapi_dir),
]

sources = files('nvstat.vala')

executable('nvstat', sources, dependencies: dependencies)