(define-module (sangaline packages powerline-go)
  #:use-module (gnu packages golang)
  #:use-module (guix build-system go)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
)

(define-public go-github-com-go-ole-go-ole
  (package
    (name "go-github-com-go-ole-go-ole")
    (version "1.2.5")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/go-ole/go-ole")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "1561h2srxgp4kx7l4q2dsvsh47h8k8ps3xnwjzg76yjvgfsqrlnw"))))
    (build-system go-build-system)
    (arguments
      '(#:import-path "github.com/go-ole/go-ole"))
    (propagated-inputs
      `(("go-golang-org-x-sys" ,go-golang-org-x-sys)))
    (home-page "https://github.com/go-ole/go-ole")
    (synopsis "Go OLE")
    (description
      "Go bindings for Windows COM using shared libraries instead of cgo.")
    (license license:expat)))

(define-public go-github-com-rivo-uniseg
  (package
    (name "go-github-com-rivo-uniseg")
    (version "0.2.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/rivo/uniseg")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "0j7h22vfmjj562vr8gpsyrkrwp1pq9ayh5fylv24skxb467g9f0q"))))
    (build-system go-build-system)
    (arguments
      '(#:import-path "github.com/rivo/uniseg"))
    (home-page "https://github.com/rivo/uniseg")
    (synopsis "Unicode Text Segmentation for Go")
    (description
      "Package uniseg implements Unicode Text Segmentation according to Unicode
Standard Annex #29 (@url{http://unicode.org/reports/tr29/,http://unicode.org/reports/tr29/}).
")
    (license license:expat)))

(define-public go-github-com-mattn-go-runewidth
  (package
    (name "go-github-com-mattn-go-runewidth")
    (version "0.0.13")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/mattn/go-runewidth")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "1yir0f3wc5z5hnkwhvx5qb6nmpfb05zp2gvfjvna63s8kmla1rrn"))))
    (build-system go-build-system)
    (arguments
      '(#:import-path "github.com/mattn/go-runewidth"))
    (propagated-inputs
      `(("go-github-com-rivo-uniseg"
         ,go-github-com-rivo-uniseg)))
    (home-page
      "https://github.com/mattn/go-runewidth")
    (synopsis "go-runewidth")
    (description
      "This package provides functions to get fixed width of the character or string.")
    (license license:expat)))

(define-public powerline-go
  (package
    (name "powerline-go")
    (version "1.21.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/justjanne/powerline-go")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32
            "0c8ycza456ng6a397mjx3dl1ihac7rxfb4jz23vxwx6gbgkciv90"))))
    (build-system go-build-system)
    (arguments
      '(#:import-path
        "github.com/justjanne/powerline-go"))
    (propagated-inputs
      `(("go-gopkg-in-yaml-v2" ,go-gopkg-in-yaml-v2)
        ("go-golang-org-x-text" ,go-golang-org-x-text)
        ("go-golang-org-x-sys" ,go-golang-org-x-sys)
        ("go-golang-org-x-crypto"
         ,go-golang-org-x-crypto)
        ("go-github-com-shirou-gopsutil"
         ,go-github-com-shirou-gopsutil)
        ("go-github-com-mattn-go-runewidth"
         ,go-github-com-mattn-go-runewidth)
        ("go-github-com-go-ole-go-ole"
         ,go-github-com-go-ole-go-ole)))
    (home-page
      "https://github.com/justjanne/powerline-go")
    (synopsis
      "A Powerline style prompt for your shell")
    (description
      "This package provides a @url{https://github.com/Lokaltog/vim-powerline,Powerline} like prompt for Bash,
ZSH and Fish.  Based on @url{https://github.com/banga/powerline-shell,Powerline-Shell} by @banga.
Ported to golang by @justjanne.")
    (license license:gpl3)))

