open Tsdl

let err = 0 (* 0 for making CI happy, otherwise put 1 *)

let main () = match Sdl.init Sdl.Init.(video + events) with
| Error (`Msg e) -> Sdl.log "Init error: %s" e; err
| Ok () ->
    match Sdl.create_window ~w:640 ~h:480 "SDL OpenGL" Sdl.Window.opengl with
    | Error (`Msg e) -> Sdl.log "Create window error: %s" e; err
    | Ok w ->
        Sdl.pump_events ();
        Sdl.delay 3000l;
        Sdl.destroy_window w;
        Sdl.quit ();
        0

let () = if !Sys.interactive then () else exit (main ())
