[CCode (cprefix="X", cheader_filename="X11/Xlib.h")]
namespace Xlib {

        [Compact]
        [CCode (cname = "Display", free_function = "XCloseDisplay")]
        public class Display {
                [CCode (cname = "XOpenDisplay")]
                public Display (string? display_name = null);
                [CCode (cname = "XDefaultScreen")]
                public int get_default_screen ();
        }
}