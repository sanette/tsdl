# Experimental dune version of TSDL

original: https://github.com/dbuenzli/tsdl


## In order to test the experimental version:

```
opam pin https://github.com/sanette/tsdl.git
opam install tsdl.1.2.0-a2386d5.dune
```

## Back to the official version:

```
opam unpin https://github.com/sanette/tsdl.git
```

## Why ?

- This version has been reported to work on Windows-Cygwin (see below)
  (and of course in Linux and Macos too).

- It works with any version of SDL >= 2.0.10.  (Of course, if you have
  a more recent version, more functions will be available)


## SDL and Windows

- As far as I understand, SDL+Windows has some peculiarities that make
  the use of `pkg-config` for finding C-compile flags inappropriate.
  In particular, a problem arises because of the way the `Main` entry
  point is handled. In principle, you may decide (or not) that SDL
  takes care of your Main function, so that it can inject OS specific
  code (for Windows). In this case, you should link with `SDL2main`
  and use the `-mwindows` to tell Windows to use a specific GUI
  startup. (This is what pkg-config suggests.)

  However, most SDL bindings to other languages (`tsdl` for OCaml, but
  also, apparently, bindings for Rust, Zig, Python, Lua) decided not
  to rely on this and instead call `SDL_SetMainReady` at init, to tell
  SDL "we keep our `main` entry point". In this case, Windows should
  not add its GUI startup, so one should **not** link with `SDL2main`,
  nor use the `-mwindows`. Instead, the `-mconsole` flag would be more
  appropriate.

  **=>** In this version I have removed the call to `pkg-config`.

- Another Windows specificity: the "function" `SDL_RWclose`, which on
  Linux/MacOS can be bound (by `tsdl`) via a foreign call, is just a
  *Macro* in the Windows version. Hence the foreign call is not
  recognized, and compilation fails with

```
  Fatal error: exception
  Dl.DL_error("dlsym: The specified procedure could not be found.")
  ```

  **=>** In this version `SDL_RWclose` is implemented in OCaml by
  accessing the `rw_ops_close` entry of the `rw_ops` structure.

## Thanks

Thanks @digitallysane for his patience with numerous tests!
https://github.com/sanette/tsdl-ttf/issues/9
