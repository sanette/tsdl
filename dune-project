(lang dune 3.20)

(name tsdl)
(version "1bf17f5-dune")
(generate_opam_files true)

(source
 (github username/reponame))

(authors "The tsdl programmers")

(maintainers "Daniel Bünzli <daniel.buenzl i@erratique.ch>")

(license ISC)

(documentation https://erratique.ch/software/tsdl/doc/)

(package
 (name tsdl)
 (synopsis "A short synopsis")
 (description "A longer description")
 (tags
  ( "audio"
  "bindings"
  "graphics"
  "media"
  "opengl"
  "input"
  "hci"
  "org:erratique"))

 (depends
  (ocaml (>= 4.14))
   conf-sdl2
   ctypes
  (ctypes-foreign (>= 0.21.1))))


; See the complete stanza docs at https://dune.readthedocs.io/en/stable/reference/dune-project/index.html
